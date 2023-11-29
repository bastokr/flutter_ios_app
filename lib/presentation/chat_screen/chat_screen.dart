/*import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as get1;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:video_player/video_player.dart';   
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:image/image.dart' as ImageProcess;
import 'controller/chat_controller.dart';
import 'full_photo_page_byte.dart'; 
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'models/message_memo.dart';

late String messageid = "";

class ChatScreen extends GetWidget<ChatController> {
  var arguments;

    ChatScreen({Key? key, required this.arguments}) : super(key: key);
 
  

  late String currentUserId = "";
  //final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //    FlutterLocalNotificationsPlugin();
  List<dynamic> listMessage = [];
  int _limit = 20;
  int _limitIncrement = 20;
  String groupMemoId = "";
  double prograss = 0;
  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = "";
  late http.Client _client;
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();
  final FocusNode focusNode = FocusNode();
  late AnimationController anicontroller;

  late Animation<double> animation; 
  List<Map<String, String>> sendData = [];
  int timeout = 60;
  sendMessageServer(sendMessage) {
    onSendMessage(
        content: sendMessage,
        etc1: "",
        type: TypeMessage.text,
        peerId: controller.arguments.peerId);
    //isLoading = true;
  //  setState(() {
      isLoading = true;
 //   });
    sendData.add({"role": "user", "content": sendMessage});
    print(sendData);

    //chatbotMessage(sendData, reciveMessageHandler);
  }

  Future<void> subscribe() async {
    establishSSEConnection();
  
  }

  void establishSSEConnection() {
    http.Client client = http.Client();
    http.Request request = http.Request('GET',
        Uri.parse('https://iukj.cafe24.com/chat/serverRoom.php?room=77'));

    client.send(request).asStream().listen((event) {
      print(event.stream.bytesToString());
    });
  }
 
  void initState() {
 
    SharedPreferences.getInstance().then((prefs) {
     // memoController = get1.Get.put(MemoController(prefs: prefs));
      readLocal();
    });

    subscribe();

    //notificationController = get1.Get.put(NotificationController());
    memoList = getAllDatas();
    focusNode.addListener(onFocusChange);
    listScrollController.addListener(_scrollListener);
    // readLocal();

    registerNotification();
    anicontroller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(anicontroller)
      ..addListener(() {
        
      });
  }

  Future<List<MessageMemo>> getAllDatas() async {
    return await memoController.getMemoList();
  }

  late Future<List<MessageMemo>> memoList;
  _scrollListener() {
    if (!listScrollController.hasClients) return;
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange &&
        _limit <= listMessage.length) {
         _limit += _limitIncrement;
 
    }
  }

  void registerNotification() {}

  void onFocusChange() {
         isShowSticker = false;
    
    }
    
 
  void readLocal() {
    if (memoController.getUserFirebaseId()?.isNotEmpty == true) {
      currentUserId = memoController.prefs.getString("login_id") ?? 'aaa';
    } else {
      /*
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic> route) => false,
      );
      */
    }
    String peerId = widget.arguments.peerId;
    if (currentUserId.compareTo(peerId) > 0) {
      groupMemoId = '$currentUserId-$peerId';
    } else {
      groupMemoId = '$peerId-$currentUserId';
    }
  }

  var _byteImage;
  Future getImage() async {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    prograss = 0;
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;

                  return SizedBox(
                    height: 250,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                ImagePicker imagePicker = ImagePicker();

                                XFile? pickedFile;

                                pickedFile = await imagePicker.pickImage(
                                    source: ImageSource.gallery,
                                    maxWidth: 640,
                                    imageQuality: 80);
                                if (pickedFile != null) {
                                  imageFile = File(pickedFile.path);

                                  final _imageFile = ImageProcess.decodeImage(
                                      imageFile!.readAsBytesSync());
                                  _byteImage = base64Encode(
                                      ImageProcess.encodePng(_imageFile!));
                                  uploadFileServer(
                                      imageFile!, TypeMessage.image);
                                  onSendMessage(
                                      content: _byteImage.toString(),
                                      etc1: "",
                                      type: TypeMessage.imageByte,
                                      peerId: '');
                                  if (imageFile != null) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                  }
                                }
                              }, // Handle your callback.
                              splashColor: Colors.brown.withOpacity(0.5),
                              child: Ink(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  image: DecorationImage(
                                    image: AssetImage('assets/icon/camera.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            //const Text(' 카메라'),
                            InkWell(
                              onTap: () async {
                                ImagePicker imagePicker = ImagePicker();
                                Navigator.pop(context);
                                XFile? pickedFile;

                                pickedFile = await imagePicker.pickImage(
                                    source: ImageSource.gallery,
                                    maxWidth: 640,
                                    imageQuality: 80);
                                if (pickedFile != null) {
                                  imageFile = File(pickedFile.path);

                                  final _imageFile = ImageProcess.decodeImage(
                                      imageFile!.readAsBytesSync());
                                  _byteImage = base64Encode(
                                      ImageProcess.encodePng(_imageFile!));

                                  onSendMessage(
                                      content: _byteImage.toString(),
                                      etc1: "",
                                      type: TypeMessage.imageByte,
                                      peerId: '');

                                  uploadFileServer(
                                      imageFile!, TypeMessage.image);

                                  if (imageFile != null) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                  }
                                }
                              }, // Handle your callback.
                              splashColor: Colors.brown.withOpacity(0.5),
                              child: Ink(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/icon/gallery.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            //const Text(' 갤러리')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () async {
                                ImagePicker imagePicker = ImagePicker();

                                XFile? pickedFile;

                                pickedFile = await imagePicker.pickVideo(
                                    source: ImageSource.camera);

                                if (pickedFile != null) {
                                  imageFile = File(pickedFile.path);
                                  if (imageFile != null) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Navigator.pop(context);
                                    //uploadFile(imageFile);
                                    uploadFileServer(
                                            imageFile!, TypeMessage.video)
                                        .then((value) => {});
                                  }
                                }
                              }, // Handle your callback.
                              splashColor: Colors.brown.withOpacity(0.5),
                              child: Ink(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  image: DecorationImage(
                                    image: AssetImage('assets/icon/movie.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            //const Text(' 카메라'),
                            InkWell(
                              onTap: () async {
                                ImagePicker imagePicker = ImagePicker();

                                XFile? pickedFile;

                                pickedFile = await imagePicker.pickVideo(
                                    source: ImageSource.gallery);

                                if (pickedFile != null) {
                                  imageFile = File(pickedFile.path);
                                  if (imageFile != null) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    //uploadFile(imageFile);
                                    Navigator.pop(context);
                                    uploadFileServer(
                                            imageFile!, TypeMessage.video)
                                        .then((value) => {});
                                  }
                                }
                              }, // Handle your callback.
                              splashColor: Colors.brown.withOpacity(0.5),
                              child: Ink(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icon/moviegallery.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            //const Text(' 갤러리')
                          ],
                        ),
                        /*
                        Container(
                          padding: EdgeInsets.all(10),
                          child: LinearPercentIndicator(
                            //leaner progress bar
                            //  width: 200, //width for progress bar
                            animation:
                                true, //animation to show progress at first
                            animationDuration: 1000,
                            lineHeight: 30.0, //height of progress bar
                            leading: Padding(
                              //prefix content
                              padding: EdgeInsets.only(right: 15),
                              child: Text("0%"), //left content
                            ),
                            trailing: Padding(
                              //sufix content
                              padding: EdgeInsets.only(left: 15),
                              child: Text(prograss.toString()), //right content
                            ),
                            percent: prograss, // 30/100 = 0.3
                            barRadius: Radius
                                .zero, //make round cap at start and end both
                            progressColor: Colors
                                .redAccent, //percentage progress bar color
                            backgroundColor: Colors
                                .orange[100], //background progressbar color
                          ),
                        ),
                        LinearProgressIndicator(
                          backgroundColor: Colors.red,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.amber,
                          ),
                          value: animation.value,
                        ),
                        */
                      ],
                    ),
                  );
                },
              ),
            ));
  }

  Future<void> uploadFileServer(File image, int type) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString() + ".mp4";
    if (TypeMessage.image == type)
      fileName = DateTime.now().millisecondsSinceEpoch.toString() + ".jpg";
    String uploadurl = "https://iukj.cafe24.com/petbutler/file_upload.php";
    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(image.path, filename: fileName
          //show only filename from path
          ),
    });
    var dio = Dio();
    Response response = await dio.post(
      uploadurl,
      data: formdata,
      onSendProgress: (int sent, int total) {
        Future.delayed(Duration(milliseconds: 10)).then((value) {
          final currentprograss = (sent / total);
        });
      },
    );

    if (response.statusCode == 200) {
      // 업로드 후 메모 테이블에 등록

      var data = response.data;

      if (TypeMessage.image == type) {
        String sendMessage = data["fileName"] +
            " : Analyze the dogs behavior in the image. Skip unnecessary content and list the content for each analysis. in korean language";
        sendData.add({"role": "user", "content": sendMessage});
        print(sendData);
      }
      // chatbotMessage(sendData, reciveMessageHandler);
      if (TypeMessage.video == type) {
        VideoPlayerController controller = VideoPlayerController.file(image);
        await controller.initialize();

        final thumbnailPath = await VideoThumbnail.thumbnailFile(
            video: image.path,
            imageFormat: ImageFormat.JPEG,
            maxWidth:
                300, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
            quality: 25,
            timeMs: (controller.value.duration.inSeconds / 2).floor() * 1000);

        imageFile = File(thumbnailPath!);
        final byteFile = ImageProcess.decodeImage(imageFile!.readAsBytesSync());
        _byteImage = base64Encode(ImageProcess.encodePng(byteFile!));

        onSendMessage(
            content: "https://iukj.cafe24.com/petbutler/uploads/$fileName",
            etc1: _byteImage.toString(),
            type: TypeMessage.video,
            peerId: '');
        uploadFileServer(imageFile!, TypeMessage.image);
      }
      //Fluttertoast.showToast(msg: response.toString() ?? response.toString());
      //print response from server

      // captureImag(image);
    } else {
      print("Error during connection to server.");
      Fluttertoast.showToast(msg: response.toString());
    }
  }

  void getSticker() {
    // Hide keyboard when sticker appear
    focusNode.unfocus();
    setState(() {
      isShowSticker = !isShowSticker;
    });
  }

  void onSendMessage(
      {required content,
      required int type,
      required String etc1,
      required String peerId}) {
    if (content.trim().isNotEmpty) {
      textEditingController.clear();

      memoController
          .sendMessage(
              content: content,
              type: type,
              groupMemoId: groupMemoId,
              currentUserId: currentUserId,
              peerId: peerId,
              etc1: etc1)
          .then((value) {
        setState(() {
          memoList = getAllDatas();
          isLoading = false;
        });
      });

      sendChantMessageServer(
          sender: memoController.prefs.getString("user_id"),
          receiver: peerId,
          sendMessage: content,
          type: type);

      if (listScrollController.hasClients) {
        listScrollController.animateTo(0,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Nothing to send', backgroundColor: ColorConstants.greyColor);
    }
  }

  String formatISOTime(DateTime date) {
    //converts date into the following format:
// or 2019-06-04T12:08:56.235-0700
    var duration = date.timeZoneOffset;
    if (duration.isNegative) {
      return ("${DateFormat("yyyy-MM-ddTHH:mm:ss.mmm").format(date)}-${duration.inHours.toString().padLeft(2, '0')}${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    } else {
      return ("${DateFormat("yyyy-MM-ddTHH:mm:ss.mmm").format(date)}+${duration.inHours.toString().padLeft(2, '0')}${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    }
  }

  Widget buildItem(int index, MessageMemo messageMemo) {
    if (messageMemo.timestamp != '') {
      // Right (my message)
      final splitted = messageMemo.content.split(' ');
      var date =
          DateTime.fromMicrosecondsSinceEpoch(int.parse(messageMemo.timestamp));

      var time = DateFormat('M/d h:m').format(date);

      return Row(
        mainAxisAlignment: (messageMemo.idTo == 'mybot')
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: <Widget>[
          if (messageMemo.type == TypeMessage.text)
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  color: ColorConstants.greyColor2,
                  borderRadius: BorderRadius.circular(8)),
              margin: const EdgeInsets.only(bottom: 10, right: 10),
              child: GestureDetector(
                child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
                    text: TextSpan(children: [
                      for (var str in splitted)
                        if (str.contains('www') || str.contains('http'))
                          TextSpan(
                            style: const TextStyle(color: Colors.blue),
                            text: str,
                            /* recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrl(Uri.parse(str),
                                      mode: LaunchMode.externalApplication);
                                }*/
                          )
                        else
                          TextSpan(
                            style: const TextStyle(color: Colors.black),
                            text: str + " ",
                          ),
                      /*TextSpan(
                        style: TextStyle(color: Colors.green),
                        text: "\n\r" + time,
                      )
                      */
                    ])),
                onTap: () {
                  final splitted = messageMemo.content.split(' ');
                  for (var url in splitted) {
                    var urlPattern =
                        r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
                    RegExpMatch? match =
                        RegExp(urlPattern, caseSensitive: false)
                            .firstMatch(url);
                    if (match != null) {
                      launchUrl(Uri.parse(match[0]!),
                          mode: LaunchMode.externalApplication);
                    } else {
                      var urlPattern2 =
                          r"([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
                      RegExpMatch? match2 =
                          RegExp(urlPattern2, caseSensitive: false)
                              .firstMatch(url);

                      if (match2 != null) {
                        launchUrl(Uri.parse('http://${match2[0]!}'),
                            mode: LaunchMode.externalApplication);
                      }
                    }
                  }
                },
              ),
            )
          else if (messageMemo.type == TypeMessage.video)
            Flexible(
                child: Container(
              decoration: BoxDecoration(),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            CustomerPlayer(url: messageMemo.content)),
                  );
                },
                child: movieImage(messageMemo.etc1),
              ),
            ))
          else
            messageMemo.type == TypeMessage.imageByte
                ? Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 10),
                    child: GestureDetector(
                      child: Image.memory(
                        const Base64Decoder().convert(messageMemo.content),
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                      onDoubleTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text("선택한 이미지를...."),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        "닫기",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        memoController
                                            .getDataBaseMemo()
                                            .deleteData(int.parse(
                                                messageMemo.timestamp))
                                            .then((value) {
                                          setState(() {
                                            sendData = [];
                                            memoList = getAllDatas();
                                            Navigator.pop(context);
                                          });
                                        });
                                      },
                                      child: const Text(
                                        "삭제",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FullPhotoBytePage(
                                              byte: messageMemo.content,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "확대보기",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );

                        //s _delete(context, messageMemo);
                      },
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(
                        bottom: isLastMessageRight(index) ? 20 : 10, right: 10),
                    child: Image.asset(
                      'images/${messageMemo.content}.gif',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget movieImage(
    byteImage,
  ) {
    //var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size.height;
    //var width = 300;

    Image img = Image.memory(
      const Base64Decoder().convert(byteImage),
      fit: BoxFit.cover,
    );

    return Stack(
      children: <Widget>[
        Container(
            width: 300,
            color: Color.fromARGB(255, 6, 6, 6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0), //or 15.0
              child: Image(image: img.image),
            )),
        const Positioned.fill(
            child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.play_circle,
                  color: Colors.black,
                  size: 50,
                )))
      ],
    );
  }

  bool isLastMessageLeft(int index) {
    if ((index > 0 &&
            listMessage[index - 1].get(FirestoreConstants.idFrom) ==
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  bool isLastMessageRight(int index) {
    if ((index > 0 &&
            listMessage[index - 1].get(FirestoreConstants.idFrom) !=
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> onBackPress() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      Navigator.pop(context);
    }

    return Future.value(false);
  }

  var updatetoken = true;
  @override
  Widget build(BuildContext context) {
    // var controller = get1.Get.put(NotificationController());
/*
    controller.messageModel.listen((value) {
      if (controller.listenIndex.value == 0) {
        controller.setgetlisten = 1;
        messageid = value.id;

        memoController
            .sendMessage(
                content: value.body,
                type: TypeMessage.text,
                groupMemoId: groupMemoId,
                currentUserId: 'mybot',
                peerId: 'mybot',
                etc1: 'mybot')
            .then((value) {
          setState(() {
            memoList = getAllDatas();
            // print(memoList);
            isLoading = false;
          });
        });

        /*
        onSendMessage(
            content: value.body,
            etc1: "text",
            type: 0,
            peerId: widget.arguments.peerId);
            */
      } else {}
    });

    if ((controller.token.value) != "" && updatetoken == true) {
      updatetoken = false;
      updateToken(
          user_id:
              memoController.prefs.getString("user_id") ?? "parksk66@gmail.com",
          token: controller.token.value);
    }

    print(controller.token);
*/
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 81, 157, 244),
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Text(
            this.widget.arguments.peerNickname,
            style: TextStyle(color: ColorConstants.primaryColor),
          ),
          centerTitle: true,
          actions: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.orange,
                    ),
                  ),
                  onPressed: () {
                    print('deleteAll');

                    showDialog(
                      context: context,
                      builder: (context) {
                        String contentText = "Content of Dialog";
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                                title: Text("메모 전체 삭제..."),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      memoController
                                          .getDataBaseMemo()
                                          .deleteAllData()
                                          .then((value) {
                                        setState(() {
                                          memoList = getAllDatas();
                                        });
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "삭제",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "취소",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  )
                                ]);
                          },
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    color: Colors.white,
                    // <-- Icon
                    Icons.delete,
                    size: 24.0,
                  ),
                ),
              ],
            )
          ]),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: onBackPress,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  // List of messages
                  buildListMessage(),

                  // Sticker
                  // isShowSticker ? buildSticker() : SizedBox.shrink(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Visibility(
                      visible: isLoading,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          fit: StackFit.loose,
                          children: const [
                            SpinKitThreeInOut(
                              color: Color.fromARGB(255, 188, 120, 10),
                              size: 20.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Input content
                  buildInput(),
                ],
              ),

              // Loading
              // buildLoading()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Positioned(
      child: isLoading ? const SizedBox.shrink() : const SizedBox.shrink(),
    );
  }

  Widget buildInput() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: ColorConstants.greyColor2, width: 0.5)),
          color: Colors.white),
      child: Row(
        children: <Widget>[
          // Button send image
          Material(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: const Icon(Icons.image),
                onPressed: getImage,
                color: ColorConstants.primaryColor,
              ),
            ),
          ),

          // Edit text
          Flexible(
            child: TextField(
              onSubmitted: (value) {
                sendMessageServer(textEditingController.text);
              },
              style: const TextStyle(
                  color: ColorConstants.primaryColor, fontSize: 15),
              controller: textEditingController,
              decoration: const InputDecoration.collapsed(
                hintText: '입력...',
                hintStyle: TextStyle(color: ColorConstants.greyColor),
              ),
              focusNode: focusNode,
              autofocus: true,
            ),
          ),

          // Button send message
          Material(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  sendMessageServer(textEditingController.text);
                },
                color: ColorConstants.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListMessage() {
    return Flexible(
      child: FutureBuilder(
          future: memoList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var memoList = snapshot.data as List<MessageMemo>;
              if (memoList.isNotEmpty) {
                return ListView.builder(
                  itemCount: memoList.length,
                  itemBuilder: (context, index) => (memoList[index].type == 3)
                      ? buildItem(index, memoList[index])
                      : buildItem(index, memoList[index]),
                  reverse: true,
                  controller: listScrollController,
                );
              } else {
                return const Center(child: Text("강집사 애견 상담..."));
              }
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: ColorConstants.themeColor,
              ));
            }
          }),
    );
  }

  captureImag(image) async {
    VideoPlayerController controller = VideoPlayerController.file(image);
    await controller.initialize();
    int maxLen = 10;
    if (controller.value.duration.inSeconds < 30)
      maxLen = controller.value.duration.inSeconds;
    for (int i = 0; i < maxLen; i++) {
      VideoThumbnail.thumbnailFile(
              video: image.path,
              imageFormat: ImageFormat.JPEG,
              maxHeight: 1000,
              maxWidth:
                  640, // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
              quality: 100,
              timeMs: i * 1000)
          .then((value) async {
        imageFile = File(value!);
        final byteFile = ImageProcess.decodeImage(imageFile!.readAsBytesSync());
        _byteImage = base64Encode(ImageProcess.encodePng(byteFile!));
        onSendMessage(
            content: _byteImage.toString(),
            type: TypeMessage.imageByte,
            etc1: '',
            peerId: widget.arguments.peerId);

        await uploadFileCapture(imageFile!);
      });
    }
  }

  Future<void> uploadFileCapture(File image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString() + ".jpg";
    String uploadurl = "https://iukj.cafe24.com/petbutler/file_upload.php";
    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(image.path, filename: fileName
          //show only filename from path
          ),
    });
    var dio = Dio();
    Response response = await dio.post(
      uploadurl,
      data: formdata,
      onSendProgress: (int sent, int total) {
        Future.delayed(Duration(milliseconds: 10)).then((value) {
          final currentprograss = (sent / total);
          /*EasyLoading.showProgress(currentprograss,
              status: '${(currentprograss * 100).toStringAsFixed(0)}%');
          if (currentprograss >= 1) {
            EasyLoading.dismiss();
          }
          */
        });
        //update the progress
      },
    );

    if (response.statusCode == 200) {
      // 업로드 후 메모 테이블에 등록
      onSendMessage(
          content: "https://iukj.cafe24.com/petbutler/uploads/$fileName",
          type: TypeMessage.text,
          etc1: '',
          peerId: widget.arguments.peerId);

      //Fluttertoast.showToast(msg: response.toString() ?? response.toString());
      //print response from server
    } else {
      print("Error during connection to server.");
      Fluttertoast.showToast(
          msg: response.toString() ?? "Error during connection to server.");
    }
  }
}

class ChatPageArguments {
  final String peerId;
  final String peerAvatar;
  final String peerNickname;
  final String token;
  ChatPageArguments(
      {required this.peerId,
      required this.peerAvatar,
      required this.peerNickname,
      required this.token});
}

class TypeMessage {
  static const text = 0;
  static const image = 1;
  static const imageByte = 3;
  static const sticker = 2;
  static const video = 4;
}
*/