class JobModel {
  final String id;
  final String name;
  final String category;
  final String companyName;
  final String companyLogo;
  final String location;
  final List about;
  final List qualifications;
  final List responsibilities;
  final int createdAt;
  final int updatedAt;

  JobModel(
      {this.id,
      this.name,
      this.category,
      this.companyName,
      this.companyLogo,
      this.location,
      this.about,
      this.qualifications,
      this.responsibilities,
      this.createdAt,
      this.updatedAt});

  JobModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        category = json['category'],
        companyName = json['companyName'],
        companyLogo = json['companyLogo'],
        location = json['location'],
        about = json['about'],
        qualifications = json['qualifications'],
        responsibilities = json['responsibilities'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'];

  Map<String, dynamic> toJson()=>{
    'id' : id,
    'name' : name,
    'category': category,
    'companyName':companyName,
    'companyLogo':companyLogo,
    'location':location,
    'about':about,
    'qualifications':qualifications,
    'responsibilities':responsibilities,
    'createdAt':createdAt,
    'updatedAt':updatedAt
  };
}
