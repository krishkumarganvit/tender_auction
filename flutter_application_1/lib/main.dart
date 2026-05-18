import'package:http/http.dart' as http;
void main()async {
 
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  // Correct HTTP request
  var response = await http.get(url);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  // runApp(
  //   MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         backgroundColor: const Color.fromARGB(255, 162, 75, 255),
  //         foregroundColor: Colors.white,
  //         title: Center(child: Text("Profile")),
  //       ),
  //       body: Center(child: MyWidget()),
  //     ),
  //   ),
  // );
}
