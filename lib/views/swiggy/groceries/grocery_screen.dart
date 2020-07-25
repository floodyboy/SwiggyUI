import 'package:flutter/material.dart';
import 'package:swiggy_ui/models/spotlight_best_top_food.dart';
import 'package:swiggy_ui/utils/ui_helper.dart';
import 'package:swiggy_ui/widgets/search_food_list_item_view.dart';

class GroceryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _GroceryHeaderView(),
              UIHelper.verticalSpaceMedium(),
              GroceryListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _GroceryHeaderView extends StatelessWidget {
  const _GroceryHeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/images/banner1.jpg',
          height: MediaQuery.of(context).size.height / 2.1,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 40.0,
          left: 0.4,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 28.0,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

class GroceryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurants = SpotlightBestTopFood.getTopGroceryRestaurants();

    final headerStyle = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(fontWeight: FontWeight.w500, fontSize: 14.0);

    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '156 RESTAURANTS NEARBY',
                  style: headerStyle,
                ),
                Spacer(),
                Icon(Icons.filter_list),
                UIHelper.horizontalSpaceSmall(),
                Text('SORT/FILTER', style: headerStyle)
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: restaurants.length,
            itemBuilder: (context, index) => SearchFoodListItemView(
              food: restaurants[index],
            ),
          )
        ],
      ),
    );
  }
}
