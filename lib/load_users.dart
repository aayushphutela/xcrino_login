import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'get_user_model.dart';

class LoadUsers extends StatefulWidget {
  const LoadUsers({super.key});

  @override
  State<LoadUsers> createState() => _LoadUsersState();
}

class _LoadUsersState extends State<LoadUsers> {
  GetUsers? usersData;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    EasyLoading.show(status: 'Please wait...');
    apiCall('https://reqres.in/api/users', context).then((value) {
      EasyLoading.dismiss();
      if (value != null) {
        usersData = value;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: usersData == null || usersData!.data.isEmpty
              ? Center(
                  child: Container(
                    child: Text('No Data'),
                  ),
                )
              : Container(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(usersData!.data[index].firstName),
                          leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(usersData!.data[index].avatar)),
                          subtitle: Text(usersData!.data[index].email),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 4,
                        );
                      },
                      itemCount: usersData!.data.length),
                ),
        ));
  }

  Future<GetUsers?> apiCall(String api, BuildContext ctx) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final response = await http.get(Uri.parse(api));
        print(response.statusCode);

        if (response.statusCode == 200) {
          GetUsers jsonResponse = getUsersFromJson(response.body);
          return jsonResponse;
        } else {
          ScaffoldMessenger.of(ctx)
              .showSnackBar(SnackBar(content: Text('No Data Received')));
          return null;
        }
      } on SocketException catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(ctx)
            .showSnackBar(SnackBar(content: Text('Connection Timed Out!')));
      } catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(ctx).showSnackBar(
            SnackBar(content: Text('Something went wrong. Try again later.')));
        return null;
      }
    } else {
      ScaffoldMessenger.of(ctx)
          .showSnackBar(SnackBar(content: Text('No Internet!')));
      return null;
    }
  }
}
