import 'package:flutter/material.dart';
import 'package:gereaciando_estado/models/product.dart';
import 'package:gereaciando_estado/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imagemFocusNode = FocusNode();
  final _imagemController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, dynamic>();

  void _updadeImgUrl() {
    if (isValidImgUrl(_imagemController.text)) {
      setState(() {});
    }
  }

  bool isValidImgUrl(String url) {
    bool isValidUrl = url.toLowerCase().startsWith("http://") ||
        url.toLowerCase().startsWith("https://");
    bool isValidImg =
        url.endsWith(".png") || url.endsWith(".jpg") || url.endsWith(".jpeg");
    return isValidUrl && isValidImg;
  }

  void _saveForm() {
    bool isValid = _form.currentState.validate();
    if (!isValid) return;
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context, listen: false);
    _form.currentState.save();
    final ProductModal product = ProductModal.fromJson(_formData);
    productsProvider.addProduct(product);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _imagemFocusNode.addListener(_updadeImgUrl);
  }

  @override
  void dispose() {
    super.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imagemFocusNode.removeListener(_updadeImgUrl);
    _imagemFocusNode.dispose();
  }

  // widgets builds
  TextFormField buildTextFormField(
    BuildContext context, {
    String labelText,
    String chaveData,
    FocusNode focusNode,
    FocusNode actionFocusNode,
    TextInputType keyboardType,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) =>
          FocusScope.of(context).requestFocus(actionFocusNode),
      onSaved: (newValue) => _formData["$chaveData"] = newValue,
      validator: validator,
      focusNode: focusNode,
      keyboardType: keyboardType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              buildTextFormField(
                context,
                actionFocusNode: _priceFocusNode,
                labelText: "Titulo",
                chaveData: "title",
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "informe o titulo";
                  }
                  if (value.trim().length <= 3) {
                    return "informe um nome valido";
                  }
                  return null;
                },
              ),
              buildTextFormField(
                context,
                focusNode: _priceFocusNode,
                actionFocusNode: _descriptionFocusNode,
                labelText: "preco",
                chaveData: "price",
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value.isEmpty) {
                    return "informe o preco";
                  }
                  return null;
                },
              ),
              buildTextFormField(
                context,
                focusNode: _descriptionFocusNode,
                actionFocusNode: _imagemFocusNode,
                labelText: "descricao",
                chaveData: "description",
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
                      controller: _imagemController,
                      decoration: InputDecoration(labelText: "URL da imagem"),
                      focusNode: _imagemFocusNode,
                      onSaved: (newValue) => _formData["imageUrl"] = newValue,
                      onFieldSubmitted: (_) => _saveForm,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "informe um URL";
                        }
                        if (!isValidImgUrl(value)) {
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
                    child: _imagemController.text.isEmpty
                        ? Text("Informe a URL")
                        : FittedBox(
                            child: Image.network(
                              _imagemController.text,
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
}
