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

// TODO: When it's time to update the AlbumItem class with better genres
// 
// class AlbumItemModel {
//   String album;
//   int albumID;
//   String artist;
//   String coverBig;
//   String coverMedium;
//   int duration;
//   List<String> primaryGenre;
//   List<String> secondaryGenre;
//   int idKey;
//   int nbRatings;
//   int nbTracks;
//   String releaseDate;
//   double totalRating;

//   AlbumItemModel({
//     this.album,
//     this.albumID,
//     this.artist,
//     this.coverBig,
//     this.coverMedium,
//     this.duration,
//     this.primaryGenre,
//     this.secondaryGenre,
//     this.idKey,
//     this.nbRatings,
//     this.nbTracks,
//     this.releaseDate,
//     this.totalRating,
//   });

//   AlbumItemModel.fromJson(Map<String, dynamic> json) {
//     album = json['album'];
//     albumID = json['album_ID'];
//     artist = json['artist'];
//     coverBig = json['cover_big'];
//     coverMedium = json['cover_medium'];
//     duration = json['duration'];
//     primaryGenre = List<String>.from(json['primary_genre']);
//     secondaryGenre = List<String>.from(json['secondary_genre']);
//     idKey = json['id_key'];
//     nbRatings = json['nb_ratings'];
//     nbTracks = json['nb_tracks'];
//     releaseDate = json['releaseDate'];
//     totalRating = json['total_rating'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['album'] = this.album;
//     data['album_ID'] = this.albumID;
//     data['artist'] = this.artist;
//     data['cover_big'] = this.coverBig;
//     data['cover_medium'] = this.coverMedium;
//     data['duration'] = this.duration;
//     data['primary_genre'] = this.primaryGenre;
//     data['secondary_genre'] = this.secondaryGenre;
//     data['id_key'] = this.idKey;
//     data['nb_ratings'] = this.nbRatings;
//     data['nb_tracks'] = this.nbTracks;
//     data['releaseDate'] = this.releaseDate;
//     data['total_rating'] = this.totalRating;
//     return data;
//   }
// }

