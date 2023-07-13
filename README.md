<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 

2 - Do the demo App in english
3 - Translate the demo App in french(Voice Over)
4 - Write the docs in PDF
5 - deploy to pub.dev
-->

## AnkhMocker
This package allow you to generate random data that you can use to fill your UI or make your unit testing

## Download the package 
click on this link https://drive.google.com/file/d/14KA7jyAjBrTp85pwVvJzsKgwDtRjL7-N/view?usp=sharing to download the package
it is a single file

## Features

<ul>
  <li><b>Generate Mock data from your model fields definition</b></li>
  <li>Generate random text from specified length just like lorem ipsum engine</li>
  <li>Generate random image links (avatars,images)</li>
  <li>Generate random date in string format</li>
  <li>Generate random integer in string format</li>
</ul>



## Getting started
To start using the package your must first create a string representation of your model fields inside your class definition just like this, make it static. we are using the model User for our example
<p>Just copy paste it from your model definition to avoid spelling mistakes</p>

```dart
class User{

    // Normal class fields and methods goes here
    
    static String AnkhMockerInit = """{
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

## Usage
After that you can generate a single object like this
```dart
 dynamic userJSON = await AnkhMocker.generateData(
      fieldSchema: User.AnkhMockerInit);
```
<p>AnkhMocker have two Additional parameters</p>
<p><b>1 . delaiInSec</b></p>
<p>Which determine the amount of time (in seconds) to wait before the data is generated. defaults to 1 </p>

```dart
 dynamic userJSON =
      await AnkhMocker.generateData(fieldSchema: User.AnkhMockerInit,delayInSec: 5);
```

<p><b>2 . count</b></p>
<p>This parameter helps you to generate a collection of objects (An array of JSON objects), its value represent the number of objects you want to generate</p>

```dart
 dynamic usersArray =
      await AnkhMocker.generateData(fieldSchema: User.AnkhMockerInit,delayInSec: 5,count: 15);
```

## Additional Features

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
<p>Just make sure the name of the field contains the string <b>len45</b> , the number 45 here represent the length that you want your text to have, you can replace it with any length</p>

```dart
  String userDescriptionlen45;
```

## Generate without a model

<p> You also have the ability to generate random data without the need to define a model</p>
<ul>
  <li>Generate a random text ,  in the example 45 represent the length of the text , you can define any length

  ```dart
  String myText = AnkhMocker.generateText(45);
  ```

  </li>

  <li>Generate  random Date

  ```dart
    // single 
 String myDate = AnkhMocker.generateDate(); // output : 18 jan 2022
  // Multiple
  List<String> myAvatarURLs = AnkhMocker.generateDateList(10);
  ```

  </li>

  <li>Generate random avatarURL

  ```dart
  // single 
 String myAvatarURL = AnkhMocker.generateAvatarURL();
 // Multiple
 List<String> myAvatarURLs = AnkhMocker.generateAvatarURLList(10);
  ```

  </li>

  <li>Generate  random imageURL

  ```dart
  // Single 
 String imageURL = AnkhMocker.generateRandomImageURL();
 //Mulitple
List<String> imageURLs = AnkhMocker.generateImageURLList(10);
  ```

  </li>


</ul>


## Let's connect on twitter 
this is my profile https://twitter.com/neferou_/status/1679088623054929920?s=46&t=LBm7BbTCqcHgoPTZM5SYgQ




## Become our sponsor

If you found the package useful, you can support either in Crypto 😏 (BTC or ETH), here are my wallets adresses

Bitcoin
  ```dart
bc1q8n7z8uyz84p9gv00ytvc2w3k3jhlyz6j85drwh
  ```

Ethereum
  ```dart
0x8D0E3Bb7EB460E518A5D1203eb71b86097f04bda
  ```

Tether (BEP20)
  ```dart
0x8D0E3Bb7EB460E518A5D1203eb71b86097f04bda
  ```

Tether (ERC20)
  ```dart
0x8D0E3Bb7EB460E518A5D1203eb71b86097f04bda
  ```

BNB
  ```dart
0x8D0E3Bb7EB460E518A5D1203eb71b86097f04bda
  ```

<h2>Or with electronic Cash , below are my coordinates</h2>

Orange Money - Cameroon - name : Tesse brunel
  ```dart
697830071
  ```

MTN mobile money - Cameroon - name : Hamadjoda
  ```dart
678724995
  ```

Tap Tap Send - Cameroon 
  ```dart
678724995
  ```
