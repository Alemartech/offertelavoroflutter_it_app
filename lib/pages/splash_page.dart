import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/widgets/text_shadow.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: _buildBodySplashPage(context),
        ),
      ),
    );
  }

  Widget _buildBodySplashPage(BuildContext context) => Container(
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              K.primaryColor,
              K.secondaryColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 96.0, 0.0, 48.0),
              child: Image.asset(
                "assets/images/job_offers_welcome.png",
              ),
            ),
            const TextShadow(
              text: "Offertelavoroflutter.it",
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: K.accentCOlor,
            ),
            const SizedBox(
              height: 24.0,
            ),
            _richTextWidget(),
            const SizedBox(
              height: 48.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Esplora ora",
                  style: TextStyle(
                      color: K.accentCOlor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                ),
              ),
            ),
            _checkBoxWidget(),
          ],
        ),
      );

  Widget _richTextWidget() => RichText(
        text: TextSpan(
          text: "Bacheca di annunci di lavoro per ",
          style: _getTextSpanStyle(),
          children: [
            TextSpan(
                text: "assunzioni",
                style: _getTextSpanStyle(isAccentColor: true)),
            TextSpan(text: " e ", style: _getTextSpanStyle()),
            TextSpan(
                text: "progetti freelance",
                style: _getTextSpanStyle(isAccentColor: true)),
          ],
        ),
      );

  Widget _checkBoxWidget() => Row(
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (value) => setState(() {
              _isChecked = value!;
            }),
          ),
          TextShadow(
            text: "Nascondi questa schermata all'avvio",
            color: _isChecked ? K.accentCOlor : Colors.white,
            fontWeight: _isChecked ? FontWeight.w500 : null,
          )
        ],
      );

  Shadow _getRichTextStyle() => const Shadow(
        offset: Offset(0, 1),
        blurRadius: 5.0,
        color: Color.fromARGB(150, 0, 0, 0),
      );

  TextStyle _getTextSpanStyle({bool isAccentColor = false}) => TextStyle(
        fontSize: 28.0,
        color: isAccentColor ? K.accentCOlor : Colors.white,
        fontWeight: FontWeight.w600,
        shadows: [_getRichTextStyle()],
      );
}
