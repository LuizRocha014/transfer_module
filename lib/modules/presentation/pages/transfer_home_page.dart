import 'package:componentes_lr/componentes_lr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          'Transferências',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: scheme.primaryContainer,
        foregroundColor: scheme.onPrimaryContainer,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: TextWidget(
          'transfer_module',
          textColor: scheme.onSurface,
          fontSize: 16,
        ),
      ),
    );
  }
}
