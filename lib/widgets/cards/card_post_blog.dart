import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/widgets/text_shadow.dart';

class CardPostBlog extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String image;
  final String url;
  const CardPostBlog(
      {Key? key,
      required this.title,
      this.subtitle,
      required this.image,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _footerPost(context);
  }

  Widget get _photoPost => ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      );

  Widget _footerPost(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.width * 0.80,
        child: GridTile(
          footer: Material(
            color: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(16.0)),
            ),
            clipBehavior: Clip.antiAlias,
            child: GridTileBar(
              backgroundColor: Colors.black54,
              title: _GridTitleText(
                title,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
              subtitle: subtitle != null
                  ? _GridTitleText(
                      subtitle!,
                      fontSize: 12.0,
                    )
                  : null,
            ),
          ),
          child: _photoPost,
        ),
      );
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text, {this.fontWeight, this.fontSize});

  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: TextShadow(
        text: text,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
