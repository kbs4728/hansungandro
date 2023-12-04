// add_sale_page.dart

import 'package:flutter/material.dart';

class AddSalePage extends StatefulWidget {
  @override
  _AddSalePageState createState() => _AddSalePageState();
}

class _AddSalePageState extends State<AddSalePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Sale'),
      ),
      body: Center(
        child: Text('Add Sale Page'),
      ),
    );
  }
}
