import 'package:internative_assignment/feature/main/blog/model/category_model.dart';
import 'package:internative_assignment/product/widget/toast_message.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/enums/dio_request_enum.dart';
import '../../../../product/manager/network/network_manager.dart';
import '../model/blog_model.dart';

part 'blog_view_model.g.dart';

class BlogViewModel = _BlogViewModel with _$BlogViewModel;

abstract class _BlogViewModel with Store {
  @observable
  List<Categories> categories = [];
  @observable
  List<Blog> blogs = [];
  @observable
  bool isServiceRequestLoading = true;

  @action
  Future<void> fetchCategories() async {
    dataChanged(value: true);
    final response =
        await NetworkManager.instance.dioRequest(path: 'Blog/GetCategories', method: DioRequestTypes.GET.name);
    final responseModel = CategoryModel.fromJson(response.data);

    categories = responseModel.categories ?? [];
    dataChanged(value: false);
  }

  @action
  Future<void> fetchBlogs(String categoryId) async {
    dataChanged(value: true);
    final response = await NetworkManager.instance.dioRequest(
        path: '/Blog/GetBlogs',
        method: DioRequestTypes.POST.name,
        queryJson: {"CategoryId": "620ceffecd70d74ab56d5b81"});
    final responseModel = BlogModel.fromJson(response.data);
    blogs = responseModel.blogs ?? [];
    dataChanged(value: false);
  }

  @action
  dataChanged({required bool value}) {
    isServiceRequestLoading = value;
  }

  @observable
  bool isFavorite = false;

  @action
  Future<void> toggleIsFavorite(String id, context) async {
    final response = await NetworkManager.instance
        .dioRequest(path: 'Blog/ToggleFavorite', method: DioRequestTypes.POST.name, queryJson: {"Id": id});
    if (response.statusCode == 200) {
      isFavorite = !isFavorite;
      CallMessage.callToastMessage(text: response.data['Message'], context: context);
    }
  }
}
