import 'package:flutter/material.dart';
import 'package:newzik/View/Album%20Details/album_details_desktop.dart';
import 'package:newzik/View/Album%20Details/album_details_mobile.dart';
import 'package:newzik/Widgets/Navigation%20Drawer/navigation_drawer.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AlbumDetails extends StatelessWidget {
  final int id;
  const AlbumDetails({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Album # ${id.toString()}'),
        ),
        drawer: MyDrawer(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: AlbumDetailsMobile(
                          id: id,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      tablet: Scaffold(
        drawer: MyDrawer(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MyDrawer(),
              ),
              Expanded(
                flex: 5,
                child: AlbumDetailsDesktop(
                  id: id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
