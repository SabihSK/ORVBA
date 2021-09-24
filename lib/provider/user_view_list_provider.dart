import 'package:flutter/material.dart';
import 'package:younusorvba/views/user_view_detail.dart';

class UserViewListProvider extends ChangeNotifier {
  navigatToDetailPage(context) {
    Navigator.pushNamed(context, UserViewDetails.route);
  }
}
