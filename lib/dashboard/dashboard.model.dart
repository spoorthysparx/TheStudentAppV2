class DashboardModel {
  final List<GenericModel> jobs;
  final List<GenericModel> studentOpportunities;
  final List<GenericModel> currentAffairs;
  final List<GenericModel> trainingOpportunities;

  const DashboardModel({
    required this.jobs,
    required this.studentOpportunities,
    required this.currentAffairs,
    required this.trainingOpportunities,
  });
}

class GenericModel {
  final String title;
  final String description;
  final String imageUrl;
  final String type;
  //final String createdDts;

  const GenericModel(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.type
      //required this.createdDts
      });

  factory GenericModel.fromJson(Map<String, dynamic> json) {
    return GenericModel(
      title: json["title"],
      description: json["description"],
      imageUrl: json["imageUrl"],
      type: json["type"]
      //createdDts: json["createdDts"],
    );
  }
}
