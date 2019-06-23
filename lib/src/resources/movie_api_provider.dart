import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
	Client client = new Client();
	final _apiKey = '';

	Future<ItemModel> fetchMovieList() async {
		print("entered");
		var response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
		print(response.body.toString());
		if (response.statusCode == 200) {
			return ItemModel.fromJson(json.decode(response.body));
		} else {
			throw Exception('Failed to load post');
		}
	}
}