import 'package:blankscreen/bloc/app/event/base/app_base_event.dart';
import 'package:blankscreen/repository/local/database.dart';

class SaveMainUrlEvent extends AppBaseEvent {
  const SaveMainUrlEvent({
    required super.state,
    required this.database,
  });

  final Database database;
}
