import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:chat_app/features/chat/screens/chat_screen.dart';
import 'package:chat_app/router/app_router.gr.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SelectUserScreen extends StatelessWidget {
  const SelectUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select User to Chat'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  AutoRouter.of(context)
                      .replace(const LoginScreenRoute())
                      .onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                    return null;
                  });
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          // Debugging: Log the error
          if (snapshot.hasError) {
            debugPrint("Error: ${snapshot.error}");
            return const Center(child: Text('Error fetching users'));
          }

          // Debugging: Check if data is being fetched
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          // Debugging: Check the fetched data
          debugPrint("Users data: ${snapshot.data!.docs}");

          // filter users except current user
          final users = snapshot.data!.docs
              .where((doc) => doc['uid'] != currentUserId)
              .toList();

          if (users.isEmpty) {
            return const Center(child: Text('No other users found.'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index].data() as Map<String, dynamic>;

              return ListTile(
                title: Text(user['first_name'].toString() ?? 'No Name'),
                subtitle: Text(user['email'].toString() ?? ''),
                onTap: () {
                  AutoRouter.of(context).push(
                    ChatScreenRoute(
                      receiverId: user['uid'].toString(),
                      receiverName: user['first_name']?.toString() ?? 'No Name',
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
