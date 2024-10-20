// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MessageInputField extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 hintText: 'Type a message',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               if (_controller.text.isNotEmpty) {
//                 // Provider is mesage returned
//                 // messages list
//                 Provider.of<MessageProvider>(context, listen: false)
//                     .addMessage('me', _controller.text);
//                 _controller.clear();
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
