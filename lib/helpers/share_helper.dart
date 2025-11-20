import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hisn_almuslim/theme/app_colors.dart';
import 'package:hisn_almuslim/theme/app_text.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShareHelper {
  static final ScreenshotController screenshotController =
      ScreenshotController();

  static Future<void> shareAsImage(
    BuildContext context,
    String zekrText,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      builder: (_) =>
          Center(child: CircularProgressIndicator(color: AppColors.kIconColor)),
    );
    try {
      // Create a widget to capture
      final widget = _buildZekrCard(zekrText);

      // Capture widget as image bytes
      final Uint8List imageBytes = await screenshotController.captureFromWidget(
        Material(
          color: Colors.white,
          child: Transform.scale(scale: 1, child: widget),
        ),
        pixelRatio: 5, // Super High quality
      );

      // Save the image temporarily
      final tempDir = await getTemporaryDirectory();
      final file = await File('${tempDir.path}/zekr_share.png').create();
      await file.writeAsBytes(imageBytes);

      // Share the image
      // ignore: deprecated_member_use
      await Share.shareXFiles([XFile(file.path)]);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade700,
          content: AppText('حدث خطأ أثناء مشاركة الصورة', color: Colors.white),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    } finally {
      // if (Navigator.of(context, rootNavigator: true).canPop()) {
      //   Navigator.of(context, rootNavigator: true).pop();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }
}

Widget _buildZekrCard(String? title) {
  return Container(
    // height: 800,
    // width: 832,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.teal.shade900,
          Color(0xff00695c),
          Colors.tealAccent.shade700,
          Color(0xff00695c),
          Colors.teal.shade900,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 170),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   height: 80,
          //   width: 80,
          //   margin: EdgeInsets.all(4),
          //   padding: EdgeInsets.all(8),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(16),
          //     child: Image.asset(
          //       "assets/images/hisn almuslim.png",
          //       fit: BoxFit.cover,
          //       filterQuality: FilterQuality.high,
          //       isAntiAlias: true,
          //     ),
          //   ),
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              "assets/images/imageHisnShare.png",
              width: 70,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
            ),
          ),
          Gap(15),
          if (title != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    // fontFamily: GoogleFonts.scheherazadeNew().fontFamily,
                    // fontFamily: "Amiri Quran",
                    fontFamily: "Cairo",
                    height: 1.55,
                  ),
                ),
              ),
            ),
          // const Gap(40),
        ],
      ),
    ),
  );
}
