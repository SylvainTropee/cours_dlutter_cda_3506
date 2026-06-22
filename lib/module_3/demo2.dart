//POO
class IceCream {
  String taste;
  String type;
  double price;

  IceCream({required this.taste, required this.price, this.type = "Sorbet"});

  IceCream.fromJson(Map<String, dynamic> json)
    : taste = json['taste'],
      type = json['type'],
      price = json['price'];

  @override
  String toString() {
    return 'IceCream{taste: $taste, type: $type, price: $price}';
  }
}

void main() {
  // IceCream magnum = IceCream("Amande", "Esquimaux", 4.5);
  // print(magnum);

  IceCream misterFreeze = IceCream(price: 2.5, taste: "Fruits");
  print(misterFreeze);

  var json = {
    "taste" : "Chocolat",
    "type" : "Crème glacée",
    "price" : 45.23
  };

  IceCream cornetto = IceCream.fromJson(json);
  print(cornetto);

}
