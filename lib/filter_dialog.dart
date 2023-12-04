// filter_dialog.dart

import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  final bool isSellingOnly;

  FilterDialog(this.isSellingOnly);

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Options'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            title: Text('Show only selling items'),
            value: widget.isSellingOnly,
            onChanged: (value) {
              // 여기에서 필터 설정 변경 로직을 추가하세요.
              Navigator.of(context).pop(value);
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // 여기에서 필터 적용 로직을 추가하세요.
            Navigator.of(context).pop(widget.isSellingOnly);
          },
          child: Text('Apply'),
        ),
      ],
    );
  }
}
