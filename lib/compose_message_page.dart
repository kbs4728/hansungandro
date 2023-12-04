import 'package:flutter/material.dart';
import 'sale_post.dart'; // 판매 글 모델 임포트
import 'message.dart'; // Message 모델 임포트
import 'message_service.dart'; // MessageService 임포트

class ComposeMessagePage extends StatefulWidget {
  final SalePost salePost; // SalePost 추가

  ComposeMessagePage(this.salePost); // 생성자 추가

  @override
  _ComposeMessagePageState createState() => _ComposeMessagePageState();
}

class _ComposeMessagePageState extends State<ComposeMessagePage> {
  final TextEditingController _messageController = TextEditingController();
  final MessageService _messageService = MessageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메시지 작성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('상대방: ${widget.salePost.seller}'), // 판매 글의 판매자 정보 표시
            SizedBox(height: 16),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: '메시지'),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final message = Message(
                  sender: '현재 사용자', // TODO: 실제 사용자로 교체하세요.
                  content: _messageController.text,
                  timestamp: DateTime.now(),
                );

                _messageService.sendMessage(message);

                Navigator.pop(context); // 메시지 작성 페이지 닫기
              },
              child: Text('메시지 보내기'),
            ),
          ],
        ),
      ),
    );
  }
}
