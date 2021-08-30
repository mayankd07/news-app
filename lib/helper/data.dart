import 'package:news_app/models/category_model.dart';
import 'package:flutter/material.dart';

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
      categoryName: 'Technology',
      imageUrl:
          'https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'));

  return categories;
}

Icon getIcon(String category) {
  switch (category) {
    case 'business':
      return Icon(
        Icons.business_center_outlined,
        color: Colors.red,
      );

    case 'entertainment':
      return Icon(
        Icons.ondemand_video_outlined,
        color: Colors.red,
      );

    case 'general':
      return Icon(
        Icons.extension_outlined,
        color: Colors.red,
      );
    case 'health':
      return Icon(
        Icons.local_hospital_outlined,
        color: Colors.red,
      );
    case 'science':
      return Icon(
        Icons.all_inclusive_outlined,
        color: Colors.red,
      );
    case 'sports':
      return Icon(
        Icons.directions_run_outlined,
        color: Colors.red,
      );
    case 'technology':
      return Icon(
        Icons.important_devices_outlined,
        color: Colors.red,
      );
    default:
      return Icon(
        Icons.list,
        color: Colors.red,
      );
  }
}

List<Map<String, String>> countries = [
  {
    "name": "America",
    "code": "us",
  },
  {
    "name": "Brazil",
    "code": "br",
  },
  {
    "name": "China",
    "code": "cn",
  },
  {
    "name": "England",
    "code": "gb",
  },
  {
    "name": "France",
    "code": "fr",
  },
  {
    "name": "Hong Kong",
    "code": "hk",
  },
  {
    "name": "India",
    "code": "in",
  },
  {
    "name": "Indonesia",
    "code": "id",
  },
  {
    "name": "Israel",
    "code": "il",
  },
  {
    "name": "Italy",
    "code": "it",
  },
  {
    "name": "Japan",
    "code": "jp",
  },
  {
    "name": "Mexico",
    "code": "mx",
  },
  {
    "name": "New Zealand",
    "code": "nz",
  },
  {
    "name": "Russia",
    "code": "ru",
  },
  {
    "name": "Saudi Arabia",
    "code": "sa",
  },
  {
    "name": "Singapore",
    "code": "sg",
  },
  {
    "name": "South Africa",
    "code": "za",
  },
  {
    "name": "Switzerland",
    "code": "ch",
  },
  {
    "name": "Turkey",
    "code": "tr",
  },
  {
    "name": "Thailand",
    "code": "th",
  },
  {
    "name": "UAE",
    "code": "ae",
  },
];
