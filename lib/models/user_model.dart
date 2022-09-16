class SocialUserModel{
  String? name;
  String? email;
  String? phone;
  String? uid;

  SocialUserModel({
    this.name,
    this.email,
    this.phone,
    this.uid,
});
  SocialUserModel.fromJson(Map<String,dynamic> json){
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uid = json['uid'];
  }

  Map<String,dynamic> toMap()
  {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid' : uid,

    };
  }

}