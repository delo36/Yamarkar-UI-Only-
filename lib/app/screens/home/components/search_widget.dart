import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Get.toNamed(Routes.search);
            },
          ),
          SizedBox(
            width: 8,
          ),
          Text("Search...")
        ],
      ),
    );
  }
}