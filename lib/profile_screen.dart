import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool themeLight = true;
  @override
  void initState() {
    setTheme();
    super.initState();
  }

  setTheme() {
    if (AdaptiveThemeMode.dark == AdaptiveTheme.of(context).mode) {
      setState(() {
        themeLight = false;
      });
    } else {
      setState(() {
        themeLight = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(elevation: 0, actions: [
          IconButton(
            icon: const Icon(
              Icons.dark_mode,
            ),
            onPressed: () {
              if (AdaptiveThemeMode.dark == AdaptiveTheme.of(context).mode) {
                AdaptiveTheme.of(context).setLight();
                setState(() {
                  themeLight = false;
                });
              } else {
                AdaptiveTheme.of(context).setDark();
                setState(() {
                  themeLight = true;
                });
              }
            },
          ),
        ]),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.orange, width: 3),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.person,
                    color: Colors.orange,
                  )),
              Text("\nJohn Doe",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(
                "\njohn.doe@example.com\n",
              ),
              FractionallySizedBox(
                  widthFactor:
                      0.5, // means 100%, you can change this to 0.8 (80%)
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      "Upgrade to PRO",
                    ),
                  )),
              listTileProfilePage(
                "Privacy",
                Icon(Icons.privacy_tip),
                Icon(Icons.privacy_tip),
              )
            ],
          ),
        ));
  }
}

class listTileProfilePage extends StatelessWidget {
  final text;
  final leadingIcon;
  final trailingIcon;
  listTileProfilePage({this.text, this.leadingIcon, this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: ListTile(
          tileColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          title: Text(text),
          trailing: leadingIcon,
          leading: trailingIcon),
    );
  }
}
