import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/product.dart';
import 'package:gereaciando_estado/presenter/controllers/pruduct_form_screem_controller.dart';

class ProductFormScreen extends StatefulWidget {
  final PruductFormScreemController controller;
  const ProductFormScreen({@required this.controller});
  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  PruductFormScreemController _controller;
  final formData = Map<String, dynamic>();

  void initForm() {
    if (_controller.formData.isEmpty) {
      final ProductModal product =
          ModalRoute.of(context).settings.arguments as ProductModal;
      if (product != null) {
        _controller.formData["id"] = product.id;
        _controller.formData["title"] = product.title;
        _controller.formData["description"] = product.description;
        _controller.formData["price"] = product.price.toString();
        _controller.imagemController.text = product.imageUrl;
      }
    }
  }

  // regra de UI
  void updadeImgUrl() {
    if (_controller.isValidImgUrl(_controller.imagemController.text)) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.imagemFocusNode.addListener(updadeImgUrl);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initForm();
  }

  @override
  void dispose() {
    _controller.priceFocusNode.dispose();
    _controller.descriptionFocusNode.dispose();
    _controller.imagemFocusNode.dispose();
    _controller.imagemFocusNode.removeListener(updadeImgUrl);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _controller.saveForm(context),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: _controller.formKey,
          child: ListView(
            children: [
              buildTextFormField(
                context,
                actionFocusNode: _controller.priceFocusNode,
                labelText: "Titulo",
                chaveData: "title",
                initialValue: _controller.formData["title"],
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "informe o titulo";
                  } else if (value.trim().length <= 3) {
                    return "informe um nome valido";
                  }
                  return null;
                },
              ),
              buildTextFormField(
                context,
                focusNode: _controller.priceFocusNode,
                actionFocusNode: _controller.descriptionFocusNode,
                labelText: "preco",
                chaveData: "price",
                initialValue: _controller.formData["price"],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value.isEmpty) {
                    return "informe o preco";
                  } else if (double.parse(value) <= 0) {
                    return "informe um preco maior que zero";
                  }
                  return null;
                },
              ),
              buildTextFormField(
                context,
                focusNode: _controller.descriptionFocusNode,
                actionFocusNode: _controller.imagemFocusNode,
                labelText: "descricao",
                chaveData: "description",
                initialValue: _controller.formData["description"],
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value.isEmpty) {
                    return "informe a descricao";
                  }
                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller.imagemController,
                      decoration: InputDecoration(labelText: "URL da imagem"),
                      focusNode: _controller.imagemFocusNode,
                      onSaved: (newValue) =>
                          _controller.formData["imageUrl"] = newValue,
                      onFieldSubmitted: (_) => _controller.saveForm(context),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "informe um URL";
                        }
                        if (!_controller.isValidImgUrl(value)) {
                          return "informe uma URL valida";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 8, left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: _controller.imagemController.text.isEmpty
                        ? Text("Informe a URL")
                        : Container(
                            child: Image.network(
                              _controller.imagemController.text,
                              fit: BoxFit.contain,
                            ),
                          ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // widgets builds
  TextFormField buildTextFormField(
    BuildContext context, {
    String labelText,
    String chaveData,
    FocusNode focusNode,
    FocusNode actionFocusNode,
    TextInputType keyboardType,
    int maxLines,
    String initialValue,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) =>
          FocusScope.of(context).requestFocus(actionFocusNode),
      onSaved: (newValue) => _controller.formData["$chaveData"] = newValue,
      validator: validator,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLines: maxLines,
      initialValue: initialValue,
    );
  }
}
