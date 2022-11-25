import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginscreen/Firebase/Firebase.dart';
import 'package:loginscreen/Screen/Controller/HomeController.dart';
import 'package:loginscreen/Screen/Model/homeModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  homeController Controller = Get.put(homeController());

  TextEditingController txtId = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtStd = TextEditingController();

  List<ModelData> dataList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                logout();
                Get.offNamed('login');
              },
              icon: Icon(Icons.logout))
        ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtId,
                decoration: InputDecoration(hintText: 'id'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtName,
                decoration: InputDecoration(hintText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: txtStd,
                decoration: InputDecoration(hintText: 'Std'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  inserData(txtId.text, txtName.text, txtStd.text);
                },
                child: Text("Click"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: readdata(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      List<QueryDocumentSnapshot> docList = snapshot.data!.docs;

                      for (var x in docList) {
                        Map finalData = x.data() as Map<String, dynamic>;
                        ModelData m1 = ModelData(
                          id: finalData['id'],
                          name: finalData['name'],
                          std: finalData['std'],
                        );
                        dataList.add(m1);
                        print("${dataList}");
                      }
                        return ListView.builder(
                            itemCount: dataList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text("${dataList[index].id}"),
                                title: Text("${dataList[index].name}"),
                                subtitle: Text("${dataList[index].std}"),
                              );
                            });

                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
