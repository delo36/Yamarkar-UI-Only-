import 'package:flutter/cupertino.dart';
import 'package:yamakar/app/data/model/categories_model.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final CategoriesModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.categoryScreen);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network("${model.bottlePhoto}",
                fit: BoxFit.cover, width: 50, height: 50),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
          "${model.name}",
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}