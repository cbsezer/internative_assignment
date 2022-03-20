// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteViewModel on _FavoriteViewModel, Store {
  final _$favoritesAtom = Atom(name: '_FavoriteViewModel.favorites');

  @override
  List<Blog> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<Blog> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  final _$allFavoriteBlogsAsyncAction =
      AsyncAction('_FavoriteViewModel.allFavoriteBlogs');

  @override
  Future<void> allFavoriteBlogs(
      BlogViewModel blogViewModel, BuildContext context) {
    return _$allFavoriteBlogsAsyncAction
        .run(() => super.allFavoriteBlogs(blogViewModel, context));
  }

  @override
  String toString() {
    return '''
favorites: ${favorites}
    ''';
  }
}
