// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counterprogress.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CounterProgress on _CounterProgress, Store {
  late final _$tasksAtom =
      Atom(name: '_CounterProgress.tasks', context: context);

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$testandoAtom =
      Atom(name: '_CounterProgress.testando', context: context);

  @override
  ObservableList<int> get testando {
    _$testandoAtom.reportRead();
    return super.testando;
  }

  @override
  set testando(ObservableList<int> value) {
    _$testandoAtom.reportWrite(value, super.testando, () {
      super.testando = value;
    });
  }

  late final _$_CounterProgressActionController =
      ActionController(name: '_CounterProgress', context: context);

  @override
  void addItem(Task data) {
    final _$actionInfo = _$_CounterProgressActionController.startAction(
        name: '_CounterProgress.addItem');
    try {
      return super.addItem(data);
    } finally {
      _$_CounterProgressActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(Task data) {
    final _$actionInfo = _$_CounterProgressActionController.startAction(
        name: '_CounterProgress.removeItem');
    try {
      return super.removeItem(data);
    } finally {
      _$_CounterProgressActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addtestando(int data) {
    final _$actionInfo = _$_CounterProgressActionController.startAction(
        name: '_CounterProgress.addtestando');
    try {
      return super.addtestando(data);
    } finally {
      _$_CounterProgressActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks},
testando: ${testando}
    ''';
  }
}
