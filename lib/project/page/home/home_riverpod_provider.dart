import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_reverpod/project/services/network_service.dart';
import '../../models/post_model.dart';
import '../detail/detail_page.dart';

final getDataFuture = ChangeNotifierProvider((ref) => HomeReverProvider());

class HomeReverProvider extends ChangeNotifier{

  List<Post> list = [];


  HomeReverProvider(){
    getAllData();
  }

  Future<void> getAllData() async {
    var response = await NetworkService.GET(NetworkService.GetPosts, NetworkService.paramsEmpty());
    list = postListFromJson(response);
    notifyListeners();
  }


  void openDetailPage(Post post, BuildContext context, DetailState state) async {
    String result = await Navigator.push(context, MaterialPageRoute(builder: (c) => DetailPage(post: post, state: DetailState.update,)));
    if(result == 'refresh'){
      getAllData();
      notifyListeners();
    }
  }

  void createDetailPage(BuildContext context, DetailState state) async {
    String result = await Navigator.push(context, MaterialPageRoute(builder: (c) => const DetailPage(state: DetailState.create,)));
    if(result == 'refresh'){
      getAllData();
      notifyListeners();
    }
  }

  void deletePost(String id) async {
    await NetworkService.DELETE(NetworkService.DeletePost + id, NetworkService.paramsEmpty());
   getAllData();
    notifyListeners();
  }

}

enum DetailState{
  create,
  update
}