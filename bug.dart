```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Assuming JSON response
      final jsonData = jsonDecode(response.body);
      // Accessing data - potential error here if jsonData structure is unexpected
      final String name = jsonData['name']; //Error if 'name' is missing or not a String
      final int age = jsonData['age']; //Error if 'age' is missing or not an int
      print('Name: $name, Age: $age');
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    //Consider more specific exception handling
  }
}
```