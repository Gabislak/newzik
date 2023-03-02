import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newzik/View%20Models/gig_list_view_model.dart';
import 'package:newzik/Widgets/Navigation%20Drawer/navigation_drawer.dart';
import 'package:newzik/constants/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'gigs_view_desktop.dart';
import 'gigs_view_mobile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GigsView extends StatelessWidget {
  const GigsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return ScreenTypeLayout(
      mobile: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).gigs_Title),
        ),
        backgroundColor: backgroundColor,
        floatingActionButton: user == null
            ? null // hide button if user is not authenticated
            : FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            AddGigPanel(gigList: Provider.of<GigList>(context)),
                      ),
                    ),
                  );
                },
              ),
        drawer: NavigationDrawer(),
        // endDrawer: AddGigPanel(),
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
                        child: GigsViewMobile(),
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
        backgroundColor: backgroundColor,
        drawer: NavigationDrawer(),
        // endDrawer: AddGigPanel(),
        floatingActionButton: user == null
            ? null // hide button if user is not authenticated
            : FloatingActionButton(
                backgroundColor: secondaryColor,
                foregroundColor: Colors.black,
                child: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            AddGigPanel(gigList: Provider.of<GigList>(context)),
                      ),
                    ),
                  );
                },
              ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: NavigationDrawer(),
              ),
              Expanded(
                flex: 5,
                child: GigsViewDesktop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
