```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        // Process the jsonData
        print(jsonData);
      } on FormatException catch (e) {
        print('Error: Invalid JSON format - $e');
        // Handle the FormatException appropriately, e.g., retry or display an error message.
      }
    } else {
      // Handle error status codes
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle other exceptions
    print('Error: $e');
    rethrow;
  }
}
```