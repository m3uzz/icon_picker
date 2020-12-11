# icon_picker

[![pub package](https://img.shields.io/pub/v/icon_picker.svg)](https://pub.dartlang.org/packages/icon_picker)

A Flutter widget to show an icon collection to pick.\
This widget extend TextField and has a similar behavior as TextFormField

## Usage

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  icon_picker: "^1.1.1"
```

In your library add the following import:

```dart
import 'package:icon_picker/icon_picker.dart';
```

For help getting started with Flutter, view the online [documentation](https://flutter.io/).

## Example

IconPicker use an internal `MaterialIcon` collection by default, but you can set your own icon collection.\
You just need to pass in iconCollection param a `Map<String, IconData>`.

``` dart
final Map<String, IconData> myIconCollection = {
  'favorite': Icons.favorite,
  'home': Icons.home,
  'android': Icons.android,
  'album': Icons.album,
  'ac_unit': Icons.ac_unit,
  ...
}
```

``` dart
IconPicker(
  initialValue: 'favorite',
  icon: Icon(Icons.apps),
  labelText: "Icon",
  title: "Select an icon",
  cancelBtn: "CANCEL",
  enableSearch: true,
  searchHint: 'Search icon',
  iconCollection: myIconCollection,
  onChanged: (val) => print(val),
  onSaved: (val) => print(val),
);
```

The result of val in `onChanged`, `validator` and `onSaved` will be a json String.\
So, if you tap the icon ac_unit in the dialog window, the result value will be:

``` dart
'{"iconName": "ac_unit", "codePoint": 60219, "fontFamily": "MaterialIcons"}'
```

Transforming the `String` result of `IconPicker` in an `IconData`:

``` dart
String value = '{"iconName": "ac_unit", "codePoint": 60219, "fontFamily": "MaterialIcons"}'
var iconDataJson = jsonDecode(value);
IconData icon = IconData(iconDataJson['codePoint'], fontFamily: iconDataJson['fontFamily']);
Icon(icon);
```

## Preview
![Overview](https://raw.githubusercontent.com/m3uzz/icon_picker/master/doc/images/icon_picker.gif)