import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = []; // {"role": "user" or "bot", "text": "..."}
  bool _isLoading = false;

  // Replace with your Gemeni API endpoint
  final String apiUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyB3inke63Y4tCl2ydcC6DAhOoKohUOS5aY";

  /// Sends the user's message to the Gemeni API in the required raw request format,
  /// then parses the response to extract the bot's reply.
  Future<void> _sendMessage(String message) async {
    setState(() {
      // Add the user message to the conversation
      _messages.add({"role": "user", "text": message});
      _isLoading = true;
    });

    // Build the payload in the required structure:
    final Map<String, dynamic> payload = {
      "contents": [
        {
          "parts": [
            {
              "text": message,
            }
          ]
        }
      ]
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          // Include authentication or other headers if needed
          // "Authorization": "Bearer YOUR_API_KEY",
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Navigate the response structure to get the reply:
        // The text is located at candidates[0] -> content -> parts[0] -> text
        String reply = "Sorry, no reply found.";
        if (data['candidates'] != null &&
            data['candidates'] is List &&
            data['candidates'].isNotEmpty) {
          final candidate = data['candidates'][0];
          if (candidate['content'] != null &&
              candidate['content']['parts'] != null &&
              candidate['content']['parts'] is List &&
              candidate['content']['parts'].isNotEmpty) {
            reply = candidate['content']['parts'][0]['text']?.trim() ?? reply;
          }
        }
        setState(() {
          _messages.add({"role": "bot", "text": reply});
        });
      } else {
        setState(() {
          _messages.add({
            "role": "bot",
            "text": "Error: ${response.statusCode} - ${response.reasonPhrase}"
          });
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({
          "role": "bot",
          "text": "An error occurred while processing your message."
        });
      });
    } finally {
      setState(() {
        _isLoading = false;
        _controller.clear();
      });
    }
  }

  // Widget to display each message bubble.
  Widget _buildMessage(Map<String, String> message) {
    bool isUser = message["role"] == "user";
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUser ? Colors.blueAccent : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          message["text"] ?? "",
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chatbot',style: TextStyle(color: Colors.white),)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              reverse: false,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        _sendMessage(value.trim());
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final message = _controller.text.trim();
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                    }
                  },
                  child: const Text("Send"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
