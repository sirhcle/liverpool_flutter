import 'package:flutter/material.dart';
import 'package:liverpool_test/config/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'package:liverpool_test/modules/product_list/presentation/screens/product_list.dart';
import 'package:liverpool_test/modules/product_list/providers/product_list_provider.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => ProductListProvider(),
      child: MaterialApp(
        title: 'Post list',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 6).theme(),
        home: const ProductList()
      )
    );
  }
}