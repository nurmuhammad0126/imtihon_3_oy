class ReviewModel {
  final String id;
  final String userId;
  final String comment;
  final int rating;
  final DateTime time;

  ReviewModel({
    required this.id,
    required this.userId,
    required this.comment,
    required this.rating,
    required this.time,
  });

  factory ReviewModel.fromJson(
      {required Map<String, dynamic> json, required String id}) {
    return ReviewModel(
      id: id,
      userId: json['userId'] ?? '',
      comment: json['comment'] ?? '',
      rating: json['rating'] ?? 0,
      time: DateTime.tryParse(json['time'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'comment': comment,
      'rating': rating,
      'time': time.toIso8601String(),
    };
  }
}
