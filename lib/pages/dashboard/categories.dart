// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sosta/services/api.dart';

import '../../components/Navigation/bottom_nav.dart';
import '../../components/dashboard_header.dart';
import '../../constant.dart';
import 'category_type/category_type.dart';
import 'category_type/category_type_response.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final passwordController = TextEditingController();
  List<CategoryType> categories = [];

  void initState() {
    super.initState();
    getCategories();
  }

  void getCategories() async {
    try {
      var res = await Api.fetchService();

      final initialList = CategoryTypeResponse.fromJson(res);
      setState(() {
        categories = initialList.data ?? [];
      });
    } catch (e) {
      log(e.toString());
      // ElegantNotification.error(
      //         title: Text("Error"), description: Text(e.toString()))
      //     .show(context);
    }
  }

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
        bottomSheet: BottomNavWidget(),
        body: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                DashboardHeaderWidget(
                  name: true,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextField(
                  // controller: emailController,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  onChanged: (text) => {
                    setState(() => {
                          print(text),
                          context.go('/dashboard/service-search', extra: text)
                        })
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      // contentPadding: EdgeInsets.all(10),
                      hintStyle:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                      hintText: 'I’m looking for...',
                      hoverColor: Colors.transparent,
                      prefixIcon: SvgPicture.asset(
                        'asset/images/searchIcon.svg',
                        height: 5,
                        width: 5,
                        fit: BoxFit.scaleDown,
                      )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      ...categories.map((CategoryType category) {
                        return Column(
                          children: [
                            Container(
                                width: 94,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  'https://goldfish-app-c5kq4.ondigitalocean.app${category.imageUrl}'))),
                                      child: GestureDetector(
                                        onTap: () => context.go(
                                            '/dashboard/categories/${category.name}',
                                            extra: category.name),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${category.name}',
                              style: TextStyle(
                                  color: tertiary, fontWeight: FontWeight.w300),
                            )
                          ],
                        );
                      }),
                      // SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
