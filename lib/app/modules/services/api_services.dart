import 'dart:convert';

import 'package:computer_app_provider/app/modules/model/products.dart';
import 'package:http/http.dart' as http;
class ApiService {
  
  static  final url = "https://seangleangsim006-cmd.github.io/fake-json/";
  static Future<List<Product>> getProduct() async{
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
       List data = jsonDecode(response.body);
       return data.map((e)=>Product.fromJson(e)).toList();
    }
    else{
      return [];
    }
  }
}