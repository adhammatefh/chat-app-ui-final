
import 'package:chat_app_ui/screens/messages/components/text_message.dart';
import 'package:chat_app_ui/screens/messages/components/video_message.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/ChatMessage.dart';
import 'audio_message.dart';

class Message extends StatelessWidget {
  final ChatMessage message;

  const Message({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(
            message: message,
          );
        case ChatMessageType.audio:
          return AudioMessage(
            message: message,
          );
        case ChatMessageType.video:
          return const VideoMessage();
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        top: kDefaultPadding,
      ),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            const CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            const SizedBox(
              width: kDefaultPadding / 2,
            ),
          ],
          messageContaint(message),
          if (message.isSender)
            MessagesStatusDot(
              status: message.messageStatus,
            )
        ],
      ),
    );
  }
}

class MessagesStatusDot extends StatelessWidget {
  final MessageStatus status;

  const MessagesStatusDot({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? dotColor(MessageStatus messagesStatus) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.1);

        case MessageStatus.viewed:
          return kPrimaryColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotColor(status),
      ),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
