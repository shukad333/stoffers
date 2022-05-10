
class Store {

  final String storeId;
  final String type;
  final String name;

  Store({required this.storeId,required this.type,required this.name});


  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      storeId: json['id'],
      type: json['type'],
      name: json['name'],
    );
  }



}