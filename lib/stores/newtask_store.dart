import 'package:mobx/mobx.dart';

part 'newtask_store.g.dart';

class NewTaskStore = _NewTaskStore with _$NewTaskStore;

abstract class _NewTaskStore with Store {
  @observable
  String title = '';

  @observable
  String description = '';

  @action
  void settitle(String title) => title = title;

  @action
  void setdescription(String description) => description = description;

  @computed
  bool get titleisvalid => title != null;

  @computed
  bool get descriptionvalid => description != null;
  
  // @computed
  // Future<void> Function()? get allfieldsfilled =>
  //     (titleisvalid && descriptionvalid) ? confirmnewtask : null;

  @action
  Future<void> confirmnewtask() async {
    title = "";
    description = "";
  }
}