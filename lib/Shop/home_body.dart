import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:myapp/Shop/constans.dart';
import 'package:myapp/Shop/details_screen.dart';
import 'package:myapp/Shop/product_cart.dart';

class HomeBody extends StatelessWidget {
   HomeBody({super.key, 
  //  required this.shop
   });
  //  String shop;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream =
        FirebaseFirestore.instance.collection('shop').snapshots();
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: _productsStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                        return productCard(
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return DetailsScreen(
                              product: data,
                              id: document.id,
                             
                            );
                          })));
                        },
                        product: data,
                      );
                    }).toList());
                  },
                ),
  
              ],
            ),
          )
        ],
      ),
    );
  }
}
