# Dart/Flutter version of Rocket Launcher Demo

Rocket Launcher using [Rocket lib](/docs/rocket-lib/api/index.html) which uses [SAMCAS](/docs/samcas/api/index.html) library as its engine.

## Description

This sample app implements in Dart using the Flutter platform an enhanced version of the
"Rocket launcher" used as a sample project to demonstrate the *SAM* pattern proposed by
[Jean-Jacques Dubray](https://www.infoq.com/profile/Jean~Jacques-Dubray) and explained at
[sam.js.org](https://sam.js.org/).

*SAM* (State-Action-Model) is a software engineering pattern that helps manage the application state and reason about temporal aspects with precision and clarity.
In brief, it provides a robust pattern with which to organize complex state mutations found in modern applications.

The Dart version of [SAMCAS](/docs/samcas/api/index.html) is a table driven approach to the *SAM* pattern and extends the *SAM* pattern
by including a simple signal protocol for child models to inform their parents of their state changes.

This *Rocket App* serves to introduce the steps needed to incorporate a [SAMCAS](/docs/samcas/api/index.html) model into a Flutter app.

The source code available at [rocket-dart-app](https://github/srp7474/rocket-dart-app) along with these documents
can be used as a road map to build a [SAMCAS](/docs/samcas/api/index.html) application.

The companion [Missile](../../missile/api/index.html) is more complex and documents a greater variety of steps
needed to incorporate the [SAMCAS](/docs/samcas/api/index.html) facility into a Flutter app.

## Purpose

The Flutter/Dart objective to have one code base generate working apps on several platforms is
ambitious. This simple app demonstrates, with qualifiers, it is a working reality.

## License

**Copyright (c) 2020 Steve Pritchard of Rexcel Systems Inc.**

Released under the [The MIT License](https://opensource.org/licenses/MIT)

## Reference Resources ##

* Sam Methodology [sam.js.org](https://sam.js.org/)

* The [SAMCAS](/docs/samcas/api/index.html) library

* The [Rocket lib](/docs/rocket-lib/api/index.html) library

* The [Rocket App](/docs/rocket/api/index.html) a simple SAMCAS example

* The [Missile App](/docs/missile/api/index.html) a more complex SAMCAS example

## Source repository at GitHub ##

* [samcas-lib-dart](https://github.com/srp7474/samcas-lib-dart) SAMCAS library

* [rocket-lib-dart](https://github.com/srp7474/rocket-lib-dart) Rocket component

* [rocket-app-dart](https://github.com/srp7474/rocket-app-dart) Rocket app, needs SAMCAS library, Rocket component

* [missile-app-dart](https://github.com/srp7474/missile-app-dart) Missile App, needs SAMCAS library, Rocket component
