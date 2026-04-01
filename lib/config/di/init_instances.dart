import 'package:transfer_module/config/di/datasources.dart';
import 'package:transfer_module/config/di/repositories.dart';
import 'package:transfer_module/config/di/store.dart';
import 'package:transfer_module/config/di/usecases.dart';

void initTransferInstances() {
  initDataSourceInstances();
  initRepositoryInstances();
  initUseCasesInstances();
  initStoreInstances();
}
