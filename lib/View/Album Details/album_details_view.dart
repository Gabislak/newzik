import 'package:flutter/material.dart';
import 'package:newzik/View/Album%20Details/album_details_desktop.dart';
import 'package:newzik/View/Album%20Details/album_details_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AlbumDetails extends StatelessWidget {
  final int id;
  const AlbumDetails({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AlbumDetailsMobile(
        id: id,
      ),
      tablet: AlbumDetailsDesktop(
        id: id,
      ),
    );
  }
}
