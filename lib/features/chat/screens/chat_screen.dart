import 'package:auto_route/annotations.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  final String receiverId;
  final String receiverName;

  const ChatScreen({
    super.key,
    required this.receiverId,
    required this.receiverName,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  // Firestore reference to messages
  CollectionReference get messageSendCollection =>
      FirebaseFirestore.instance.collection('message_send');

  CollectionReference get messageReceivedCollection =>
      FirebaseFirestore.instance.collection('message_received');

  // Unique chat ID for two users
  String getChatId(String id1, String id2) {
    return id1.hashCode <= id2.hashCode ? '$id1\_$id2' : '$id2\_$id1';
  }

  void sendMessage() async {
    final messageText = messageController.text.trim();
    if (messageText.isEmpty) return;

    final chatId = getChatId(currentUserId, widget.receiverId);

    try {
      debugPrint('Sending message: $messageText');

      final currentUserSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserId)
          .get();

      final currentUserData = currentUserSnapshot.data();

      final message = {
        'senderId': currentUserId,
        'senderName': currentUserData?['first_name'] ?? 'Unknown',
        'receiverId': widget.receiverId,
        'receiverName': widget.receiverName,
        'message': messageText,
        'timestamp': FieldValue.serverTimestamp(),
      };

      // Send message to "message_send" for the sender
      await messageSendCollection
          .doc(chatId)
          .collection('messages')
          .add(message);

      // Send message to "message_received" for the receiver
      final receiverMessage = {
        'senderId': currentUserId,
        'senderName': currentUserData?['first_name'] ?? 'Unknown',
        'receiverId': widget.receiverId,
        'receiverName': widget.receiverName,
        'message': messageText,
        'timestamp': FieldValue.serverTimestamp(),
      };

      await messageReceivedCollection
          .doc(chatId)
          .collection('messages')
          .add(receiverMessage);

      messageController.clear();
      debugPrint('Message sent to both collections!');
    } catch (e) {
      debugPrint('Error sending message: $e');
      Utils().toastMessage('Error sending message: $e');
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final chatId = getChatId(currentUserId, widget.receiverId);

    return Scaffold(
      appBar: AppBar(title: Text('Chat with ${widget.receiverName}')),
      body: Column(
        children: [
          // Message List
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messageReceivedCollection
                  .doc(chatId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error loading messages: ${snapshot.error}'));
                }

                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,  // Display newest messages at the bottom
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index].data() as Map<String, dynamic>;
                    final isSender = msg['senderId'] == currentUserId;

                    return Column(
                      crossAxisAlignment: isSender
                          ? CrossAxisAlignment.end // Sent messages on the right
                          : CrossAxisAlignment.start, // Received messages on the left
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            msg['senderName'] as String ?? '',
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Align(
                          alignment: isSender
                              ? Alignment.centerRight
                              : Alignment.centerLeft, // Align left or right
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSender ? Colors.blue : Colors.grey[300], // Different colors for sent/received
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              msg['message'] as String ?? '',
                              style: TextStyle(
                                color: isSender ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),

          // Message Input Area
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Text Input Field
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                  ),
                ),
                // Send Button
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Theme.of(context).primaryColor,
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
