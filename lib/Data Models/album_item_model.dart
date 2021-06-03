class AlbumItemModel {
  String album;
  int albumID;
  String artist;
  String coverBig;
  String coverMedium;
  int duration;
  String genre;
  int idKey;
  int nbRatings;
  int nbTracks;
  String releaseDate;
  double totalRating;

  AlbumItemModel(
      {this.album,
      this.albumID,
      this.artist,
      this.coverBig,
      this.coverMedium,
      this.duration,
      this.genre,
      this.idKey,
      this.nbRatings,
      this.nbTracks,
      this.releaseDate,
      this.totalRating});

  AlbumItemModel.fromJson(Map<String, dynamic> json) {
    album = json['album'];
    albumID = json['album_ID'];
    artist = json['artist'];
    coverBig = json['cover_big'];
    coverMedium = json['cover_medium'];
    duration = json['duration'];
    genre = json['genre'];
    idKey = json['id_key'];
    nbRatings = json['nb_ratings'];
    nbTracks = json['nb_tracks'];
    releaseDate = json['releaseDate'];
    totalRating = json['total_rating'];
  }
}
