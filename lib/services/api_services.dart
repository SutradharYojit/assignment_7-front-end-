import 'dart:convert';
import 'dart:developer';
import 'package:assignment_7/services/status_code.dart';
import 'package:http/http.dart' as http;

// Class of the Api service , Define all the api functions Like GET, POST, PUT AND DELETE
class ApiServices {
  Future blogData() async {
    try {
      http.Response response = await http.get(Uri.parse("http://10.1.81.185:1337/api/blogs"));
      log(response.statusCode.toString());
      if (response.statusCode == ServerStatusCodes.success) {
        var jsonData = jsonDecode(response.body)['data'];
        for (Map<String, dynamic> i in jsonData) {
          //add all the data to blogData List
        }
        return blogData;
      }
    } catch (e) {
      log(e.toString());
    }
  }

//POST APi , Function to Send new Blog Data to the Database
  Future postApi({required String api, required Map<String, dynamic> data}) async {
    final response = await http.post(
      Uri.parse(api),
      body: data,
    );

    if (response.statusCode == ServerStatusCodes.addSuccess) {
      var jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      log('Failed to add Blog. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
    }
  }

//DELETE Api , Function to delete Blog With Specific ID
  Future<void> deleteBlog(int blogId) async {
    final response = await http.delete(
      Uri.parse("asdasdasdasd"),
    );
    if (response.statusCode == ServerStatusCodes.success) {
      log('Blog with ID $blogId has been deleted.');
    } else {
      log('Failed to delete Blog. Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
    }
  }

//PUT Api , Function to Update the existing Blog With Specific ID
  Future<void> editBlogData(Map<String, dynamic> blog, int blogId) async {
    final response = await http.put(
      Uri.parse("asdasdasdasdasd"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({"data": blog}),
    );

    if (response.statusCode == ServerStatusCodes.success) {
      log('Blog  with ID has been edited.');
    } else {
      log('Failed to edit Blog: Status code: ${response.statusCode}');
      log('Response body: ${response.body}');
    }
  }
}
