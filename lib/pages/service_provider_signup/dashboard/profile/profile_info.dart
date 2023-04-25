import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ProfileInfoPageState createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  final passwordController = TextEditingController();

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
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 10, right: 10),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Color(0xfffFF8E1B),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 13, bottom: 13, left: 18, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Personal Information',
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () => context
                                  .go('/provider/dashboard/profile/update'),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  Text('edit',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            color: Color(0xfff828282),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Text('johndoe@gmail.com',
                          style: TextStyle(
                            color: Color(0xfff828282),
                            fontSize: 16,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Password',
                        style: TextStyle(
                            color: Color(0xfff828282),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text('*******************',
                          style: TextStyle(
                            color: Color(0xfff828282),
                            fontSize: 16,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 10, right: 10),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                        color: Color(0xfffFF8E1B),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 13, bottom: 13, left: 18, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Business Information',
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () => context
                                  .go('/provider/dashboard/profile/business'),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  Text('edit',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Business name:',
                        style: TextStyle(
                            color: Color(0xfff828282),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text('ADE-SAB Mechanical Services',
                          style: TextStyle(
                            color: Color(0xfff828282),
                            fontSize: 16,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Business Description',
                        style: TextStyle(
                            color: Color(0xfff828282),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('We dey do mechanic work',
                          style: TextStyle(
                            color: Color(0xfff828282),
                            fontSize: 16,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
