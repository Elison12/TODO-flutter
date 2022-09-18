// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newtask_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewTaskStore on _NewTaskStore, Store {
  Computed<bool>? _$titleisvalidComputed;

  @override
  bool get titleisvalid =>
      (_$titleisvalidComputed ??= Computed<bool>(() => super.titleisvalid,
              name: '_NewTaskStore.titleisvalid'))
          .value;
  Computed<bool>? _$descriptionvalidComputed;

  @override
  bool get descriptionvalid => (_$descriptionvalidComputed ??= Computed<bool>(
          () => super.descriptionvalid,
          name: '_NewTaskStore.descriptionvalid'))
      .value;

  late final _$titleAtom = Atom(name: '_NewTaskStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_NewTaskStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$confirmnewtaskAsyncAction =
      AsyncAction('_NewTaskStore.confirmnewtask', context: context);

  @override
  Future<void> confirmnewtask() {
    return _$confirmnewtaskAsyncAction.run(() => super.confirmnewtask());
  }

  late final _$_NewTaskStoreActionController =
      ActionController(name: '_NewTaskStore', context: context);

  @override
  void settitle(String title) {
    final _$actionInfo = _$_NewTaskStoreActionController.startAction(
        name: '_NewTaskStore.settitle');
    try {
      return super.settitle(title);
    } finally {
      _$_NewTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setdescription(String description) {
    final _$actionInfo = _$_NewTaskStoreActionController.startAction(
        name: '_NewTaskStore.setdescription');
    try {
      return super.setdescription(description);
    } finally {
      _$_NewTaskStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
titleisvalid: ${titleisvalid},
descriptionvalid: ${descriptionvalid}
    ''';
  }
}
