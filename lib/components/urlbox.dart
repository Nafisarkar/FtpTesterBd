import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class Urlbox extends StatefulWidget {
  const Urlbox({
    super.key,
    required this.url,
    this.backgroundcolor = Colors.redAccent,
  });

  final String url;
  final Color backgroundcolor;

  @override
  UrlboxState createState() => UrlboxState();
}

class UrlboxState extends State<Urlbox> {
  Color _blockColor = Colors.redAccent;
  // ignore: unused_field
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    try {
      final response = await http.head(Uri.parse(widget.url));
      if (response.statusCode == 200) {
        setState(() {
          _isConnected = true;
          _blockColor = Colors.green[300] ?? Colors.greenAccent;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: widget.url));
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Copied to clipboard'),
            ),
          );
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 40,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _blockColor,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(widget.url),
      ),
    );
  }
}
