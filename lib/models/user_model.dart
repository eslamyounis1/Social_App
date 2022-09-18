class SocialUserModel{
  String? name;
  String? email;
  String? phone;
  String? uid;
  bool? isEmailVerified;
  SocialUserModel({
    this.name,
    this.email,
    this.phone,
    this.uid,
    this.isEmailVerified,
});
  SocialUserModel.fromJson(Map<String,dynamic> json){
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uid = json['uid'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid' : uid,
      'isEmailVerified' : isEmailVerified,

    };
  }

}