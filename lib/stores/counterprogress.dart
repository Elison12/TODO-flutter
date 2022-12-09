import 'package:mobx/mobx.dart';
import '../models/task.dart';

part 'counterprogress.g.dart';

class CounterProgress = _CounterProgress with _$CounterProgress;

abstract class _CounterProgress with Store {
  
  @observable
  var tasks = ObservableList<Task>();

  @observable
  var testando = ObservableList<int>();

  @action
  void addItem(Task data) => tasks.add(data);

  @action
  void removeItem(Task data) => tasks.remove(data);
  
  @action
  void addtestando(int data) => testando.add(data);
}