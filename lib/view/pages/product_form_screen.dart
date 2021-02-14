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
  final formKey = GlobalKey<FormState>();
  final formData = Map<String, dynamic>();
  final imagemController = TextEditingController();
  final priceFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  final imagemFocusNode = FocusNode();

  void initForm() {
    if (formData.isEmpty) {
      final ProductModal product =
          ModalRoute.of(context).settings.arguments as ProductModal;
      if (product != null) {
        formData["id"] = product.id;
        formData["title"] = product.title;
        formData["description"] = product.description;
        formData["price"] = product.price.toString();
        imagemController.text = product.imageUrl;
      }
    }
  }

  // regra de UI
  void updadeImgUrl() {
    if (_controller.isValidImgUrl(imagemController.text)) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    imagemFocusNode.addListener(updadeImgUrl);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //didChangeDependencies , initForm e chamado aqui pois
    //temos um contexto associado a esse widget ja criado
    // no initState nao temos um contexto criado, pois o initState
    // e chamando antes da criacao de um estado e consequentimete de um contexto
    initForm();
  }

  @override
  void dispose() {
    priceFocusNode.dispose();
    descriptionFocusNode.dispose();
    imagemFocusNode.dispose();
    imagemFocusNode.removeListener(updadeImgUrl);
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
            onPressed: () => _controller.saveForm(
              context: context,
              formData: formData,
              formKey: formKey,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              buildTextFormField(
                context,
                actionFocusNode: priceFocusNode,
                labelText: "Titulo",
                chaveData: "title",
                initialValue: formData["title"],
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
                focusNode: priceFocusNode,
                actionFocusNode: descriptionFocusNode,
                labelText: "preco",
                chaveData: "price",
                initialValue: formData["price"],
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
                focusNode: descriptionFocusNode,
                actionFocusNode: imagemFocusNode,
                labelText: "descricao",
                chaveData: "description",
                initialValue: formData["description"],
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
                      controller: imagemController,
                      decoration: InputDecoration(labelText: "URL da imagem"),
                      focusNode: imagemFocusNode,
                      onSaved: (newValue) => formData["imageUrl"] = newValue,
                      onFieldSubmitted: (_) => _controller.saveForm(
                        context: context,
                        formData: formData,
                        formKey: formKey,
                      ),
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
                    child: imagemController.text.isEmpty
                        ? Text("Informe a URL")
                        : Container(
                            child: Image.network(
                              imagemController.text,
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
      onSaved: (newValue) => formData["$chaveData"] = newValue,
      validator: validator,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLines: maxLines,
      initialValue: initialValue,
    );
  }
}
