import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = [];

  categories.add(CategoryModel(
      categoryName: 'Business',
      imageUrl:
          'https://images.unsplash.com/photo-1491336477066-31156b5e4f35?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'));

  categories.add(CategoryModel(
      categoryName: 'Entertainment',
      imageUrl:
          'https://images.unsplash.com/photo-1567593810070-7a3d471af022?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80'));
  categories.add(CategoryModel(
      categoryName: 'General',
      imageUrl:
          'https://images.unsplash.com/photo-1494059980473-813e73ee784b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=749&q=80'));
  categories.add(CategoryModel(
      categoryName: 'Health',
      imageUrl:
          'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80'));
  categories.add(CategoryModel(
      categoryName: 'Science',
      imageUrl:
          'https://images.unsplash.com/photo-1603126857599-f6e157fa2fe6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'));
  categories.add(CategoryModel(
      categoryName: 'Sports',
      imageUrl:
          'https://images.unsplash.com/photo-1484482340112-e1e2682b4856?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80'));
  categories.add(CategoryModel(
      categoryName: 'Tech',
      imageUrl:
          'https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'));

  return categories;
}
