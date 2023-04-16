import 'package:cached_network_image/cached_network_image.dart';
import 'package:favicon/favicon.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

class JobInfoMiniCard extends StatelessWidget {
  const JobInfoMiniCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 20.0,
            color: Color(0xffe0e0e0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<Favicon?>(
                future: FaviconFinder.getBest("http://www.google.it"),
                builder: (context, snapshot) => snapshot.hasData
                    ? CachedNetworkImage(
                        imageUrl: snapshot.data!.url,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(32.0)),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(32.0)),
                          color: Theme.of(context).primaryColor,
                          image: DecorationImage(
                            image: AssetImage("assets/images/company_2a.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome Azienda",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 12.0),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "In sede",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: K.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                LucideIcons.bookmarkMinus,
                size: 18.0,
              )
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            "UI/UX Design",
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
          ),
          Row(
            children: const [
              Icon(
                LucideIcons.mapPin,
                size: 12.0,
                color: K.secondaryColor,
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                "Milano",
                style: TextStyle(color: K.secondaryColor, fontSize: 12.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
