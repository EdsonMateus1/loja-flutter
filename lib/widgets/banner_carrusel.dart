import 'package:flutter/material.dart';

class BannerCarrusel extends StatelessWidget {
  const BannerCarrusel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        SizedBox(
          child: Image.network(
            "https://png.pngtree.com/png-clipart/20190925/original/pngtree-big-sale-banner-promotion-background-with-gradient-abstract-shape-png-image_4979821.jpg",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          child: Image.network(
            "https://image.freepik.com/vetores-gratis/modelo-de-banner-de-promocao-de-venda-abstrata_23-2148210826.jpg",
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
