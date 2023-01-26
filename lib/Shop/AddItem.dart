import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  const AddItem({super.key});

  @override
  
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Container(
      child:Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Item Name',
                
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty  ) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Item Price',
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Item Description',
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}