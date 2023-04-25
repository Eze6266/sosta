import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/Card/vendor_card.dart';
import '../../../components/dashboard_header.dart';
import '../../../constant.dart';
import '../../../models/service_providers_model.dart';
import '../../../services/api.dart';

class ServiceSearchPage extends StatefulWidget {
  String search;
  ServiceSearchPage({super.key, required this.search});
  @override
  // ignore: library_private_types_in_public_api
  _ServiceSearchPageState createState() => _ServiceSearchPageState();
}

class _ServiceSearchPageState extends State<ServiceSearchPage> {
  final searchController = TextEditingController();
  bool show = false;

  void initState() {
    super.initState();
    searchController.text = widget.search;
  }

  List<ServiceProviderModel> providers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Builder(
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                DashboardHeaderWidget(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('asset/images/stepIcon.svg'),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 80.w,
                          child: TextField(
                            controller: searchController,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            onChanged: (text) => {setState(() => text)},
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                              // contentPadding: EdgeInsets.all(10),
                              hintStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                              // border: InputBorder.none,
                              hintText: '',
                              hoverColor: Colors.transparent,
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  doSeaech();
                                },
                                child: SvgPicture.asset(
                                  'asset/images/searchIcon.svg',
                                  width: 5,
                                  height: 5,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 80.w,
                          child: TextField(
                            // controller: emailController,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            onChanged: (text) => {setState(() => text)},
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(10),
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: '',
                                hoverColor: Colors.transparent),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Recent Service Providers',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: tertiary,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ListView.builder(
                  itemCount: providers.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, i) => GestureDetector(
                    onTap: () => context.go('/dashboard/service-search/vendor',
                        extra: providers[i]),
                    child: VendorCardWidget(
                        id: providers[i].id,
                        name: providers[i].name,
                        image: providers[i].imgurl,
                        mincharge: providers[i].price),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> doSeaech() async {
    providers = await Api.searchForProviders(searchController.text);
    setState(() {});
    //print(response);
  }
}
