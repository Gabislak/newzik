import 'package:flutter/material.dart';
import 'package:newzik/View%20Models/album_detail_view_model.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:stacked/stacked.dart';

class AlbumDetailsDesktop extends StatelessWidget {
  final int id;
  const AlbumDetailsDesktop({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumDetailsViewModel>.reactive(
      viewModelBuilder: () => AlbumDetailsViewModel(),
      onModelReady: (model) => model.getOneAlbum(id),
      builder: (context, model, child) => Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1,
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: model.album == null
            ? CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          elevation: 20,
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            model.album.coverBig,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          model.album.album,
                          style: Theme.of(context).textTheme.headline5,
                          softWrap: true,
                        ),
                        Text(
                          'by ${model.album.artist}',
                          style: Theme.of(context).textTheme.subtitle1,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   width: 20,
                  // ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Wrap(
                          //direction: Axis.vertical,
                          //runSpacing: 2,
                          //spacing: 2,
                          children: [
                            AlbumElementCard(
                              header: 'NOTE',
                              content:
                                  '${model.album.totalRating.toStringAsFixed(1)}',
                              subtitle: '/ 10',
                            ),
                            AlbumElementCard(
                              header: 'NOTÉ PAR',
                              content:
                                  '${model.album.nbRatings.toStringAsFixed(0)}',
                              subtitle: '/ 5',
                            ),
                            AlbumElementCard(
                                header: 'SORTIT EN',
                                content:
                                    '${model.album.releaseDate.substring(0, 4)}'),
                            AlbumElementCard(
                              header: 'DURÉE',
                              content:
                                  '${(model.album.duration / 60).roundToDouble()}',
                              subtitle: 'minutes',
                            ),
                            AlbumElementCard(
                                header: 'GENRE',
                                content: '${model.album.genre}'),
                            AlbumElementCard(
                                header: 'NB DE MORCEAUX',
                                content: '${model.album.nbTracks}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class AlbumElementCard extends StatelessWidget {
  final String header;
  final String content;
  final String subtitle;
  AlbumElementCard({this.header, this.content, this.subtitle});

  @override
  Widget build(BuildContext context) {
    Color _cardColor = surfaceColor;
    Color _textBodyColor = highEmphasisTextOnSurface;
    Color _textSubColor = mediumEmphasisTextOnSurface;
    if (content == '-1.0') {
      _cardColor = errorColor;
      _textBodyColor = Colors.black;
      _textSubColor = Colors.black;
    } else if (content == '0') {
      _cardColor = errorColor;
      _textBodyColor = Colors.black;
      _textSubColor = Colors.black;
    } else {}
    return Container(
      width: 260,
      //height: 50,
      child: Card(
        color: _cardColor,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                header,
                style: Theme.of(context)
                    .textTheme
                    .overline
                    .apply(color: _textSubColor),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  content != '-1.0'
                      ? Text(
                          content,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .apply(color: _textBodyColor),
                        )
                      : Text(
                          '-',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .apply(color: _textBodyColor),
                        ),
                  SizedBox(
                    width: 8,
                  ),
                  subtitle != null
                      ? Text(
                          subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .apply(color: _textSubColor),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
