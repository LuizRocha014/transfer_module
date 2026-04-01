import 'package:componentes_lr/componentes_lr.dart';
import 'package:transfer_module/config/database/transfer_database_config.dart';
import 'package:transfer_module/modules/data/datasource/local/module_version_local_datasource.dart';
import 'package:transfer_module/modules/data/datasource/remote/module_version_remote_datasource.dart';

void initDataSourceInstances() {
  instanceManager.registerLazySingleton<TransferDatabaseConfig>(
    () => const TransferDatabaseConfig(),
  );

  instanceManager.registerLazySingleton<IModuleVersionRemoteDataSource>(
    () => ModuleVersionRemoteDataSource(),
  );

  instanceManager.registerLazySingleton<IModuleVersionLocalDataSource>(
    () => ModuleVersionLocalDataSource(
      database: instanceManager.get<TransferDatabaseConfig>(),
    ),
  );
}
