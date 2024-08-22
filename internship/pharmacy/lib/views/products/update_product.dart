import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmacy/controllers/products_controller.dart';
import 'package:pharmacy/controllers/users_controller.dart';
import 'package:pharmacy/models/products.dart';
import 'package:pharmacy/models/users.dart';

class UpdateProduct extends StatefulWidget {
  final String productCode;
  const UpdateProduct({super.key, required this.productCode});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  late TextEditingController _productCodeController;

  final TextEditingController _productName = TextEditingController();

  final TextEditingController _purchasePrice = TextEditingController();

  final TextEditingController _quantity = TextEditingController();

  final TextEditingController _expiryDate = TextEditingController();

  DateTime? _selectedDate;
  @override
  void dispose() {
    // TODO: implement dispose
    _productCodeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productCodeController = TextEditingController(text: widget.productCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 237, 237),
      body: Stack(
        children: [
          Positioned.fill(
              child: Center(
            child: Opacity(
              opacity: 0.2,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/logo-no-background.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const Text(
                      'YEREMIYA PHARMACY',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 73, 71, 71)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Modifier les informations du produit',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 200.0),
                      child: Text(
                        'Code du produit',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _productCodeController,
                      cursorColor: Colors.grey,
                      enabled: false,
                      decoration: InputDecoration(
                        // labelText: 'Tél',
                        // labelStyle: const TextStyle(
                        //   color: Color.fromARGB(255, 177, 223, 179),
                        // ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60.0),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: const Icon(
                          Icons.qr_code,
                          color: Colors.blue,
                        ),
                        //floatingLabelBehavior: FloatingLabelBehavior.never
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 200.0),
                      child: Text(
                        'Nom du produit',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _productName,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        //labelText: 'Mot de passe',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60.0),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.medication_liquid_sharp,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 230.0),
                      child: Text(
                        'Prix d\'achat',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _purchasePrice,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        //labelText: 'Noms',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60.0),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.monetization_on, // Adjust icon as needed
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 250.0),
                      child: Text(
                        'Quantité',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _quantity,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        // labelText: 'Point de vente',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60.0),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.numbers, // Adjust icon as needed
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 200.0),
                      child: Text(
                        'Date d\'expiration',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _expiryDate,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        // labelText: 'Role',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60.0),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.calendar_today, // Adjust icon as needed
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050),
                            initialDate: DateTime.now());
                        if (pickedDate != null) {
                          setState(() {
                            _selectedDate = pickedDate;
                            _expiryDate.text = _selectedDate!
                                .toIso8601String()
                                .split('T')
                                .first;
                          });
                        }
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // String productCode = _productCode.text;
                        String productName = _productName.text;
                        String quantityStr = _quantity.text;
                        String purchasePriceStr = _purchasePrice.text;
                        String expiryDateStr = _expiryDate.text;

                        int quantity = int.tryParse(quantityStr) ?? 0;
                        DateTime? expiryDate = expiryDateStr.isNotEmpty
                            ? DateTime.tryParse(expiryDateStr)
                            : null;
                        double purchasePrice =
                            double.tryParse(purchasePriceStr) ?? 0.0;

                        Product updatedProduct = Product(
                            productCode: widget.productCode,
                            productName: productName,
                            purchasePrice: purchasePrice,
                            expiryDate: expiryDate,
                            quantity: quantity);
                        ProductsController().updateProduct(updatedProduct, () {
                          Fluttertoast.showToast(msg: 'Données modifiées');
                        });
                        _expiryDate.clear();
                        //  _productCode.clear();
                        _productName.clear();
                        _purchasePrice.clear();
                        _quantity.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        'Modifier',
                        style: TextStyle(
                          color: Color.fromARGB(255, 238, 237, 237),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
