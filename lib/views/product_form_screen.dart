import 'package:flutter/material.dart';
import 'package:gereaciando_estado/controllers/pruduct_form_screem_controller.dart';
import 'package:gereaciando_estado/models/product.dart';
import 'package:gereaciando_estado/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final controller = PruductFormScreemController();

  void updadeImgUrl() {
    if (controller.isValidImgUrl(controller.imagemController.text)) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller.imagemFocusNode.addListener(updadeImgUrl);
  }

  @override
  void dispose() {
    controller.priceFocusNode.dispose();
    controller.descriptionFocusNode.dispose();
    controller.imagemFocusNode.dispose();
    controller.imagemFocusNode.removeListener(updadeImgUrl);
    super.dispose();
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
      onSaved: (newValue) => controller.formData["$chaveData"] = newValue,
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
            onPressed: () => controller.saveForm(context),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              buildTextFormField(
                context,
                actionFocusNode: controller.priceFocusNode,
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
                focusNode: controller.priceFocusNode,
                actionFocusNode: controller.descriptionFocusNode,
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
                focusNode: controller.descriptionFocusNode,
                actionFocusNode: controller.imagemFocusNode,
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
                      controller: controller.imagemController,
                      decoration: InputDecoration(labelText: "URL da imagem"),
                      focusNode: controller.imagemFocusNode,
                      onSaved: (newValue) =>
                          controller.formData["imageUrl"] = newValue,
                      onFieldSubmitted: (_) =>
                          () => controller.saveForm(context),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "informe um URL";
                        }
                        if (!controller.isValidImgUrl(value)) {
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
                    child: controller.imagemController.text.isEmpty
                        ? Text("Informe a URL")
                        : FittedBox(
                            child: Image.network(
                              controller.imagemController.text,
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
