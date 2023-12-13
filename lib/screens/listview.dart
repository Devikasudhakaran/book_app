import 'package:flutter/material.dart';
import 'package:user_list/components/cards.dart';
import 'package:user_list/provider/api_provider.dart';

import '../model_class/listview_response.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UsersList>? details;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    List<UsersList>? fetchedDetails = await Service().getList();

    if (fetchedDetails == null) {
      setState(() {
        isLoaded = false;
      });
    } else {
      setState(() {
        isLoaded = true;
        details = fetchedDetails;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFEEFEC),
        appBar: AppBar(
          title: Text('List')
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
            itemCount: details?.length,
            itemBuilder: (context, index) => Data(details![index])
          ),
          replacement: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
