// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constant.dart';

class VendorCardWidget extends StatelessWidget {
  //const VendorCardWidget({super.key});
  final String? id;
  final String? mincharge;
  final String? name;
  final String? image;

  VendorCardWidget({this.id, this.mincharge, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(3)),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 53,
                    width: 64,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(image ?? ''))),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: secondary,
                        ),
                      ),
                      Text(
                        'Mechanic',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Color(0xffD9D9D9),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'from',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffD9D9D9),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'N$mincharge ?? ' '',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: secondary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 11,
                            color: Color(0xffFF8E1B),
                          ),
                          Icon(
                            Icons.star,
                            size: 11,
                            color: Color(0xffFF8E1B),
                          ),
                          Icon(
                            Icons.star,
                            size: 11,
                            color: Color(0xffFF8E1B),
                          ),
                          Icon(
                            Icons.star,
                            size: 11,
                            color: Color(0xffFF8E1B),
                          ),
                          Icon(Icons.star, size: 11, color: Color(0xffD9D9D9)),
                        ],
                      ),
                      const Text(
                        '(52)',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffD9D9D9),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}
