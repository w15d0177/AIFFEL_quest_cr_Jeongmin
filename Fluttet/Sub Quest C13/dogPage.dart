import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool args = ModalRoute.of(context)?.settings.arguments as bool;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              leading: Icon(FontAwesomeIcons.dog), title: Text('Second Page')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    child: Text('Back'),
                    onPressed: () => (Navigator.pushNamed(context, '/'))),
                InkWell(
                  onTap: () {
                    print('is_cat : $args');
                  },
                  child: Image.asset(
                    'images/white.png',
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
