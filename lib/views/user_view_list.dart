// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:younusorvba/constants/colors_of_app.dart';
import 'package:provider/provider.dart';
import 'package:younusorvba/provider/user_view_list_provider.dart';

class UserViewList extends StatefulWidget {
  static const route = "UserViewList";
  const UserViewList({Key? key}) : super(key: key);

  @override
  _UserViewListState createState() => _UserViewListState();
}

class _UserViewListState extends State<UserViewList> {
  @override
  Widget build(BuildContext context) {
    //?-----Provider------
    var userViewListRead = context.read<UserViewListProvider>();
    var userViewListWatch = context.watch<UserViewListProvider>();
    //?-----Provider------

    //?----Media Query-----
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //?----Media Query-----

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.08,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          userViewListRead.navigatToDetailPage(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Card(
                            color: primaryColorLight,
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Image.network(
                                    "http://placeimg.com/640/480"),
                              ),
                              title: Text(
                                "Zafar",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "Car Mechanic",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                "Karachi\n09:00 to 18:00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.01),
              color: Colors.white,
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColorLight),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColorDark),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  fillColor: Colors.grey,
                  focusColor: Colors.grey,
                  hintText: 'Search',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
