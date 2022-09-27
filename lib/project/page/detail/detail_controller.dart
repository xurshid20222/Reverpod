import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/post_model.dart';
import '../../services/network_service.dart';

final postDataUpgarade = ChangeNotifierProvider((ref) => DetailController());

class DetailController extends ChangeNotifier{

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void initUpdate(Post post,){
    titleController.text = post.title!;
    bodyController.text = post.body!;
    notifyListeners();
  }

  void initCreate(){
    titleController.clear();
    bodyController.clear();
    notifyListeners();
  }

  Future<void> updatePost(String id, BuildContext context) async {

    Post editPost = Post(title: titleController.text.trim(), body: bodyController.text.trim(), id: '1', userId: 'ww');
    NetworkService.PUT(NetworkService.UpdatePost + id, NetworkService.editPost(editPost));
    Navigator.pop(context, 'refresh');
    notifyListeners();
  }


  Future<void> createPost(String title, String body, BuildContext context) async{
    Post post = Post(id: '1', title: title, body: body, userId: 'ww');

    NetworkService.POST(NetworkService.CreatePost, NetworkService.createPost(post));
    Navigator.pop(context, 'refresh');
    notifyListeners();
  }
}