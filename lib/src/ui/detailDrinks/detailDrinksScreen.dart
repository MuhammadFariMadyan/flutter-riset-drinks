import 'dart:io';
import 'package:drinks_flutter_before/src/blocs/detailDrinks/detailDrinksBloc.dart';
import 'package:drinks_flutter_before/src/database/entity/favoriteDrink.dart';
import 'package:drinks_flutter_before/src/models/lookupDrinksById/lookupDrinksById.dart';
import 'package:drinks_flutter_before/src/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailDrinksScreen extends StatefulWidget {
  final String idDrink;
  final String strDrink;
  final String strDrinkThumb;
  final FavoriteDrink favoriteDrink;

  DetailDrinksScreen(
      {this.idDrink, this.strDrink, this.strDrinkThumb, this.favoriteDrink});

  @override
  _DetailDrinksScreenState createState() => _DetailDrinksScreenState();
}

class _DetailDrinksScreenState extends State<DetailDrinksScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            _buildWidgetImageHeader(mediaQuery),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.arrow_back, color: Colors.black87),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            _buildWidgetDetailDrink(mediaQuery, context),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetImageHeader(MediaQueryData mediaQuery) {
    return Hero(
      tag:
          "image_detail_drinks_${widget.idDrink ?? widget.favoriteDrink.idDrink}",
      child: FadeInImage(
        image: NetworkImage(
            widget.strDrinkThumb ?? widget.favoriteDrink.strDrinkThumb),
        placeholder: AssetImage("assets/images/img_placeholder.jpg"),
        fit: BoxFit.cover,
        width: double.infinity,
        height: mediaQuery.size.height / 2.2,
      ),
    );
  }

  Widget _buildWidgetDetailDrink(
      MediaQueryData mediaQuery, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: mediaQuery.size.height / 2.5),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.0),
          topRight: Radius.circular(28.0),
        ),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: SafeArea(
            left: false,
            top: false,
            right: false,
            child: ListView(
              padding: EdgeInsets.only(
                left: 16.0,
                top: 16.0,
                right: 16.0,
              ),
              children: <Widget>[
                _buildTitleDrink(context),
                _buildWidgetDataDetailDrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleDrink(BuildContext context) {
    return Text(
      widget.strDrink ?? widget.favoriteDrink.strDrink,
      style: Theme.of(context)
          .textTheme
          .title
          .merge(TextStyle(fontWeight: FontWeight.bold)),
      maxLines: 2,
    );
  }

  Widget _buildWidgetDataDetailDrink() {
    if (widget.favoriteDrink == null) {
      return FutureBuilder(
        future: detailsDrinksBloc.getDetailsDrinksById(widget.idDrink),
        builder:
            (BuildContext context, AsyncSnapshot<LookupDrinksById> snapshot) {
          if (snapshot.hasData) {
            LookupDrinksById lookupDrinksById = snapshot.data;
            var detailDrinks = lookupDrinksById.lookupDrinksByIdItems[0];
            return _buildWidgetBottomSheet(
                detailDrinks: detailDrinks, context: context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Center(child: buildCircularProgressIndicator()),
          );
        },
      );
    } else {
      return _buildWidgetBottomSheet(context: context);
    }
  }

  Widget _buildWidgetBottomSheet(
      {LookupDrinksByIdItem detailDrinks, BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTagDrink(
            detailDrinks?.strTags ?? widget.favoriteDrink?.strTags ?? null),
        Padding(padding: EdgeInsets.only(top: 24.0)),
        _buildWidgetPanelInfoGeneralDrink(detailDrinks),
        Padding(padding: EdgeInsets.only(top: 24.0)),
        Text(
          "Ingredients",
          style: Theme.of(context).textTheme.title,
        ),
        _buildWidgetInfoIngredients(detailDrinks),
        Padding(padding: EdgeInsets.only(top: 24.0)),
        Text(
          "Instructions",
          style: Theme.of(context).textTheme.title,
        ),
        _buildWidgetInfoInstructions(
          detailDrinks?.strInstructions ??
              widget.favoriteDrink?.strInstructions ??
              "",
        ),
      ],
    );
  }

  Widget _buildTagDrink(String strTags) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.label,
          color: Colors.black26,
          size: 24.0,
        ),
        Padding(padding: EdgeInsets.only(left: 4.0)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 3.5),
            child: Text(
              strTags != null
                  ? strTags.substring(0, strTags.length - 1)
                  : "N/A",
              style: TextStyle(color: Colors.grey),
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWidgetPanelInfoGeneralDrink(LookupDrinksByIdItem detailDrinks) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        // _buildWidgetInfoPlayVideo(
        //     detailDrinks?.strVideo ?? widget.favoriteDrink?.strVideo ?? ""),
        // Padding(padding: EdgeInsets.only(left: 8.0)),
        // _buildVerticalDivider(),
        Padding(padding: EdgeInsets.only(left: 8.0)),
        _buildWidgetInfoCategoryDrink(detailDrinks?.strCategory ??
            widget.favoriteDrink?.strCategory ??
            ""),
        Padding(padding: EdgeInsets.only(left: 8.0)),
        _buildVerticalDivider(),
        Padding(padding: EdgeInsets.only(left: 8.0)),
        _buildWidgetInfoGlassDrink(
            detailDrinks?.strGlass ?? widget.favoriteDrink?.strGlass ?? ""),
        Padding(padding: EdgeInsets.only(left: 8.0)),
      ],
    );
  }

  Widget _buildWidgetInfoPlayVideo(String strVideo) {
    return GestureDetector(
      onTap: () async {
        if (strVideo.isNotEmpty) {
          if (Platform.isIOS) {
            if (await canLaunch(strVideo)) {
              await launch(strVideo, forceSafariVC: false);
            } else {
              if (await canLaunch(strVideo)) {
                await launch(strVideo);
              } else {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("Could not play video")));
                throw "Could not play video";
              }
            }
          } else {
            if (await canLaunch(strVideo)) {
              await launch(strVideo);
            } else {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Could not play video")));
              throw "Could not play video";
            }
          }
        }
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.ondemand_video,
            size: 28.0,
          ),
          Padding(padding: EdgeInsets.only(left: 8.0)),
          Column(
            children: <Widget>[
              Text(strVideo.isEmpty ? "Video" : "Play"),
              Text(
                strVideo.isEmpty ? "N/A" : "Video",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      color: Colors.grey,
      width: 1.0,
      height: 42.0,
    );
  }

  Widget _buildWidgetInfoCategoryDrink(String strCategory) {
    return Column(
      children: <Widget>[
        Text("Category"),
        Text(strCategory.isEmpty ? "N/A" : strCategory,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildWidgetInfoIngredients(LookupDrinksByIdItem detailDrinks) {
    List<String> ingredientsTemp = [];
    if (detailDrinks == null) {
      ingredientsTemp
        ..add((widget.favoriteDrink.strMeasure1 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient1 ?? ""))
        ..add((widget.favoriteDrink.strMeasure2 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient2 ?? ""))
        ..add((widget.favoriteDrink.strMeasure3 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient3 ?? ""))
        ..add((widget.favoriteDrink.strMeasure4 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient4 ?? ""))
        ..add((widget.favoriteDrink.strMeasure5 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient5 ?? ""))
        ..add((widget.favoriteDrink.strMeasure6 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient6 ?? ""))
        ..add((widget.favoriteDrink.strMeasure7 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient7 ?? ""))
        ..add((widget.favoriteDrink.strMeasure8 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient8 ?? ""))
        ..add((widget.favoriteDrink.strMeasure9 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient9 ?? ""))
        ..add((widget.favoriteDrink.strMeasure10 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient10 ?? ""))
        ..add((widget.favoriteDrink.strMeasure11 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient11 ?? ""))
        ..add((widget.favoriteDrink.strMeasure12 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient12 ?? ""))
        ..add((widget.favoriteDrink.strMeasure13 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient13 ?? ""))
        ..add((widget.favoriteDrink.strMeasure14 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient14 ?? ""))
        ..add((widget.favoriteDrink.strMeasure15 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient15 ?? ""))
        ..add((widget.favoriteDrink.strMeasure16 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient16 ?? ""))
        ..add((widget.favoriteDrink.strMeasure17 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient17 ?? ""))
        ..add((widget.favoriteDrink.strMeasure18 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient18 ?? ""))
        ..add((widget.favoriteDrink.strMeasure19 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient19 ?? ""))
        ..add((widget.favoriteDrink.strMeasure20 ?? "") +
            " " +
            (widget.favoriteDrink.strIngredient20 ?? ""));
    } else {
      ingredientsTemp
        ..add((detailDrinks.strMeasure1 ?? "") +
            " " +
            (detailDrinks.strIngredient1 ?? ""))
        ..add((detailDrinks.strMeasure2 ?? "") +
            " " +
            (detailDrinks.strIngredient2 ?? ""))
        ..add((detailDrinks.strMeasure3 ?? "") +
            " " +
            (detailDrinks.strIngredient3 ?? ""))
        ..add((detailDrinks.strMeasure4 ?? "") +
            " " +
            (detailDrinks.strIngredient4 ?? ""))
        ..add((detailDrinks.strMeasure5 ?? "") +
            " " +
            (detailDrinks.strIngredient5 ?? ""))
        ..add((detailDrinks.strMeasure6 ?? "") +
            " " +
            (detailDrinks.strIngredient6 ?? ""))
        ..add((detailDrinks.strMeasure7 ?? "") +
            " " +
            (detailDrinks.strIngredient7 ?? ""))
        ..add((detailDrinks.strMeasure8 ?? "") +
            " " +
            (detailDrinks.strIngredient8 ?? ""))
        ..add((detailDrinks.strMeasure9 ?? "") +
            " " +
            (detailDrinks.strIngredient9 ?? ""))
        ..add((detailDrinks.strMeasure10 ?? "") +
            " " +
            (detailDrinks.strIngredient10 ?? ""))
        ..add((detailDrinks.strMeasure11 ?? "") +
            " " +
            (detailDrinks.strIngredient11 ?? ""))
        ..add((detailDrinks.strMeasure12 ?? "") +
            " " +
            (detailDrinks.strIngredient12 ?? ""))
        ..add((detailDrinks.strMeasure13 ?? "") +
            " " +
            (detailDrinks.strIngredient13 ?? ""))
        ..add((detailDrinks.strMeasure14 ?? "") +
            " " +
            (detailDrinks.strIngredient14 ?? ""))
        ..add((detailDrinks.strMeasure15 ?? "") +
            " " +
            (detailDrinks.strIngredient15 ?? ""))
        ..add((detailDrinks.strMeasure16 ?? "") +
            " " +
            (detailDrinks.strIngredient16 ?? ""))
        ..add((detailDrinks.strMeasure17 ?? "") +
            " " +
            (detailDrinks.strIngredient17 ?? ""))
        ..add((detailDrinks.strMeasure18 ?? "") +
            " " +
            (detailDrinks.strIngredient18 ?? ""))
        ..add((detailDrinks.strMeasure19 ?? "") +
            " " +
            (detailDrinks.strIngredient19 ?? ""))
        ..add((detailDrinks.strMeasure20 ?? "") +
            " " +
            (detailDrinks.strIngredient20 ?? ""));
    }
    List<String> ingredients = [];
    for (String ingredientItem in ingredientsTemp) {
      if (ingredientItem.trim().isEmpty) {
        break;
      }
      ingredients.add(ingredientItem);
    }
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
      child: ListView.builder(
        padding: EdgeInsets.all(0.0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                  ),
                  width: 6.0,
                  height: 6.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 16.0)),
              Expanded(
                child: Text(ingredients[index]),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWidgetInfoInstructions(String strInstructions) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 16.0),
      child: Text(strInstructions.isEmpty ? "N/A" : strInstructions),
    );
  }

  Widget _buildWidgetInfoGlassDrink(String strTags) {
    return Column(
      children: <Widget>[
        Text("Glass"),
        Text(strTags.isEmpty ? "N/A" : strTags,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
