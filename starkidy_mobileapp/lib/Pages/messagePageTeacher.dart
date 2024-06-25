import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import for formatting the time

class MessagePageTeacher extends StatefulWidget {
  final String personName;

  MessagePageTeacher({required this.personName});

  @override
  _MessagePageStateTeacher createState() => _MessagePageStateTeacher();
}

class _MessagePageStateTeacher extends State<MessagePageTeacher> {
  final List<Map<String, dynamic>> messages = [];
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.personName),
        backgroundColor: Color.fromRGBO(90, 158, 183, 1),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return _buildMessageBubble(message['sender'], message['text'], message['time']);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String sender, String text, String time) {
    final isMe = sender == 'John Doe'; // Replace with actual logic to determine sender

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(color: isMe ? Colors.white : Colors.black),
                ),
                SizedBox(height: 5.0),
                Text(
                  time,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black54,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              ),
              onSubmitted: (value) {
                _sendMessage(value);
              },
            ),
          ),
          SizedBox(width: 10.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              final messageText = _controller.text.trim();
              if (messageText.isNotEmpty) {
                _sendMessage(messageText);
              }
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    final String currentTime = DateFormat('hh:mm a').format(DateTime.now());

    setState(() {
      messages.insert(0, {'sender': 'John Doe', 'text': text, 'time': currentTime});
      _controller.clear();
    });
  }
}