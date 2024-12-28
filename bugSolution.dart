```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      //Improved error handling using the correct type and null checks
      final String? name = jsonData['name']?.toString();
      final int? age = jsonData['age'];

      if (name == null || age == null) {
          print('Error: Missing or Invalid data in JSON response.');
          return;
      }

      print('Name: $name, Age: $age');
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e'); // Consider more specific error handling and logging for production apps
  }
}
```