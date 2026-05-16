import 'package:componentes_lr/componentes_lr.dart' show isDesktopFormFactor;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_module/presentation_export.dart';
import 'package:transfer_module/modules/presentation/controllers/transfer_home_controller.dart';

/// Placeholder do módulo de Transferências enquanto a presentation layer não
/// está implementada. Reaproveita o shell unificado (IwModulePage) e antecipa
/// o conteúdo previsto pelo design system: lista de movimentações entre filiais.
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
    final desktop = isDesktopFormFactor;
    return IwModulePage(
      onBack: () => Get.back(),
      breadcrumb: desktop
          ? const IwBreadcrumbData(
              icon: Icons.swap_horiz_outlined,
              label: 'Transferências',
              sub: 'Movimentações',
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!desktop) ...[
            const _MobileTitle(),
            const SizedBox(height: 12),
          ],
          _Header(desktop: desktop),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: IwColors.surface,
                borderRadius: BorderRadius.circular(IwRadius.lg),
                border: Border.all(color: IwColors.outlineVariant),
              ),
              padding: const EdgeInsets.all(32),
              child: const _ComingSoon(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileTitle extends StatelessWidget {
  const _MobileTitle();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Transferências',
          style: TextStyle(
            fontSize: 22,
            height: 28 / 22,
            fontWeight: FontWeight.w600,
            color: IwColors.onSurface,
            letterSpacing: -0.11,
          ),
        ),
        SizedBox(height: 2),
        Text(
          'Movimentações entre filiais.',
          style: TextStyle(
            fontSize: 13,
            color: IwColors.onSurfaceVariant,
            height: 18 / 13,
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.desktop});
  final bool desktop;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Expanded(
        child: TextField(
          decoration: const InputDecoration(
            hintText: 'Filtrar por filial, produto ou número…',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (_) {},
        ),
      ),
      FilledButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.add_circle_outline),
        label: const Text('Nova transferência'),
      ),
      OutlinedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.history, size: 18),
        label: const Text('Histórico'),
      ),
    ];
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: children,
    );
  }
}

class _ComingSoon extends StatelessWidget {
  const _ComingSoon();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: IwColors.tertiaryContainer,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.sync_alt,
                size: 38,
                color: IwColors.onTertiaryContainer,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Em construção',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: IwColors.onSurface,
                letterSpacing: -0.10,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'O fluxo de transferências entre filiais ainda não está disponível. Esta tela é um esboço visual e usará o mesmo padrão de listagem/sheets do módulo Estoque.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: IwColors.onSurfaceVariant,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 18),
            _FlagToOwner(),
          ],
        ),
      ),
    );
  }
}

class _FlagToOwner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: IwColors.warningContainer,
        borderRadius: BorderRadius.circular(IwRadius.md),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.flag_outlined, size: 18, color: IwColors.onWarningContainer),
          SizedBox(width: 8),
          Text(
            'Sinalizado para o design owner.',
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
              color: IwColors.onWarningContainer,
            ),
          ),
        ],
      ),
    );
  }
}
