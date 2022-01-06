import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/user_model.dart';
import '../../../routes/app_pages.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    Key? key,
    required this.loggedInUser,
  }) : super(key: key);

  final UserModel loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("YaMaKar Store",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      size: 30,
                    ),
                    SizedBox(width: 8,),
                    Icon(
                      Icons.account_circle,
                      size: 35,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello , ${loggedInUser.firstName} ${loggedInUser.lastName}",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            )
          ],
        )
    );
  }
}