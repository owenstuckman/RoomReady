// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'message_widget_display.dart';

// class MessageListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Chat')),
//       // messages list  
//       body: Consumer<MessageProvider>(
//         builder: (context, messageProvider, child) {
//           return ListView.builder(
//             itemCount: messageProvider.messages.length,
//             itemBuilder: (context, index) {
//               return MessageWidget(message: messageProvider.messages[index]);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
