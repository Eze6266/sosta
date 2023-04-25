import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../constant.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final passwordController = TextEditingController();
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: tertiary),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color(0xffF5F5F5).withOpacity(0.3), width: 0.4),
                    borderRadius: BorderRadius.circular(1000),
                  ),
                  height: 300,
                  width: 300,
                  child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xffF5F5F5).withOpacity(0.3),
                              width: 0.4),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        height: 240,
                        width: 240,
                        child: Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 12),
                                  borderRadius: BorderRadius.circular(1000),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://res.cloudinary.com/kingstech/image/upload/v1666183614/image_1_mwux5a.jpg'))),
                              height: 180,
                              width: 180),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Calling...',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'James Kolawole',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100)),
                      child: GestureDetector(
                        onTap: () => context.go('/dashboard'),
                        child: const Center(
                          child: Icon(
                            Icons.call_end,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: 20,
            right: 10,
            child: GestureDetector(
              onTap: () => context.go('/dashboard'),
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                    color: Color.fromARGB(97, 66, 65, 65),
                    borderRadius: BorderRadius.circular(100)),
                child: const Center(
                  child: Icon(
                    Icons.close_sharp,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
              ),
            )),
      ],
    ));
  }
}
