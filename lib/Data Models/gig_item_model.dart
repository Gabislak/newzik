class gigModel {
  final String artist;
  final String comment;
  final String date;
  final double rating;
  final String tourName;
  final String venue;

  gigModel(
      {this.artist,
      this.comment,
      this.date,
      this.rating,
      this.tourName,
      this.venue});

  factory gigModel.fromJson(Map<dynamic, dynamic> json) {
    return gigModel(
      artist: json['artist'] as String,
      comment: json['comment'] as String,
      date: json['date'] as String,
      rating: json['rating'] as double,
      tourName: json['tour_name'] as String,
      venue: json['venue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'artist': artist,
      'comment': comment,
      'date': date.toString(),
      'rating': rating,
      'tour_name': tourName,
      'venue': venue,
    };
  }
}
