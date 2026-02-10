import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticketing_apps/core/assets/asset.gen.dart';
import 'package:ticketing_apps/core/components/space.dart';
import 'package:ticketing_apps/core/contstans/colors.dart';
import 'package:ticketing_apps/ui/dialog/logout_ticket_dialog.dart';
import 'package:ticketing_apps/ui/dialog/sync_data_dialog.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setting Page')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 24,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    color: AppColors.black.withOpacity(5 / 100),
                    blurRadius: 30,
                    spreadRadius: 0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icons.settings.printer.path),
                  SpaceHeight(10),
                  Text(
                    'Text Printer',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Pengaturan Printer',
                    style: TextStyle(color: AppColors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (context) => LogoutTicketDialog(),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: AppColors.black.withOpacity(5 / 100),
                      blurRadius: 30,
                      spreadRadius: 0,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.icons.settings.logout.path),
                    SpaceHeight(10),
                    Text(
                      'Logout',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Keluar dari Aplikasi',
                      style: TextStyle(color: AppColors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return SyncDataDialog();
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      color: AppColors.black.withOpacity(5 / 100),
                      blurRadius: 30,
                      spreadRadius: 0,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.icons.settings.syncData.path),
                    SpaceHeight(10),
                    Text(
                      'Sync Data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Sinkronisasi Onilen',
                      style: TextStyle(color: AppColors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
