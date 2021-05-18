import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market/api/api_manager.dart';
import 'package:market/model/product.dart';
import 'package:market/screens/components/components.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Api_Manager api_manager = Api_Manager();
  void initState() {
    super.initState();
    // api_manager.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: FutureBuilder(
            future: api_manager.getProduct(),
            builder: (context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData) {
                List<Product>? products = snapshot.data;
                return StaggeredGridView.countBuilder(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: products!.length,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  itemBuilder: (context, index) => ProductCard(
                    image: products[index].image,
                    name: products[index].title,
                    price: products[index].price,
                    delivery: products[index].delivery,
                    deliveryPrice: products[index].deliveryPrice,
                  ),
                  staggeredTileBuilder: (index) => StaggeredTile.fit(2),
                );
              } else {
                return StaggeredGridView.countBuilder(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: 8,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  itemBuilder: (context, index) => WaittingCard(),
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(2, index.isEven ? 2 : 4),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
