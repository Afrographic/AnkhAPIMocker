<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

This package allow your to generate random data that you can use to fill your UI or make your unit testing

## Features

<ul>
  <li><b>Generate Mock data from your model to fill your UI</b></li>
  <li>Generate random image links (avatars,images)</li>
  <li>Generate random date</li>
  <li>Generate random text just like lorem ipsum engine</li>
</ul>

## Getting started
To start using the package your must first create a string representation of your model fields inside your class definition just like this, make it static. we are using the model User for our example
```dart
class User{

    // Normal class fields and methods goes here
    
    static String AnkhAPIMockerInit = """{
        int idUser;
        String avatar;
        String coverImage;
        String fullName;
        String startDate;
        String descriptionlen45;
        bool isOnline;
    }""";
}
```
Check the video below for more information

## Usage
After that you can generate a single object like this
```dart
 dynamic userJSON = await AnkhAPIMocker.generateData(
      fieldSchema: User.AnkhAPIMockerInit);
```

## Additional information

You can support me if you find the package useful
