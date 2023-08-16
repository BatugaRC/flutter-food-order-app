class Restaurant {
  final String name;
  final String? email;
  final String? address;
  final String? description;
  final List<dynamic>? foods;
  final bool? public;

  Restaurant({required this.public,required this.description,required this.name, required this.email, required this.address, required this.foods});

}