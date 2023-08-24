import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({
    super.key,
    required this.applyUrl,
    required this.isSponsored,
  });

  final String applyUrl;
  final bool isSponsored;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (!await launchUrl(Uri.parse(applyUrl))) {
          throw Exception('Could not launch url.');
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.open_in_new_outlined),
          const SizedBox(width: 10,),
          Text(isSponsored ?'Hemen Başvur!' :  'Başvur'),
        ],
      ),
    );
  }
}