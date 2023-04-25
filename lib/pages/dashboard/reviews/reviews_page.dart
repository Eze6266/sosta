import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../constant.dart';
import '../../../widgets/app_button.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final passwordController = TextEditingController();
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              '',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
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
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(left: 40, right: 40),
          // decoration: BoxDecoration(color: tertiary),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFD9B1), width: 6),
                    borderRadius: BorderRadius.circular(1000),
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://res.cloudinary.com/kingstech/image/upload/v1666183614/image_1_mwux5a.jpg'))),
                height: 157,
                width: 157,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'James Kolawole',
                style: TextStyle(
                    color: tertiary, fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                'Rate user',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff50555C),
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.star,
                    size: 53,
                    color: Color(0xffFF8E1B),
                  ),
                  Icon(
                    Icons.star,
                    size: 53,
                    color: Color(0xffFF8E1B),
                  ),
                  Icon(
                    Icons.star,
                    size: 53,
                    color: Color(0xffFF8E1B),
                  ),
                  Icon(
                    Icons.star,
                    size: 53,
                    color: Color(0xffCBCBCB),
                  ),
                  Icon(Icons.star, size: 53, color: Color(0xffCBCBCB)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                  // controller: emailController,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  onChanged: (text) => {setState(() => text)},
                  maxLines: 8,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(10),
                    hintStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    border: InputBorder.none,
                    hintText: 'Write a review',
                    hoverColor: Colors.transparent,
                  )),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                text: 'Submit Review',
                onTap: () => context.go('/reviews/complete'),
                bgColor: primary,
                color: Colors.white,
                width: MediaQuery.of(context).size.width - 40,
                height: 55,
              ),
            ],
          ),
        ));
  }
}
