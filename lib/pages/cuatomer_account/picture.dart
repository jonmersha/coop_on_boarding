

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboarding/CommonDate.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter File Upload Example',
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  void switchScreen(str, context) =>
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => UploadPage(url: str)
      ));
  @override
  Widget build(context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
            title: Text('Flutter File Upload Example')
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text("Insert the URL that will receive the Multipart POST request (including the starting http://)", style: Theme.of(context).textTheme.headline),
              TextField(
                controller: controller,
                onSubmitted: (str) => switchScreen(str, context),
              ),
              FlatButton(
                child: Text("Take me to the upload screen"),
                onPressed: () => switchScreen(controller.text, context),
              )
            ],
          ),
        )
    );
  }
}

class UploadPage extends StatefulWidget {
  UploadPage({Key key, this.url}) : super(key: key);

  final String url;

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {


  String state = "this is state of art";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter File Upload Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(state)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
          File file;
          if(pickedFile!=null){
            file=File(pickedFile.path);
          }
          
          var res = await uploaddImageToserver('user',file, CommonData.baseUrl+'/ss');
          setState(() {
            state = res;
            print(res);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }


  uploaddImageToserver(String text,File file,String url) async{
    print("Image upload started=========================");
    var request=http.MultipartRequest("POST",Uri.parse('http://10.0.19.60:8080/ss'));
        request.fields["file"]="text";
        var  pic=await http.MultipartFile.fromPath("file_field", file.path);
        request.files.add(pic);
        var response=await request.send();

        var responseData=await response.stream.toBytes();
        var responseString=String.fromCharCodes(responseData);
        print(responseString);

  }
}