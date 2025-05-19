import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class AiTextfield extends StatelessWidget {
  const AiTextfield({super.key, required this.controller, this.onSubmitted});

  final TextEditingController controller;
  final ValueChanged<String>? onSubmitted;

  void _showEmojiPickerPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: EmojiPicker(
            onEmojiSelected: (category, emoji) {
              Navigator.pop(context);
              controller.text += emoji.emoji;
              controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      minLines: 1,
      maxLines: 2,

      onFieldSubmitted: onSubmitted,

      decoration: InputDecoration(
        hintText: "Type a message...",
        hintStyle: const TextStyle(color: Colors.blueGrey),
        prefixIcon: IconButton(
          icon: const Icon(Icons.emoji_emotions_outlined),
          onPressed: () {
            FocusScope.of(context).unfocus(); // Hide keyboard
            _showEmojiPickerPopup(context);
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF077A7D), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF077A7D), width: 1),
        ),
      ),
    );
  }
}
