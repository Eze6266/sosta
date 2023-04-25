import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constant.dart';
import '../../../../models/state_model.dart';
import '../../../../services/api.dart';
import '../../../../services/storage_service.dart';
import '../../../../widgets/app_button.dart';
import '../../widget/input_widget.dart';
import '../../widget/signup_layout.dart';

class Business extends StatefulWidget {
  const Business({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  final companyController = TextEditingController();
  final summaryController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final areaController = TextEditingController();
  final addressController = TextEditingController();
  dynamic? stateValue;

  List<StateModel> states = [];

  getLogData() async {
    return await StorageService().getString('signup');
  }

  Future<void> getStates() async {
    states = await Api.fetchStates() as List<StateModel>;
    setState(() {});
  }

  void initState() {
    super.initState();
    getStates();
  }

  @override
  Widget build(BuildContext context) {
    return SignupLayoutState(
        childrenWidget: [
          const SizedBox(
            height: 10,
          ),
          InputWidget(
            onChanged: (text) =>
                {setState(() => companyController.text = text)},
            hintText: 'Company Name',
            prefixText: '',
          ),
          const SizedBox(
            height: 15,
          ),
          InputWidget(
              onChanged: (text) =>
                  {setState(() => summaryController.text = text)},
              hintText: 'Summary of what you do',
              prefixText: '',
              maxlines: 100),
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
                  value: stateValue,
                  elevation: 1,
                  dropdownColor: Colors.white,
                  style: TextStyle(color: tertiary, fontSize: 14),
                  hint: Text('State'),
                  items: states.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.name!),
                    );
                  }).toList(),
                  onChanged: (dynamic selectedValue) {
                    setState(() {
                      stateValue = selectedValue!;
                      stateController.text = selectedValue.id;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InputWidget(
            onChanged: (text) => {setState(() => cityController.text = text)},
            hintText: 'City',
            prefixText: '',
          ),
          const SizedBox(
            height: 15,
          ),
          InputWidget(
            onChanged: (text) => {setState(() => areaController.text = text)},
            hintText: 'Area',
            prefixText: '',
          ),
          const SizedBox(
            height: 15,
          ),
          InputWidget(
            onChanged: (text) =>
                {setState(() => addressController.text = text)},
            hintText: 'Address',
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
            bgColor: companyController.text.isEmpty ||
                    summaryController.text.isEmpty ||
                    stateController.text.isEmpty ||
                    cityController.text.isEmpty ||
                    areaController.text.isEmpty ||
                    addressController.text.isEmpty
                ? const Color(0xffE5E5E5)
                : primary,
            color: Colors.white,
            height: 55,
            width: MediaQuery.of(context).size.width,
            onTap: () async => {
                  if (companyController.text.isNotEmpty ||
                      summaryController.text.isNotEmpty ||
                      stateController.text.isNotEmpty ||
                      cityController.text.isNotEmpty ||
                      areaController.text.isNotEmpty ||
                      addressController.text.isNotEmpty)
                    {
                      await StorageService().setString(
                          'signup',
                          jsonEncode({
                            'service_name': companyController.text,
                            'service_address': addressController.text,
                            'city': cityController.text,
                            'service_description': summaryController.text,
                            'state_id': stateValue.id,
                            'closest_landmark': areaController.text,
                            ...jsonDecode(await getLogData())
                          })),
                      context.go(
                          '/provider/account/password/business/business-details')
                    }
                }));
    // onTap: _saveType()));
  }
}
