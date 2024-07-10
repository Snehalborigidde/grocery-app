//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: const TextSpan(
                    text: 'Hi,   ',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'MyName',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'snehal@gmail.com',
                color: color,
                textSize: 18,
                //isTitle: true,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              _listTiles(
                title: 'Address 2',
                subtitle: "hello world",
                icon: IconlyLight.profile,
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                title: 'Orders',
                icon: IconlyLight.bag,
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                title: 'Wishlist',
                icon: IconlyLight.heart,
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                title: 'Viewed',
                icon: IconlyLight.show,
                onPressed: () {},
                color: color,
              ),
              _listTiles(
                title: 'Forgot Password',
                icon: IconlyLight.unlock,
                onPressed: () {},
                color: color,
              ),
              SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? 'Dark mode' : 'light mode',
                    color: color,
                    textSize: 18,
                    //isTitle: true,
                  ),
                  secondary: Icon(themeState.getDarkTheme
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onChanged: (bool value) {
                    themeState.setDarkTheme = value;
                  },
                  value: themeState.getDarkTheme),
              _listTiles(
                title: 'Log Out',
                icon: IconlyLight.logout,
                onPressed: () {},
                color: color,
              )
            ],
          ),
        )),
      ),
    );
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required IconData icon,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        text: title,
        color: color,
        textSize: 22,
        //isTitle: true,
      ),
      subtitle: TextWidget(
          text: subtitle == null ? " " : subtitle, color: color, textSize: 15),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
