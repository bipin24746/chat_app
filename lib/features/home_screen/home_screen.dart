// import 'package:auto_route/annotations.dart';
// import 'package:auto_route/auto_route.dart';
// import 'package:chat_app/router/app_router.gr.dart';
// import 'package:chat_app/utils/utils.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// @RoutePage()
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('HomeScreen'),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 auth.signOut().then((value) {
//                   AutoRouter.of(context)
//                       .replace(const LoginScreenRoute())
//                       .onError((error, stackTrace) {
//                     Utils().toastMessage(error.toString());
//                     return null;
//                   });
//                 });
//               },
//               icon: const Icon(Icons.logout))
//         ],
//       ),
//     );
//   }
// }
