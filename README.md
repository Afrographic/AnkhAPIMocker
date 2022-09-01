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
  <li><b>Generate Mock data from your model fields definition</b></li>
  <li>Generate random image links (avatars,images)</li>
  <li>Generate random date in string format</li>
  <li>Generate random text from specified length just like lorem ipsum engine</li>
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
<p>AnkhAPIMocker have two Additional parameters</p>
<p><b>1 . delaiInSec</b></p>
<p>Which determine the amount of time (in seconds) to wait before the data is generated</p>

```dart
 dynamic userJSON =
      await AnkhAPIMocker.generateData(fieldSchema: User.AnkhAPIMockerInit,delayInSec: 5);
```

<p><b>2 . count</b></p>
<p>This parameters helps to render a collection of objects (An array of JSON objects), its value represent the number of objects you want to render</p>

```dart
 dynamic usersArray =
      await AnkhAPIMocker.generateData(fieldSchema: User.AnkhAPIMockerInit,delayInSec: 5,count: 15);
```

<h3>How to generate a random avatar image ?</h3>
<p>Just make sure the name of the field contains the string <b>avatar</b></p>

```dart
  String userAvatar;
```


<h3>How to generate a random image ?</h3>
<p>Just make sure the name of the field contains the string <b>image</b></p>

```dart
  String coverImage;
```


<h3>How to generate a random date ?</h3>
<p>Just make sure the name of the field contains the string <b>date</b></p>

```dart
  String createdDate;
```

<h3>How to generate a random text ?</h3>
<p>Just make sure the name of the field contains the string <b>len45</b> , the number 45 here represent the length that you want your text to have</p>

```dart
  String userDescriptionlen45;
```

<p> You also have the ability to generate random data without the need to define a model</p>
<ul>
  <li>Generate a random text ,  int the example 45 reprensent the length of the text

  ```dart
  String myText = AnkhAPIMocker.generateText(45);
  ```

  </li>

  <li>Generate a random Date

  ```dart
 String myDate = AnkhAPIMocker.generateDate(); // output : 18 jan 2022
  ```

  </li>

  <li>Generate a random avatarURL

  ```dart
 String myAvatarURL =AnkhAPIMocker.generateAvatarURL();
  ```

  </li>

  <li>Generate a random imageURL

  ```dart
 String imageURL = AnkhAPIMocker.generateRandomImageURL();
  ```

  </li>


</ul>



## Additional information

If you found the package useful, you can support me by sending me some cryptoCurrencies (BTC or ETH), here are my wallets adresses

Bitcoin
  ```dart
333JVoZfoeGVWdCkwaqbkXajBCKf4HhJ9f
  ```

Ethereum
  ```dart
 0xEBceEe5F8510D548c80d7238d7224a736E96F9Cc
  ```
