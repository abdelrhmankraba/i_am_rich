class ShopLoginModel {
  bool? status;
  String? message;
  UserDate? data;

  ShopLoginModel.formJason(Map<String , dynamic> jason)
  {
    status = jason['status'];
    message = jason['message'];
    data = jason['data'] !=null ? UserDate.formJason(jason['data']) : null;
  }
}

class UserDate {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  UserDate.formJason(Map<String , dynamic> jason)
  {
    id = jason['id'];
    email = jason['email'];
    phone = jason['phone'];
    image = jason['image'];
    points = jason['points'];
    credit = jason['credit'];
    token = jason['token'];
    name = jason['name'];
  }

}