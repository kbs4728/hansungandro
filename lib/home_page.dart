import 'package:flutter/material.dart';
import 'sale_list_page.dart';
import 'filter_dialog.dart';
import 'add_sale_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSellingOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sale List'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () async {
              final result = await showDialog<bool>(
                context: context,
                builder: (context) => FilterDialog(isSellingOnly),
              );

              if (result != null && result != isSellingOnly) {
                setState(() {
                  isSellingOnly = result;
                });
              }
            },
          ),
        ],
      ),
      body: SaleListPage(isSellingOnly: isSellingOnly),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSalePage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

