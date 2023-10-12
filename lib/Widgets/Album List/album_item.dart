import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzik/Data%20Models/album_item_model.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlbumItem extends StatelessWidget {
  final AlbumItemModel model;
  const AlbumItem({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      child: Card(
        elevation: 4,
        child: SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment(0.95, 1.2),
                  children: <Widget>[
                    Image.network(
                      model.coverMedium,
                      fit: BoxFit.cover,
                    ),
                    CircleAvatar(
                      child: model.totalRating != -1
                          ? Text(
                              '${model.totalRating.toStringAsFixed(1)}',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          : Text(
                              '-',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      model.album,
                      style: Theme.of(context).textTheme.titleLarge,
                      softWrap: true,
                    ),
                    Text(
                      model.artist,
                      style: Theme.of(context).textTheme.titleMedium,
                      softWrap: true,
                    ),
                    Text(
                      '${model.releaseDate.substring(0, 4)}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlbumItem2 extends StatefulWidget {
  final AlbumItemModel album;

  AlbumItem2({this.album});

  @override
  _AlbumItem2State createState() => _AlbumItem2State();
}

class _AlbumItem2State extends State<AlbumItem2> {
  // bool isExpanded = false;
  bool hovered = false; // Define the initial value of hovered variable

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => widget.album.(widget.album.idKey),
      onHover: (value) {
        setState(() {
          hovered =
              value; // Update the hovered variable based on the hover state
        });
      },
      child: Card(
        elevation: 4,
        child: SizedBox(
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment(0.95, 1.2),
                  children: <Widget>[
                    Image.network(
                      widget.album.coverMedium,
                      fit: BoxFit.cover,
                    ),
                    CircleAvatar(
                      child: widget.album.totalRating != -1
                          ? Text(
                              '${widget.album.totalRating.toStringAsFixed(1)}',
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          : Text(
                              '-',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height:
                    hovered ? 120 : 0, // Change the height based on hover state
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.album.album,
                      style: Theme.of(context).textTheme.titleLarge,
                      softWrap: true,
                    ),
                    Text(
                      widget.album.artist,
                      style: Theme.of(context).textTheme.titleMedium,
                      softWrap: true,
                    ),
                    Text(
                      '${widget.album.releaseDate.substring(0, 4)}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
