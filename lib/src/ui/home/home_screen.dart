import 'package:drinks_flutter_before/src/blocs/home/homeBloc.dart';
import 'package:drinks_flutter_before/src/blocs/listDrinks/listDrinksBloc.dart';
import 'package:drinks_flutter_before/src/database/entity/favoriteDrink.dart';
import 'package:drinks_flutter_before/src/models/filterCategories/filterCategories.dart';
import 'package:drinks_flutter_before/src/models/listCategoriesModel.dart';
import 'package:drinks_flutter_before/src/models/lookupDrinksById/lookupDrinksById.dart';
import 'package:drinks_flutter_before/src/ui/detailDrinks/detailDrinksScreen.dart';
import 'package:drinks_flutter_before/src/util/appTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drinks_flutter_before/src/util/utils.dart';
import 'package:drinks_flutter_before/src/models/drinksModel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.filterCategoryItem}) : super(key: key);

  final String title;
  final FilterCategoryItem filterCategoryItem;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  bool multiple = true;

  @override
  void initState() {
    // homeBloc.getCategories();
    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    // homeBloc.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: new Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      _buildWidgetContent(),
                      // _buildWidgetContentHome(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  "Daftar Minuman",
                  style: new TextStyle(
                    fontSize: 22,
                    color: AppTheme.darkText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.search : Icons.view_agenda,
                    color: AppTheme.dark_grey,
                  ),
                  onTap: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetContent() {
    var mediaQuery = MediaQuery.of(context);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("     Popular Drinks",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .merge(TextStyle(color: AppTheme.primaryTextColor))),
          Padding(padding: EdgeInsets.only(top: 4.0)),
          _buildPopularDrinksStatic(mediaQuery),
          Padding(padding: EdgeInsets.only(top: 6.0)),
          Text("     Latest Drinks",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .merge(TextStyle(color: AppTheme.primaryTextColor))),
          Padding(padding: EdgeInsets.only(top: 4.0)),
          _buildLatestDrinksStatic(mediaQuery),
          Padding(padding: EdgeInsets.only(top: 6.0)),
          Text("     Category",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .merge(TextStyle(color: AppTheme.primaryTextColor))),
          Padding(padding: EdgeInsets.only(top: 4.0)),
          _buildListCategoriesStatic(mediaQuery),
        ],
      ),
    );
  }

  // Sumber data dari model yang statis - bukan dari API Endpoint langsung
  Widget _buildLatestDrinksStatic(MediaQueryData mediaQuery) {
    return FutureBuilder(
      future: homeBloc.getStaticData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: mediaQuery.size.width / 2 - 32.0, // 160.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Drinks.latestDrinksList.length,
              itemBuilder: (context, index) {
                var latestDrinks = Drinks.latestDrinksList[index];
                return Container(
                  width: mediaQuery.size.width / 2 - 52.0, // 140.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              // return DetailDrinkScreen(
                              //   id: latestDrinks.id,
                              //   name: latestDrinks.name,
                              //   imagePath: latestDrinks.imagePath,
                              // );
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          color: Colors.white,
                          elevation: 3.0,
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    width: mediaQuery.size.width / 2 -
                                        62.0, // 130.0,
                                    height: mediaQuery.size.width / 2 -
                                        82.0, // 110.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          latestDrinks.imagePath,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // var isFavorite =
                                      //     widget.filterCategoryItem.isFavorite;
                                      // if (isFavorite) {
                                      //   listMealsBloc
                                      //       .deleteFavoriteMealById(widget
                                      //           .filterCategoryItem.idMeal)
                                      //       .then((status) {
                                      //     setState(() {
                                      //       widget.filterCategoryItem
                                      //           .isFavorite = !isFavorite;
                                      //     });
                                      //   });
                                      // } else {
                                      //   Future<LookupMealsById>
                                      //       lookupMealsById = listMealsBloc
                                      //           .getDetailMealById(widget
                                      //               .filterCategoryItem.idMeal);
                                      //   lookupMealsById.then((value) {
                                      //     if (value != null) {
                                      //       var item =
                                      //           value.lookupMealsbyIdItems[0];
                                      //       FavoriteMeal favoriteMeal =
                                      //           FavoriteMeal.fromJson(
                                      //               item.toJson());
                                      //       listMealsBloc
                                      //           .addFavoriteMeal(favoriteMeal)
                                      //           .then((status) {
                                      //         setState(() {
                                      //           widget.filterCategoryItem
                                      //               .isFavorite = !isFavorite;
                                      //         });
                                      //       });
                                      //     } else {
                                      //       Scaffold.of(context).showSnackBar(
                                      //           SnackBar(
                                      //               content: Text(
                                      //                   "Failed added to favorite meal")));
                                      //     }
                                      //   });
                                      // }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white70,
                                      child: Icon(
                                        // widget.filterCategoryItem.isFavorite
                                        //     ? Icons.favorite
                                        //     :
                                        Icons.favorite_border,
                                        color: Colors.black,
                                        size: 15.0,
                                      ),
                                      maxRadius: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                              ),
                              // Hero(
                              //   tag:
                              //       "label_item_latest_drinks_${latestDrinks.name}",
                              //   child:
                              // ),
                              Text(
                                latestDrinks.name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: buildCircularProgressIndicator());
      },
    );
  }

  Widget _buildPopularDrinksStatic(MediaQueryData mediaQuery) {
    return FutureBuilder(
      future: homeBloc.getStaticData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: mediaQuery.size.width / 2 - 32.0, // 160.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Drinks.popularDrinksList.length,
              itemBuilder: (context, index) {
                var popularDrinks = Drinks.popularDrinksList[index];
                return Container(
                  width: mediaQuery.size.width / 2 - 52.0, // 140.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return DetailDrinksScreen(
                                idDrink: popularDrinks.id,
                                strDrink: popularDrinks.name,
                                strDrinkThumb: popularDrinks.imagePath,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          color: Colors.white,
                          elevation: 3.0,
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    width: mediaQuery.size.width / 2 -
                                        62.0, // 130.0,
                                    height: mediaQuery.size.width / 2 -
                                        82.0, // 110.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          popularDrinks.imagePath,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {                                      
                                      var isFavorite =
                                         popularDrinks.isFavorite;
                                      if (isFavorite) {
                                        listDrinksBloc
                                            .deleteFavoriteDrinkById(popularDrinks.id)
                                            .then((status) {
                                          setState(() {
                                           popularDrinks
                                                .isFavorite = !isFavorite;
                                          });
                                        });
                                      } else {
                                        Future<LookupDrinksById>
                                            lookupDrinksById = listDrinksBloc
                                                .getDetailDrinkById(popularDrinks.id);
                                        lookupDrinksById.then((value) {
                                          if (value != null) {
                                            var item = value.lookupDrinksByIdItems[0];                                                
                                            FavoriteDrink favoriteDrink =
                                                FavoriteDrink.fromJson(
                                                    item.toJson());
                                            listDrinksBloc
                                                .addFavoriteDrink(favoriteDrink)
                                                .then((status) {
                                              setState(() {
                                               popularDrinks
                                                    .isFavorite = !isFavorite;
                                              });
                                            });
                                          } else {
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        "Failed added to favorite drink")));
                                          }
                                        });
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white70,
                                      child: Icon(
                                       popularDrinks.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,                                        
                                        color: Colors.black,
                                        size: 15.0,
                                      ),
                                      maxRadius: 10.0,
                                    ),
                                  ),
                                  // Hero(
                                  //   tag:
                                  //       "label_item_popular_drinks_${popularDrinks.name}",
                                  //   child:
                                  // ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                              ),
                              Text(
                                popularDrinks.name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: buildCircularProgressIndicator());
      },
    );
  }

  Widget _buildListCategoriesStatic(MediaQueryData mediaQuery) {
    return FutureBuilder(
      future: homeBloc.getStaticData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: mediaQuery.size.width / 2 - 32.0, // 160.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ListCategories.listCategoriesList.length,
              itemBuilder: (context, index) {
                var category = ListCategories.listCategoriesList[index];
                return Container(
                  width: mediaQuery.size.width / 2 - 52.0, // 140.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              // return DetailDrinkScreen(
                              //   id: category.id,
                              //   name: category.name,
                              //   imagePath: category.imagePath,
                              // );
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          color: Colors.white,
                          elevation: 3.0,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width:
                                    mediaQuery.size.width / 2 - 62.0, // 130.0,
                                height:
                                    mediaQuery.size.width / 2 - 82.0, // 110.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      category.imagePath,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                              ),
                              Hero(
                                tag:
                                    "label_item_category_${category.strCategory}",
                                child: Text(
                                  category.strCategory,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: buildCircularProgressIndicator());
      },
    );
  }
}
