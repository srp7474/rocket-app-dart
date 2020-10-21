/* MIT License
Copyright (c) <2020> <Steve Pritchard of Rexcel Systems Inc.>

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

/// The rocket portion of the app provides an framework with which to host the *rocket-lib* library.
///
/// Typically many of these classes and methods would be *private*.  They are kept *public* here so that the code can
/// be documented.
///
/// Names are very important in Flutter applications and can be used to find
/// dependent parts of application code using the tools provided with *Android Studio*
/// (and presumably with *Visual Studio*).
///
/// During development we use [log] statements to record useful data and to
/// ascertain timing and sequencing of events. We use the [log] statement wrapped in an
/// *assert* statement so that the log statement and literal values disappear in production mode.
///
/// The dart literal interpolation is a major help in doing the logging.
library rocket;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:rocket_widget/rocket_widget.dart';
import 'package:samcas/samcas.dart';
import 'package:samcas/samwig.dart';


/// Standard entry point to Flutter app
void main() {
  runApp(RocketApp());
}

/// Standard MyApp widget for a Flutter app
///
/// Note that it uses [PlatformProvider] so that the app can switch between
/// [MaterialApp] and [CupertinoApp] modes automatically depending on the platform.
/// Note that this means widgets classes for the other will be present but dormant on the
/// host platform.
class RocketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log("RocketApp.build invoked v1.0");
    return PlatformProvider(
      initialPlatform:  TargetPlatform.iOS, // To jam the platform for testing.
      builder:(_) => PlatformApp(
        title: 'Rocket App Flutter/SAMCAS Demo',
        material:(_,__) => MaterialAppData(theme: materialThemeData),
        cupertino:(_,__) => CupertinoAppData(theme: cupertinoTheme),
        home: RocketAppPage(title: 'SAMCAS Rocket Launcher v1.1'),
    ),
    );
  }
}

/// The default Theme setup for Material mode.
final materialThemeData = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  accentColor: Colors.blue,
  appBarTheme: AppBarTheme(color: Colors.blue.shade600),
  primaryColor: Colors.blue,
  secondaryHeaderColor: Colors.blue,
  canvasColor: Colors.blue,
  backgroundColor: Colors.red,
  textTheme: TextTheme().copyWith(bodyText1: TextTheme().bodyText2)
);

/// The default Theme setup for Cupertino mode.
final cupertinoTheme = CupertinoThemeData(
    primaryColor: Colors.blue,
    barBackgroundColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white
);

/// Standard MyHomePage stateful widget for a Flutter app
///
/// This is where we build the Rocket model that is a extended
/// SamModel that is not yet activated (still in [SE.ss_virgin] state).
///
class RocketAppPage extends StatefulWidget {
  RocketAppPage({Key key, this.title}) : super(key: key);
  final String title;
  final Rocket _rocket = buildSamModel(RocketFactory(RK.values),Rocket(name:'Saturn'));

  @override
  _RocketAppPageState createState() => _RocketAppPageState(_rocket);
}

/// Standard MyHomePage state portion of stateful widget for a Flutter app
///
/// We pass in the Rocket model so that it can be injected into the widget tree.
///
class _RocketAppPageState extends State<RocketAppPage> /*implements DartState*/ {
  final Rocket _rocket;
  _RocketAppPageState(this._rocket) {
    log("MyHomePageState");
  }

  /// The build function that builds the app widget tree.
  ///
  /// Note that it uses [PlatformScaffold] and [PlatformAppBar] so that the
  /// widgets produced will conform to the suggested host platform design.
  ///
  /// The crucial statement in this tree is the [samInject] method call used to
  /// inject the [SamModel] Rocket widget into the widget tree.
  @override
  Widget build(BuildContext context) {
    //this._rocket.setDartState(this,context);
    log("Rocket build executing null=${_rocket == null}");

    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(widget.title, /*style: toolbarTextStyle,*/),
          cupertino: (_,__)=> CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize:MainAxisSize.min,
            children: [
              Spacer(),
              samInject(_rocket),
              Spacer(),
              bottomSheet(),
            ],
          ),
        ),
    );
  }

  /// Produce an app description that shows at the bottom of the screen.
  ///
  /// Note that this method uses the [samcas] supplied [Para] class to format rich text for the
  /// description.
  Widget bottomSheet() {
    return
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            style: BorderStyle.solid,
            color: Colors.grey,
          ),
          color: Color.fromRGBO(242, 240, 249, 1),
        ),
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(10),
            constraints: new BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 5),
            child: Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                Para().p("This is a demonstration implementation of ").a("SAMCAS","http:stevepritchard.ca",bold:true)
                    .p(" that was inspired by the methodology proposed by Jean-Jacques Dubray found at ")
                    .a("The SAM Pattern","https://sam.js.org/")
                    .p(" and implemented using the ").b("Dart/Flutter").p(" platform.")
                    .emit(),
                Para().p("This app is an enhanced  Dart implementation of Jean-Jacques Dubray's Rocket Lauuncher example. It demonstrates the component capability of ").b("SAMCAS")
                    .p(". The Flutter rendering design is highly compatible with the SAM methodology and results in a resource (memory, CPU) efficient application.")
                    .emit(),
                Para().p("Thanks to the ").b("Dart/Flutter").p(" development platform the same codebase will execute")
                    .p(" in a Web browser, on a Linux/Windows/MAC desktop or on phone/tablet devices running Android or iOS.")
                    .p(" The first 3 can be obtained at.")
                    .a("SAMCAS implementations","http://stevepritchard.ca/")
                    .p(" while the Android an iOS implementations may be found at ").i("The Google Play Store").p(" or ").i("The Apple Store").p(" respectively.")
                    .emit(),
              ],
            ),
          ),
        ]),
      );
  }
}
