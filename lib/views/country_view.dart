import 'package:flutter/material.dart';
import 'package:news_app/widgets/app_bar.dart';
import 'package:flag/flag.dart';
import 'package:news_app/helper/data.dart';

class CountryPage extends StatefulWidget {
  static const id = 'country';

  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  Widget _countryCard(String text, String code) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, code);
      },
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.4,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Flag.fromString(
                  code.toUpperCase(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getList() {
    List<Widget> childs = [];
    for (var i = 0; i < countries.length; i++) {
      childs.add(_countryCard(countries[i]["name"]!, countries[i]["code"]!));
    }
    return childs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: MyAppBar(appBar: AppBar(), paddingLeft: 0, actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.only(left: 22),
              child: Icon(Icons.ac_unit),
            ),
          )
        ]),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverGrid.count(
              childAspectRatio: 1,
              mainAxisSpacing: 0,
              crossAxisCount: 3,
              children: getList(),
            ),
          ],
        ));
  }
}
