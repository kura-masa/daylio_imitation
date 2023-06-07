//object オブジェクト指向のこと
class Users {
  final String? uid;

  Users({this.uid});
}

class UserData {
  final String? uid;
  final int? index;
  final String? name;
  final String? sugars;
  final int? strength;
  final String? text;
  final String? textOption;

  UserData({
    this.index,
    this.uid,
    this.name,
    this.sugars,
    this.strength,
    this.text,
    this.textOption,
  });
}
