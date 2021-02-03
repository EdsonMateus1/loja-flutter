import 'package:flutter/material.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imagemFocusNode = FocusNode();
  final _imagemController = TextEditingController();

  void _updadeImgUrl() {
    setState(() {});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de produtos'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Titulo"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(_priceFocusNode),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Preco"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(_descriptionFocusNode),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Descricao"),
                focusNode: _descriptionFocusNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(_imagemFocusNode),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _imagemController,
                      decoration: InputDecoration(labelText: "URL da imagem"),
                      focusNode: _imagemFocusNode,
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
