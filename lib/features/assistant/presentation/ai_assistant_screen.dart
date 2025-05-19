import 'dart:convert';
import 'package:din_guide_app/common_widgets/ai_textfield.dart';
import 'package:din_guide_app/common_widgets/auth_appbar.dart';
import 'package:din_guide_app/common_widgets/custom_bottom_sheet.dart';
import 'package:din_guide_app/constants/app_assets/assets_icons.dart';
import 'package:din_guide_app/constants/utils/train_data.dart';
import 'package:din_guide_app/features/assistant/service/ai_assistant_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final AssistantService assistantService = AssistantService();
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = json.encode(_messages);
    await prefs.setString('chat_messages', encoded);
  }

  Future<void> _loadMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('chat_messages');
    if (data != null) {
      final List<dynamic> decoded = json.decode(data);
      setState(() {
        _messages.clear();
        _messages.addAll(decoded.map((e) => Map<String, dynamic>.from(e)));
      });
    }
  }

  Future<void> _clearMessages() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('chat_messages');
    setState(() {
      _messages.clear();
    });
  }

  void _sendMessage() async {
    final userText = _controller.text.trim();
    if (userText.isEmpty) return;

    setState(() {
      _messages.insert(0, {"text": userText, "isMe": true});
      _controller.clear();
    });
    await _saveMessages();

    final history = [...trainData, ..._messages.reversed];

    setState(() {
      _messages.insert(0, {
        "text": "AI is typing...",
        "isMe": false,
        "isLoading": true,
      });
    });
    await _saveMessages();

    final botReply = await assistantService.fetchAssistantResponse(history);

    setState(() {
      _messages.removeAt(0);
      _messages.insert(0, {
        "text": botReply,
        "isMe": false,
        "isLoading": false,
      });
    });
    await _saveMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Din Guide Asssitant',
        leadingVisible: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              customButtomSheet(
                context,
                ontap: () {
                  _clearMessages();
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),

      body: Center(
        child: Column(
          children: [
            Expanded(
              child:
                  _messages.isEmpty
                      ? const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'No messages yet. Start the conversation!',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                      : ListView.builder(
                        reverse: true,
                        itemCount: _messages.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, index) {
                          final isMe = _messages[index]["isMe"];
                          final isLoading =
                              _messages[index]["isLoading"] ?? false;

                          return Row(
                            mainAxisAlignment:
                                isMe
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (!isMe)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    top: 4,
                                  ),
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundImage: AssetImage(AssetsIcons.ai),
                                  ),
                                ),
                              Flexible(
                                child:
                                    isLoading
                                        ? Lottie.asset(
                                          'assets/lottie/loading.json',
                                          height: 45,
                                          fit: BoxFit.cover,
                                        )
                                        : Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          margin: EdgeInsets.only(
                                            top: 6,
                                            bottom: 6,
                                            left: isMe ? 55 : 6,
                                            right: isMe ? 10 : 55,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                isMe
                                                    ? const Color(0xFF3E3F5B)
                                                    : const Color(0xFF077A7D),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              Clipboard.setData(
                                                ClipboardData(
                                                  text:
                                                      _messages[index]["text"],
                                                ),
                                              );
                                              EasyLoading.showToast('Copied');
                                            },
                                            child: Text(
                                              _messages[index]["text"],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                              ),
                            ],
                          );
                        },
                      ),
            ),

            // INPUT FIELD
            Padding(
              padding: const EdgeInsets.only(
                right: 10,
                left: 16,
                top: 20,
                bottom: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AiTextfield(
                      controller: _controller,
                      onSubmitted: (text) {
                        if (text.trim().isNotEmpty) {
                          _sendMessage();
                          _controller.clear();
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: _sendMessage,
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundColor: Color(0xFF077A7D),
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
