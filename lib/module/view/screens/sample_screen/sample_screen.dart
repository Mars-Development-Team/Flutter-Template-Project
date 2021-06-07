import 'package:flutter/material.dart';
import 'package:flutter_template_project/module/model/apis/api_response.dart';
import 'package:flutter_template_project/module/model/sample.dart';
import 'package:flutter_template_project/module/view_model/sample_view_model.dart';
import 'package:flutter_template_project/utils/size_config.dart';
import 'package:provider/provider.dart';

class SampleScreen extends StatefulWidget {
  @override
  _SampleScreenState createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  void fetchData() {
    context.read<SampleViewModel>().fetchMediaData();
  }

  Widget getDataWidget(BuildContext context, ApiResponse apiResponse) {
    var mediaList = apiResponse.data as List<Sample>?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        if (mediaList != null && mediaList.first.title != null) {
          return Center(
            child: Text('Response Title is\n${mediaList.first.title!}'),
          );
        } else {
          return Center(
            child: Text('No Data !'),
          );
        }
      case Status.ERROR:
        return Center(
          child: Text('Please try again latter!!!'),
        );
      case Status.INITIAL:
      default:
        return Center(
          child: ElevatedButton(
            onPressed: () {
              fetchData();
            },
            child: Text('Get Data'),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final apiResponse = context.watch<SampleViewModel>().response;
    MySize().init(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: getDataWidget(context, apiResponse)),
        ],
      ),
    );
  }
}
