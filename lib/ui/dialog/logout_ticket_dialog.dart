import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing_apps/core/components/button.dart';
import 'package:ticketing_apps/core/components/space.dart';
import 'package:ticketing_apps/core/contstans/colors.dart';
import 'package:ticketing_apps/core/data/localdatasources/auth_local_datasource.dart';
import 'package:ticketing_apps/core/extentions/build_context_ext.dart';
import 'package:ticketing_apps/ui/auth/splash_screen.dart';

class LogoutTicketDialog extends StatefulWidget {
  const LogoutTicketDialog({super.key});

  @override
  State<LogoutTicketDialog> createState() => _LogoutTicketDialogState();
}

class _LogoutTicketDialogState extends State<LogoutTicketDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Logout',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SpaceHeight(12),
          Text(
            'Apakah Anda ingin Logout',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.black.withOpacity(65 / 100),
            ),
            textAlign: TextAlign.center,
          ),
          SpaceHeight(12),
          Row(
            children: [
              Flexible(
                child: Button.filled(
                  onPressed: () => Navigator.pop(context),
                  label: 'Batalkan',
                  color: AppColors.buttonCancel,
                  height: 44,
                  fontSize: 14,
                  borderRadius: 8,
                  textColor: AppColors.grey,
                ),
              ),
              SpaceWidth(16),
              Flexible(
                child: Button.filled(
                  borderRadius: 8,
                  height: 44,
                  fontSize: 14,
                  onPressed: () async {
                    await AuthLocalDataSource().removeAuthData();
                    context.pushReplacement(SplashScreen());
                  },
                  label: 'Logout',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
