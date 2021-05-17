import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:market/api/api_manager.dart';
import 'package:market/model/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Market',
      home: HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: FutureBuilder<Product>(
            future: API_Manager().getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return StaggeredGridView.countBuilder(
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 4,
                  itemCount: snapshot.data!.title.length,
                  crossAxisSpacing: 8,
                  itemBuilder: (context, index) {
                    var name = snapshot.data!.title;
                    var price = snapshot.data!.price;
                    return ProductCard(
                      name: name,
                      price: price,
                    );
                  },
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                );
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final int price;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatNumber = new NumberFormat("#,###");

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            Colors.primaries[Random().nextInt(Colors.primaries.length)].shade200
                .withOpacity(0.20),
            Colors.primaries[Random().nextInt(Colors.primaries.length)].shade200
                .withOpacity(0.20),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(4, 4, 8, 4),
                child: Text(
                  "Free devivery",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "${formatNumber.format(price)} KIP",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                      SizedBox(height: 4),
                      Text(
                        "15-20 mins",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 16,
                    left: 16,
                    right: 16,
                  ),
                  child: Image.asset(
                    "assets/images/avocado.png",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
