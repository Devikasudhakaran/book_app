import 'package:flutter/material.dart';

import 'package:user_list/provider/detail_api_provider.dart';

import '../model_class/detaild_response.dart';


class DetailView extends StatefulWidget {

   // final DetailedView detailedView;
  final int data;

  DetailView({super.key, required this.data});
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  // Map<String, dynamic> detailedView = Map<String, dynamic>();
  bool isLoaded = false;

  // int data = data;
  @override
  void initState() {
    super.initState();
    getDetail();
  }

  Future<void> getDetail() async {
    Map<String, dynamic>? fetchedDetails = await Service2().getDetails(widget.data);

    if (fetchedDetails == null) {
      setState(() {
        isLoaded = false;
      });
    } else {
      setState(() {
        isLoaded = true;
        // detailedView = fetchedDetails;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/book.png',
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(height: 20), // Adding some space between image and text
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Id: ${fetchedDetails[0].userId}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ${detailedView.id}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${detailedView.title}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description: ${detailedView.body}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        replacement: Center(child: CircularProgressIndicator()),
      ),
    );
  }

}
