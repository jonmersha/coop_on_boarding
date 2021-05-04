import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:onboarding/CommonDate.dart';
import 'package:onboarding/awidjet/application_bar.dart';
import 'package:onboarding/custom_color/custom_color.dart';
import 'package:path/path.dart';
class ImageProcessor extends StatefulWidget{

  var data;
  var type;
  ImageProcessor(this.type,this.data);

  @override
  _ImageProcessorState createState() => _ImageProcessorState(type,data);
}

class _ImageProcessorState extends State<ImageProcessor> {
  var _data;
  var _type;
  _ImageProcessorState(this._type,this._data);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Customer File Uploader",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UploadScreen(_type,_data),
    );
  }



}


class UploadScreen extends StatefulWidget {
  var data;
  var type;
  UploadScreen(this.type,this.data, {Key key}) : super(key: key);
  @override
  _UploadScreenState createState() => _UploadScreenState(data,type);
}
class _UploadScreenState extends State<UploadScreen> {
  FlutterUploader uploader = FlutterUploader();
  StreamSubscription _progressSubscription;
  StreamSubscription _resultSubscription;
  Map<String, UploadItem> _tasks = {};
var _data;

  var _type;
  _UploadScreenState(this._data,this._type);
  @override
  void initState() {
    super.initState();
    _progressSubscription = uploader.progress.listen((progress) {
      final task = _tasks[progress.tag];
      print("progress: ${progress.progress} , tag: ${progress.tag}");
      if (task == null) return;
      if (task.isCompleted()) return;
      setState(() {
        _tasks[progress.tag] =
            task.copyWith(progress: progress.progress, status: progress.status);
      });
    });
    _resultSubscription = uploader.result.listen((result) {
      print(
          "id: ${result.taskId}, status: ${result.status}, response: ${result.response}, statusCode: ${result.statusCode}, tag: ${result.tag}, headers: ${result.headers}");
      final task = _tasks[result.tag];
      if (task == null) return;

      setState(() {
        _tasks[result.tag] = task.copyWith(status: result.status);
      });
    }, onError: (ex, stacktrace) {
      print("exception: $ex");
      print("stacktrace: $stacktrace" ?? "no stacktrace");
      final exp = ex as UploadException;
      final task = _tasks[exp.tag];
      if (task == null) return;

      setState(() {
        _tasks[exp.tag] = task.copyWith(status: exp.status);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _progressSubscription?.cancel();
    _resultSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: APPBarChieledPage("Customer On-Boarding", 'Image Upload')
          .buildPreferredSize(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(height: 20.0),
            Text(
              this._type+' Upload',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => captureFromCamera(binary: false),
                  child: Text("From Camera"),
                ),
                Container(width: 20.0),
                RaisedButton(
                  onPressed: () => captureFromGallery(binary: false),
                  child: Text("From gallery"),
                )
              ],
            ),
            Container(height: 20.0),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(20.0),
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  final item = _tasks.values.elementAt(index);
                  print("${item.tag} - ${item.status}");
                  return UploadItemView(
                    item: item,
                    onCancel: cancelUpload,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: CustomColor.cyan_blue,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _uploadUrl() {
      return CommonData.baseUrl+'/upload';
  }


  Future captureFromGallery({@required bool binary}) async {
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    uploadToServer( image);

  }
  Future captureFromCamera({@required bool binary}) async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    uploadToServer(image);

  }

  Future uploadToServer(var image) async {
    if (image != null) {
      final String filename = basename(image.path);
      final String savedDir = dirname(image.path);
      final tag = "image upload ${_tasks.length + 1}";
      var url = _uploadUrl();
      var fileItem = FileItem(
        filename: filename,
        savedDir: savedDir,
        fieldname: "file",
      );
      await uploader.enqueue(
        url: url,
        data: {"fileName": this._data['transactionId'],"photo":this._type},
        files: [fileItem],
        method: UploadMethod.POST,
        tag: tag,
        showNotification: true,
      );

      setState(() {
        _tasks.putIfAbsent(
            tag,
                () => UploadItem(
              tag: tag,
              type: MediaType.Image,
              status: UploadTaskStatus.enqueued,
            ));
      });
    }
  }

  Future cancelUpload(String id) async {
    await uploader.cancel(taskId: id);
  }
}

class UploadItem {
  final String id;
  final String tag;
  final MediaType type;
  final int progress;
  final UploadTaskStatus status;

  UploadItem({
    this.id,
    this.tag,
    this.type,
    this.progress = 0,
    this.status = UploadTaskStatus.undefined,
  });

  UploadItem copyWith({UploadTaskStatus status, int progress}) => UploadItem(
      id: this.id,
      tag: this.tag,
      type: this.type,
      status: status ?? this.status,
      progress: progress ?? this.progress);

  bool isCompleted() =>
      this.status == UploadTaskStatus.canceled ||
          this.status == UploadTaskStatus.complete ||
          this.status == UploadTaskStatus.failed;
}
enum MediaType { Image, Video }

typedef CancelUploadCallback = Future<void> Function(String id);

class UploadItemView extends StatelessWidget {
  final UploadItem item;
  final CancelUploadCallback onCancel;

  UploadItemView({
    Key key,
    this.item,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = item.progress.toDouble() / 100;
    final widget = item.status == UploadTaskStatus.running
        ? LinearProgressIndicator(value: progress)
        : Container();
    final buttonWidget = item.status == UploadTaskStatus.running
        ? Container(
      height: 50,
      width: 50,
      child: IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () => onCancel(item.id),
      ),
    )
        : Container();
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(item.tag),
              Container(
                height: 5.0,
              ),
              Text(item.status.description),
              Container(
                height: 5.0,
              ),
              widget
            ],
          ),
        ),
        buttonWidget
      ],
    );
  }
}


