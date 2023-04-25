import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:go_router/go_router.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final passwordController = TextEditingController();
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Send message',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
          ),
          shadowColor: null,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () => context.pop(),
            color: const Color.fromARGB(255, 109, 105, 105),
            icon: Image.network(
                'https://res.cloudinary.com/kingstech/image/upload/v1666210470/arrow_ockvre.png'),
            //replace with our own icon data.
          )),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 37, right: 37),
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           color: Color(0xffFFD9B1),
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Padding(
                  //         padding: EdgeInsets.all(20),
                  //         child: Text(
                  //           'Hello, Good afternoon',
                  //           style: TextStyle(
                  //               color: tertiary, fontWeight: FontWeight.w300),
                  //         ),
                  //         // style: TextStyle(background: Colors.red),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(height: 24),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       decoration: BoxDecoration(
                  //           color: Color(0xffEBEDFF),
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Padding(
                  //         padding: EdgeInsets.all(20),
                  //         child: Text(
                  //           'Good afternoon, how are you today?',
                  //           style: TextStyle(
                  //               color: tertiary, fontWeight: FontWeight.w300),
                  //         ),
                  //         // style: TextStyle(background: Colors.red),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ))),
      bottomSheet: SizedBox(
        height: 59,
        // width: 74,
        child: TextField(
          onChanged: (value) {},
          // onSaved: (newValue) {},

          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              prefixIcon: Icon(Icons.emoji_emotions_outlined)),
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
