import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/Shop/constans.dart';

import 'details_body.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({
    super.key,
    this.product,
    this.id,
  });
  static const String screenRoute = "DetailsSceen";

  var product;
  var id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: DetailsAppbar(context),
      body: DetailsBody(
        product: widget.product,
        id: widget.id,
      ),
    );
  }

  AppBar DetailsAppbar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        padding: EdgeInsets.only(
          right: kDefaultPadding,
        ),
        icon: Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
        onPressed: (() {
          Navigator.pop(context);
        }),
      ),
      title: Text(
        "Back",
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
