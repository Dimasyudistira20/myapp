import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/kategori_models.dart';

class KategoriService {
  final String _baseUrl = 'https://movieapi.smkassalaambandung.sch.id/api';

  Future<Kategori?> fetchKategori() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/kategori'));

      if (response.statusCode == 200) {
        return Kategori.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load kategori');
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<bool> storeKategori(String namaKategori) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/kategori'),
      body: {'nama_kategori': namaKategori},
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}