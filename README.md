# transfer_module

Pacote Flutter de **transferências** (movimentação entre locais, expedição, etc.) no InOutWareApp. Estrutura alinhada aos módulos `sale_module` e `stock_module`, com DI centralizada em **`componentes_lr`**.

## Dependências

- **`componentes_lr`**: `path: ../../../Flutter_X_Components_Flutter`.
- **`get`**: controllers e telas do módulo.
- **`in_out_layout`**: layout desktop vs mobile (`AdaptiveModulePage`).

## Estrutura

```
lib/
  config/
    database/          # TransferDatabaseConfig (placeholder)
    di/                # initTransferInstances
  modules/
    domain/
    data/
    presentation/      # TransferHomePage, TransferHomeController
  transfer_module.dart
  presentation_export.dart
  tables_export.dart
```

## Inicialização (DI)

No app host:

```dart
import 'package:transfer_module/config/di/init_instances.dart';

initTransferInstances();
```

## Uso no app

```yaml
dependencies:
  transfer_module:
    path: ../packages/transfer_module
```

Tela inicial: `TransferHomePage` (`presentation_export.dart`).

## Banco de dados

Persistência e tabelas ainda não configuradas; a camada de dados segue o esqueleto `module_version` apenas como referência estrutural.

## Desenvolvimento

```bash
cd packages/transfer_module
flutter pub get
dart analyze
flutter test
```
