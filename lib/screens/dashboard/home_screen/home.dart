import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/screens/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List imglist = [
    "assets/images/offer1.png",
    "assets/images/offer2.png",
    "assets/images/offer3.png",
    // "assets/images/rc-logo.png",
    // "assets/images/idli-prod.png",
    // "assets/images/dosa-prod.png",
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: AppColors.whiteColor),
              expandedHeight: 50.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shopping App',
                          textScaleFactor: 1.1,
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                        Icon(
                          Icons.notifications,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverStickyHeader(
              header: Container(
                height: 55,
                color: AppColors.appColor,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 5, top: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.whiteColor),
                  child: Center(
                    child: TextFormField(
                      cursorColor: AppColors.appColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.greyOp9,
                          ),
                          suffixIcon: Icon(Icons.mic),
                          hintText: "Search Products",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyOp9,
                              fontSize: 16)),
                    ),
                  ),
                ),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20),
                            child: CarouselSlider(
                              carouselController: CarouselController(),
                              options: CarouselOptions(
                                pauseAutoPlayOnTouch: true,
                                height: 140,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                                //enableInfiniteScroll: false,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 2000),
                                reverse: false,
                                autoPlayInterval: Duration(seconds: 2),
                                initialPage: 0,
                                scrollDirection: Axis.horizontal,
                                //enlargeCenterPage: true,
                                autoPlay: true,
                              ),
                              items: imglist.map((imgUrl) {
                                return Builder(builder: (BuildContext context) {
                                  return Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        //width: MediaQuery.of(context).size.width,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            //color: AppColors.appColor,
                                            // gradient: AppColors.appColor,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(imgUrl),
                                                fit: BoxFit.cover)),
                                        // child: Image(
                                        //   image: AssetImage(imgUrl),
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                      Positioned(
                                        bottom: 5,
                                        left: 0,
                                        right: 0,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: map<Widget>(imglist,
                                                (index, url) {
                                              return SizedBox(
                                                width: 14,
                                                child: Container(
                                                  width: 7,
                                                  height: 7,
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 2.0),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: _current == index
                                                          ? Color(0xFFABABAB)
                                                          : Colors.grey[300]),
                                                ),
                                              );
                                            })),
                                      ),
                                    ],
                                  );
                                });
                              }).toList(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shop by Category",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "View all",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: AppColors.appColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 14,
                                      color: AppColors.appColor,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 100,
                                        childAspectRatio: 0.7,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemCount: 10,
                                itemBuilder: (BuildContext ctx, index) {
                                  return GridCategoriesListWidget();
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Popular",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: 25,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                  height: 10,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return PopularListWidget();
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                  childCount: 1,
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40,bottom: 20,left: 10,right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.appColor
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius:50,
                          backgroundColor: AppColors.whiteColor,

                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("User Name",
                            style: TextStyle(color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 25
                            ),
                            ),
                            SizedBox(height: 5,),
                             Text("deepikadeepu1790@gmail.com",
                             overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                            ),
                            )
                          ],),
                        )
                      ],
                    ),
                  ),
                  
                  ListTile(
                    title: const Text('Home',
                     style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                            ),
                    ),
                    leading: Icon(Icons.home,color: AppColors.appColor,),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Cart',
                     style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                            ),
                    ),
                    leading: Icon(Icons.shopping_cart,color: AppColors.appColor,),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                   ListTile(
                    title: const Text('My Orders',
                     style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                            ),
                    ),
                    leading: Icon(Icons.my_library_add,color: AppColors.appColor,),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                   ListTile(
                    title: const Text('Support',
                     style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                            ),
                    ),
                    leading: Icon(Icons.support,color: AppColors.appColor,),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                   ListTile(
                    title: const Text('Privacy & Policy',
                     style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                            ),
                    ),
                    leading: Icon(Icons.privacy_tip,color: AppColors.appColor,),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                   ListTile(
                    title: const Text('Logout',
                     style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                            ),
                    ),
                    leading: Icon(Icons.logout,color: AppColors.appColor,),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Column(
                    children: [
                      Text("Version 1.0.1"),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Container GridCategoriesListWidget() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 50,
            backgroundImage: AssetImage("assets/images/offer3.png"),
          ),
          Text("Healthy"),
        ],
      ),
    );
  }

  Container PopularListWidget() {
    return Container(
      //color: AppColors.appColor,
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                //   color: AppColors.whiteColor,
                image: DecorationImage(
                    image: AssetImage("assets/images/offer1.png"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product Name",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Description",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "\$ Price",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
