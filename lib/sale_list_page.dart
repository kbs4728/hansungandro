import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaleListPage extends StatefulWidget {
  final bool isSellingOnly;

  SaleListPage({required this.isSellingOnly});

  @override
  _SaleListPageState createState() => _SaleListPageState();
}

class SalePost {
  final String id;
  final String title;
  final String description;
  final String sellerId;
  final bool isSelling;

  SalePost({
    required this.id,
    required this.title,
    required this.description,
    required this.sellerId,
    required this.isSelling,
  });
}

class _SaleListPageState extends State<SaleListPage> {
  // 판매 글 목록을 가져오는 로직을 추가하세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 추가: Scaffold 내부에 AppBar를 추가
        title: Text('Sale List Page'),
      ),
      body: _buildSaleList(), // 변경: Center 및 Text 위젯 대신 _buildSaleList() 호출
    );
  }

  Widget _buildSaleList() {
    CollectionReference salesCollection = FirebaseFirestore.instance.collection('sales');

    Query saleQuery = widget.isSellingOnly
        ? salesCollection.where('isSelling', isEqualTo: true)
        : salesCollection;

    return StreamBuilder<QuerySnapshot>(
      stream: saleQuery.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        var sales = snapshot.data!.docs;
        List<Widget> saleItems = [];
        for (var sale in sales) {
          var saleData = sale.data() as Map<String, dynamic>;
          var saleItem = ListTile(
            title: Text(saleData['title']),
            subtitle: Text(saleData['description']),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SendMessagePage(
                      sellerId: saleData['sellerId'],
                    ),
                  ),
                );
              },
              child: Text('메시지 보내기'),
            ),
          );
          saleItems.add(saleItem);
        }

        return ListView(
          children: saleItems,
        );
      },
    );
  }
}


class SendMessagePage extends StatefulWidget {
  final String sellerId;

  SendMessagePage({required this.sellerId});

  @override
  _SendMessagePageState createState() => _SendMessagePageState();
}

class _SendMessagePageState extends State<SendMessagePage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메시지 보내기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: '메시지 내용'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 메시지를 Firestore에 저장하는 로직 추가
                _sendMessage();
                // 화면을 이전 화면으로 돌아가게 함
                Navigator.pop(context);
              },
              child: Text('메시지 전송'),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    // Firestore에 메시지 저장 로직 추가
    // widget.sellerId에는 메시지를 받을 판매자의 ID가 들어 있음
    FirebaseFirestore.instance.collection('messages').add({
      'sellerId': widget.sellerId,
      'message': _messageController.text,
    });
  }
}