// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BlogViewModel on _BlogViewModel, Store {
  final _$categoriesAtom = Atom(name: '_BlogViewModel.categories');

  @override
  List<Categories> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(List<Categories> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$blogsAtom = Atom(name: '_BlogViewModel.blogs');

  @override
  List<Blog> get blogs {
    _$blogsAtom.reportRead();
    return super.blogs;
  }

  @override
  set blogs(List<Blog> value) {
    _$blogsAtom.reportWrite(value, super.blogs, () {
      super.blogs = value;
    });
  }

  final _$isServiceRequestLoadingAtom =
      Atom(name: '_BlogViewModel.isServiceRequestLoading');

  @override
  bool get isServiceRequestLoading {
    _$isServiceRequestLoadingAtom.reportRead();
    return super.isServiceRequestLoading;
  }

  @override
  set isServiceRequestLoading(bool value) {
    _$isServiceRequestLoadingAtom
        .reportWrite(value, super.isServiceRequestLoading, () {
      super.isServiceRequestLoading = value;
    });
  }

  final _$fetchCategoriesAsyncAction =
      AsyncAction('_BlogViewModel.fetchCategories');

  @override
  Future<void> fetchCategories(dynamic context) {
    return _$fetchCategoriesAsyncAction
        .run(() => super.fetchCategories(context));
  }

  final _$fetchBlogsAsyncAction = AsyncAction('_BlogViewModel.fetchBlogs');

  @override
  Future<void> fetchBlogs(String categoryId) {
    return _$fetchBlogsAsyncAction.run(() => super.fetchBlogs(categoryId));
  }

  final _$toggleIsFavoriteAsyncAction =
      AsyncAction('_BlogViewModel.toggleIsFavorite');

  @override
  Future<void> toggleIsFavorite(String id, dynamic context) {
    return _$toggleIsFavoriteAsyncAction
        .run(() => super.toggleIsFavorite(id, context));
  }

  final _$_BlogViewModelActionController =
      ActionController(name: '_BlogViewModel');

  @override
  dynamic dataChanged({required bool value}) {
    final _$actionInfo = _$_BlogViewModelActionController.startAction(
        name: '_BlogViewModel.dataChanged');
    try {
      return super.dataChanged(value: value);
    } finally {
      _$_BlogViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
blogs: ${blogs},
isServiceRequestLoading: ${isServiceRequestLoading}
    ''';
  }
}
