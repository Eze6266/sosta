// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sosta/services/api.dart';

import '../../../../constant.dart';
import '../../../../models/days_model.dart';
import '../../../../models/sub_category_model.dart';
import '../../../../services/storage_service.dart';
import '../../../../widgets/app_button.dart';
import '../../../dashboard/category_type/category_type_response.dart';
import '../../widget/input_widget.dart';
import '../../widget/signup_layout.dart';

class BusinessFinal extends StatefulWidget {
  BusinessFinal({
    super.key,
  });
  @override
  // ignore: library_private_types_in_public_api
  _BusinessFinalState createState() => _BusinessFinalState();
}

class TestType {
  int id;
  String name;
  TestType({required this.id, required this.name});
}

class _BusinessFinalState extends State<BusinessFinal> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final referralController = TextEditingController();

  bool perDay = false;
  bool perService = false;
  bool perHour = false;

  List openingHours = [
    '8:00AM',
    '9:00AM',
    '10:00AM',
    '11:00AM',
    '12:00PM',
    '01:00PM',
    '02:00PM',
    '03:00PM',
    '04:00PM',
    '05:00PM',
    '06:00PM',
    '07:00PM',
    '08:00PM'
  ];

  dynamic? skillValue;
  dynamic? serviceValue;
  String? hourValue;
  String? closeValue;
  dynamic? day;

  List<DaysModel> days = [];
  List<SubCategoryModel> skills = [];
  List services = [];

  getLogData() async {
    return await StorageService().getString('signup');
  }

  @override
  void initState() {
    super.initState();
    getCategories();
    getDays();
  }

  Future<void> getDays() async {
    days = await Api.fetchDays() as List<DaysModel>;
    setState(() {});
  }

  Future<void> getSubCategories(category) async {
    skills = await Api.fetchSkills(category);
    setState(() {});
    print(skills);
  }

  void getCategories() async {
    try {
      var res = await Api.fetchService();

      final initialList = CategoryTypeResponse.fromJson(res);
      setState(() {
        services = initialList.data ?? [];
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return SignupLayoutState(
        childrenWidget: [
          const SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: serviceValue,
                  elevation: 1,
                  dropdownColor: Colors.white,
                  style: TextStyle(
                    color: tertiary,
                    fontSize: 14,
                  ),
                  hint: Text('Choose service you provide'),
                  items: services.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.name!),
                    );
                  }).toList(),
                  onChanged: (dynamic selectedValue) {
                    setState(() {
                      serviceValue = selectedValue;
                    });
                    getSubCategories(selectedValue?.name);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: skillValue,
                  elevation: 1,
                  dropdownColor: Colors.white,
                  style: TextStyle(
                    color: tertiary,
                    fontSize: 14,
                  ),
                  hint: Text('Select Skill'),
                  items: skills.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.name!),
                    );
                  }).toList(),
                  onChanged: (dynamic selectedValue) {
                    setState(() {
                      skillValue = selectedValue!;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150.w,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: hourValue,
                            elevation: 1,
                            dropdownColor: Colors.white,
                            style: TextStyle(
                              color: tertiary,
                              fontSize: 14,
                            ),
                            hint: Text('Opening Hours'),
                            items: openingHours.map((value) {
                              return DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(value!),
                              );
                            }).toList(),
                            onChanged: (selectedValue) {
                              setState(() {
                                hourValue = selectedValue!.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150.w,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: closeValue,
                            elevation: 1,
                            dropdownColor: Colors.white,
                            style: TextStyle(
                              color: tertiary,
                              fontSize: 14,
                            ),
                            hint: Text('Closing Hours'),
                            items: openingHours.map((value) {
                              return DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(value!),
                              );
                            }).toList(),
                            onChanged: (selectedValue) {
                              setState(() {
                                closeValue = selectedValue!.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: day,
                  elevation: 1,
                  dropdownColor: Colors.white,
                  style: TextStyle(
                    color: tertiary,
                    fontSize: 14,
                  ),
                  hint: Text('Opening Days'),
                  items: days.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.name!),
                    );
                  }).toList(),
                  onChanged: (dynamic selectedValue) {
                    setState(() {
                      day = selectedValue!;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('Service Hiring',
              style: TextStyle(
                  color: tertiary, fontSize: 16, fontWeight: FontWeight.w800)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: perDay,
                    checkColor: Colors.white,
                    fillColor:
                        MaterialStateProperty.resolveWith((states) => tertiary),
                    side: BorderSide(color: tertiary),
                    onChanged: (bool? value) {
                      setState(() {
                        perDay = value!;
                      });
                    },
                  ),
                  Text('Per day',
                      style: TextStyle(
                          color: tertiary,
                          fontSize: 12,
                          fontWeight: FontWeight.w300))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: perService,
                    checkColor: Colors.white,
                    fillColor:
                        MaterialStateProperty.resolveWith((states) => tertiary),
                    side: BorderSide(color: tertiary),
                    onChanged: (bool? value) {
                      setState(() {
                        perService = value!;
                      });
                    },
                  ),
                  Text('Per Service',
                      style: TextStyle(
                          color: tertiary,
                          fontSize: 12,
                          fontWeight: FontWeight.w300))
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: perHour,
                    checkColor: Colors.white,
                    fillColor:
                        MaterialStateProperty.resolveWith((states) => tertiary),
                    side: BorderSide(color: tertiary),
                    onChanged: (bool? value) {
                      setState(() {
                        perHour = value!;
                      });
                    },
                  ),
                  Text('Per Hour',
                      style: TextStyle(
                          color: tertiary,
                          fontSize: 12,
                          fontWeight: FontWeight.w300))
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Price range',
              style: TextStyle(
                  color: tertiary, fontSize: 16, fontWeight: FontWeight.w800)),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: 120.w,
                  child: InputWidget(
                    onChanged: (text) =>
                        {setState(() => fromController.text = text)},
                    hintText: 'FROM (NGN)',
                    prefixText: '',
                    type: TextInputType.number,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Container(
                  width: 120.w,
                  child: InputWidget(
                    onChanged: (text) =>
                        {setState(() => toController.text = text)},
                    hintText: 'TO (NGN)',
                    prefixText: '',
                    type: TextInputType.number,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          InputWidget(
            onChanged: (text) =>
                {setState(() => referralController.text = text)},
            hintText: 'Referral Code (Optional)',
            prefixText: '',
          ),
          const SizedBox(
            height: 15,
          ),
        ],
        title: 'Tell us more about your Business',
        description: '',
        footer: const Text(
          '',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
        button: AppButton(
            text: 'Continue',
            bgColor: fromController.text.isEmpty || toController.text.isEmpty
                ? const Color(0xffE5E5E5)
                : primary,
            color: Colors.white,
            height: 55,
            width: MediaQuery.of(context).size.width,
            onTap: () async => {
                  if (toController.text.isNotEmpty ||
                      fromController.text.isNotEmpty)
                    {
                      await StorageService().setString(
                          'signup',
                          jsonEncode({
                            'charge_type': perDay,
                            'closing_time': closeValue,
                            'opening_time': hourValue,
                            'sub_category_ids': [skillValue.id],
                            'category_id': serviceValue.id,
                            'day_ids': [day.id],
                            'min_charge': fromController.text,
                            'max_charge': toController.text,
                            ...jsonDecode(await getLogData())
                          })),
                      context.go(
                          '/provider/account/password/business/business-details/upload-document')
                    }
                }));
    // onTap: _saveType()));
  }
}
