class Repos {

  String name;
  String description;

  Repos({
    this.name,
    this.description});

  factory Repos.fromJson(Map<String, dynamic> json){
    return Repos(
      name: json["html_url"],
      description: json["description"]
    );
  }

}