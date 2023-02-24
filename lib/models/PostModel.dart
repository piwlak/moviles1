class POSTMODEL {
  int? idPost;
  String? descPost;
  String? datePost;

  POSTMODEL({this.idPost, this.descPost, this.datePost});

  factory POSTMODEL.fromMap(Map<String, dynamic> map) {
    return POSTMODEL(
        idPost: map['idPost'],
        descPost: map['descPost'],
        datePost: map['datePost']);
  }
}
