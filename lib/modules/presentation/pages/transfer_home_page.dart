import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_out_layout/in_out_layout.dart';
import 'package:transfer_module/modules/presentation/controllers/transfer_home_controller.dart';

class TransferHomePage extends StatefulWidget {
  const TransferHomePage({super.key});

  @override
  State<TransferHomePage> createState() => _TransferHomePageState();
}

class _TransferHomePageState extends State<TransferHomePage> {
  late final TransferHomeController controller =
      Get.put(TransferHomeController(), tag: 'transfer_home');

  @override
  void dispose() {
    Get.delete<TransferHomeController>(tag: 'transfer_home');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return AdaptiveModulePage(
      title: 'Transferências',
      onBack: () => Get.back(),
      body: Center(
        child: TextWidget(
          'transfer_module',
          textColor: scheme.onSurface,
          fontSize: isDesktopFormFactor ? 18 : 16,
        ),
      ),
    );
  }
}
