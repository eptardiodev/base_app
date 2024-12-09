import 'package:base_app/data/local/app_database.dart';
import 'package:base_app/data/local/db_constants.dart';
import 'package:base_app/domain/common/i_common_dao.dart';

class CommonDao implements ICommonDao {
  final AppDatabase _appDatabase;

  CommonDao(this._appDatabase);

  @override
  Future<bool> cleanDB() async {
    try {
      await _appDatabase.deleteAll(DBConstants.profileTable);
      await _appDatabase.deleteAll(DBConstants.authenticatedEntityTable);
      // await _appDatabase.deleteAll(DBConstants.customersTable);
      // await _appDatabase.deleteAll(DBConstants.createdByTable);
      // await _appDatabase.deleteAll(DBConstants.closedTable);
      // await _appDatabase.deleteAll(DBConstants.assignedToTable);
      // await _appDatabase.deleteAll(DBConstants.assignedByTable);
      // await _appDatabase.deleteAll(DBConstants.todoHistoryTable);
      // await _appDatabase.deleteAll(DBConstants.addressTable);
      //await _appDatabase.deleteAll(DBConstants.projectTable);
      //await _appDatabase.deleteAll(DBConstants.lastSelectedProjectToDoTable);
      // await _appDatabase.deleteAll(DBConstants.projectGroupTable);
      // await _appDatabase.deleteAll(DBConstants.notebookTable);
      // await _appDatabase.deleteAll(DBConstants.noteTable);
      // await _appDatabase.deleteAll(DBConstants.noteByProjectTable);
      // await _appDatabase.deleteAll(DBConstants.noteSharedTable);
      // await _appDatabase.deleteAll(DBConstants.userTable);
      // await _appDatabase.deleteAll(DBConstants.userByProjectTable);
      // await _appDatabase.deleteAll(DBConstants.userByCustomerTable);
      // await _appDatabase.deleteAll(DBConstants.commentTable);
      // await _appDatabase.deleteAll(DBConstants.documentEmsTable);
      // await _appDatabase.deleteAll(DBConstants.documentDrawingsTable);
      //await _appDatabase.deleteAll(DBConstants.documentTable);
      // await _appDatabase.deleteAll(DBConstants.documentTodoTable);
      // await _appDatabase.deleteAll(DBConstants.nodeTable);
      // await _appDatabase.deleteAll(DBConstants.nodeArchivedTable);
      //await _appDatabase.deleteAll(DBConstants.emsNodeTable);
      // await _appDatabase.deleteAll(DBConstants.qcSheetTable);
      // await _appDatabase.deleteAll(DBConstants.qcSheetUnifiedFormTable);
      // await _appDatabase.deleteAll(DBConstants.nodeSystemSubTypeTable);
      // await _appDatabase.deleteAll(DBConstants.nodeIfcPropertiesTable);
      // await _appDatabase.deleteAll(DBConstants.nodeManualStatusTable);
      // await _appDatabase.deleteAll(DBConstants.nodeScheduleTable);
      // await _appDatabase.deleteAll(DBConstants.nodeScheduleStatusTable);
      // await _appDatabase.deleteAll(DBConstants.nodeTodosTable);
      // await _appDatabase.deleteAll(DBConstants.offlineTable);

      ///Add here all lines for complete data remove by each table...
      return true;
    } catch (ex) {
      return false;
    }
  }
}
