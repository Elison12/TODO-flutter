import 'package:mobx/mobx.dart';

part 'newtask_store.g.dart';

class NewTaskStore = _NewTaskStore with _$NewTaskStore;

abstract class _NewTaskStore with Store {
  @observable
  String title = '';

  @observable
  String description = '';
}