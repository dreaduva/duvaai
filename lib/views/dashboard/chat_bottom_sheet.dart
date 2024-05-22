import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h, // Adjust height as needed
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/duva_ai_edited.svg',
                  width: 5.w,
                  height: 5.h,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Chat',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Sample item count
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Message $index'),
                );
              },
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Type your message...',
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  // Add send message functionality
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
