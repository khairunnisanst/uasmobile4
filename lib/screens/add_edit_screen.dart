import 'package:flutter/material.dart';
import 'package:inventory/services/api_services.dart';
import 'package:inventory/models/item.dart';
import '/widgets/loading_indicator.dart';

class AddEditScreen extends StatefulWidget {
  final Item? item;

  AddEditScreen({this.item});

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _kodeController = TextEditingController();
  final _namaController = TextEditingController();
  final _qtyController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _kodeController.text = widget.item!.kode;
      _namaController.text = widget.item!.nama;
      _qtyController.text = widget.item!.qty.toString();
    }
  }

  @override
  void dispose() {
    _kodeController.dispose();
    _namaController.dispose();
    _qtyController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final newItem = Item(
        id: widget.item?.id ?? 0,
        kode: _kodeController.text,
        nama: _namaController.text,
        qty: int.parse(_qtyController.text),
      );

      try {
        if (widget.item == null) {
          await ApiService().createItem(newItem);
        } else {
          await ApiService().updateItem(newItem);
        }
        Navigator.pop(context, true);
      } catch (e) {
        // Handle error
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text(
          widget.item == null ? 'Add Item' : 'Edit Item',
          style: TextStyle(color: Colors.white), // Ubah warna teks judul
        ),
        backgroundColor: Colors.blue, // Ubah warna latar belakang app bar
      ),
      body: _isLoading
          ? Center(
              child: LoadingIndicator(), // Tampilkan LoadingIndicator jika sedang loading
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blueAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _kodeController,
                        decoration: InputDecoration(
                          labelText: 'Kode',
                          labelStyle: TextStyle(color: Colors.white), // Ubah warna teks label
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white), // Ubah warna teks input
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter kode';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama',
                          labelStyle: TextStyle(color: Colors.white), // Ubah warna teks label
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white), // Ubah warna teks input
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter nama';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _qtyController,
                        decoration: InputDecoration(
                          labelText: 'Qty',
                          labelStyle: TextStyle(color: Colors.white), // Ubah warna teks label
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white), // Ubah warna teks input
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter qty';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Save'),
                        style: ElevatedButton.styleFrom(
                          iconColor: Colors.white, // Ubah warna background button
                          //onPrimary: Colors.blue, // Ubah warna teks button
                        ),
                      ),
                    ],
                  ),
=======
        title: Text(widget.item == null ? 'Add Item' : 'Edit Item'),
      ),
      body: _isLoading
          ? LoadingIndicator()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _kodeController,
                      decoration: InputDecoration(labelText: 'Kode'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter kode';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(labelText: 'Nama'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter nama';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _qtyController,
                      decoration: InputDecoration(labelText: 'Qty'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter qty';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Save'),
                    ),
                  ],
>>>>>>> f339b0bd9b49d784d7662b1ad17cfdc99e1af99b
                ),
              ),
            ),
    );
  }
}
