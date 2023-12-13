import 'package:flutter/material.dart';
import 'package:user_list/model_class/detaild_response.dart';
import 'package:user_list/model_class/listview_response.dart';

import '../screens/detailedview.dart';

class Data extends StatefulWidget {
  final UsersList details;

  Data(this.details);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  // Future<int> fetchDetailedView(int userId) async {
// Implement your logic to fetch detailed view data, for example using an API call
    // Replace the following line with your actual implementation
    // print("UserId===========================$userId");
    // DetailedView detailedView = DetailedView();
    // // Return the fetched detailed view
    // return detailedView;
  // }



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: InkWell(
        onTap: () async {
          // Fetch detailed view for the selected user
          // DetailedView detailedView = await fetchDetailedView(widget.details.id!);

          // Navigate to DetailView with the fetched details
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailView( data: widget.details.id! ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add an Image widget here
              Image.asset(
                'assets/images/book.png',
                width: 50,
                height: 50,
              ),
              SizedBox(width: 10), // Adjust the spacing between image and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Id: ${widget.details.id}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Title: ${widget.details.title}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}