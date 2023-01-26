import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Shop/constans.dart';
import 'package:myapp/Shop/product_image.dart';
import 'package:myapp/secreens/login.dart';

class DetailsBody extends StatefulWidget {
  DetailsBody({super.key, this.product, this.id});
  var product;
  var id;
  // var type;

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  bool auth = false;
  bool admin = false;
  @override
  void initState() {
    // check if user is logged in
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get()
            .then((value) {
          if(value["isAdmin"] == true){
            setState(() {
              admin = true;
            });
          }
        });
        setState(() {
          auth = true;
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: 
               IconButton(
                  alignment: Alignment.topRight,
                  onPressed: (() {
                    FirebaseFirestore.instance
                        .collection("shop")
                        .doc(widget.id)
                        .delete()
                        .then((value) => Navigator.pop(context));
                  }),
                  icon: Icon(Icons.delete))
            
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5,
          ),
          decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: ProductImage(
                      Tag: "${widget.product!['title']}",
                      image: "${widget.product!['image']}",
                      size: size)),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding / 2,
                ),
                child: Text(
                  "${widget.product!['title']}",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                "Price: ${widget.product['price']}\$",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Text(
                "${widget.product['description']}",
                style: const TextStyle(
                  color: kTextLightColor,
                ),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              auth
                  ? ElevatedButton(
                      child: const Text('Add to cart'),
                      onPressed: (() {
                        FirebaseFirestore.instance.collection('cart').add({
                          'title': widget.product['title'],
                          'product': widget.id,
                          'price': widget.product['price'],
                          'image': widget.product['image'],
                          'user': FirebaseAuth.instance.currentUser!.uid,
                          'quantity': 1,
                        }).then((value) => Navigator.pop(context));
                      }),
                    )
                  : ElevatedButton(
                      child: const Text('Login to add to cart'),
                      onPressed: (() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: ((context) {
                          return const Login_screen();
                        })));
                      }),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
