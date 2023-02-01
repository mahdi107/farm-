import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../secreens/Drawer_screen.dart';
import 'AddImage.dart';

// ignore: must_be_immutable
class CreateNewFile extends StatelessWidget {
  CreateNewFile({super.key, });
  

  bool isNumeric(String s) {
    // ignore: unnecessary_null_comparison
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    var TitleController = TextEditingController();
    var PriceController = TextEditingController();
    var descriptionController = TextEditingController();
    
    void AddItemToCart(image) async {
      print(image);
  
      var fileName = image.path.split('/').last;
      var file = File(image.path);
      var ref = FirebaseStorage.instance.ref().child(fileName);
      var uploadTask = ref.putFile(file);
      var url = await (await uploadTask).ref.getDownloadURL();

      var title = TitleController.text;
      var price = PriceController.text;
      var description = descriptionController.text;
      var data = {
        'title': title,
        'price': price,
        'description': description,
        'image': url,
      };
      FirebaseFirestore.instance
          .collection('shop')
          .add(data)
          .then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Item Added'),
                  ),
                )
              })
          .catchError((error) => {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error'),
                  ),
                )
              });
    }



    return Scaffold(
      appBar:  AppBar(backgroundColor:  Color.fromARGB(255, 156, 182, 255)),
       drawer: const Drawer_screen(),
      body: Container(
        child: Form(
          key: form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:20 ,),
                Container(
                   padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    controller: TitleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                     decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    labelText: "Title",
                    labelStyle: TextStyle(fontSize: 20),
                    fillColor: Color(0xfff3f3f4),
                    filled: true),
                  ),
                ),
                SizedBox(height:20 ,),
                Container(
                   padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    controller: PriceController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty || !isNumeric(value)) {
                        return 'Please enter price';
                      }
                      return null;
                    },
                      decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                    labelText: "price",
                    labelStyle: TextStyle(fontSize: 20),
                    fillColor: Color(0xfff3f3f4),
                    filled: true),
                  ),
                ),
                SizedBox(height:20 ,),
                Container(
                   padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                    ),
                   labelText: "Discribtion",
                    labelStyle: TextStyle(fontSize: 20),
                    fillColor: Color(0xfff3f3f4),
                    filled: true),
                  ),
                ),
                AddImage(form: form, AddItemToCart: AddItemToCart),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
