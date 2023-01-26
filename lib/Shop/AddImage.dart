import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  AddImage({super.key, required this.form, required this.AddItemToCart});
  Function AddItemToCart;
  final form;

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 150,
          height: 50,
            child: ElevatedButton(
              onPressed: () {
                myAlert();
              },
              child:  Row(
                children: [
                  Text('Upload Photo'),
                  Icon(Icons.download)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //if image not null show the image
          //if image null show text
          image != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      //to show image, you type like this.
                      File(image!.path),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  ),
                )
              : const Text(
                  "No Image",
                  style: TextStyle(fontSize: 20),
                ),
              Container(width: 110,
              height: 50,
                child: ElevatedButton(
                  
                  
                  
                  onPressed: () {
                    if (widget.form.currentState!.validate()) {
                      widget.form.currentState
                      !.save();
                      widget.AddItemToCart(image);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child:  Row(children: [Text("Submit"), Icon(Icons.add_box),]),
                ),
              ),
        ],
      ),
    );
  }
}
