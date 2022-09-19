class CategoriesModel{
  bool? status;
  CategoriesDataModel? data;
  CategoriesModel.fromJson(Map<String , dynamic> json){
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);

  }
}

class CategoriesDataModel{
  int? currentPage;
  List<DataCatModel> dataModel=[];
  CategoriesDataModel.fromJson(Map<String , dynamic> json){
    currentPage = json['current_page'];
    json['data'].forEach((element){
      dataModel.add(DataCatModel.fromJson(element));
    });
  }
}

class DataCatModel{
  int? id;
  String? name;
  String? image;
  DataCatModel.fromJson(Map<String , dynamic> json){
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}