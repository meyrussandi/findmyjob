class CategoryModel{
  final String id;
  final String name;
  final String imageUrl;
  final int createdAt;
  final int updateAt;

  CategoryModel({this.id, this.name, this.imageUrl, this.createdAt, this.updateAt});

  CategoryModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    imageUrl = json['imageUrl'],
    createdAt = json['createdAt'],
    updateAt = json['updatedAt'];

  Map<String, dynamic> toJson()=>{
    'id' : id,
    'name' : name,
    'imageUrl' : imageUrl,
    'createdAt' : createdAt,
    'updatedAt' : updateAt
  };
}