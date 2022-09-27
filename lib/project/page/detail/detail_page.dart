import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_reverpod/project/page/home/home_riverpod_provider.dart';
import '../../models/post_model.dart';
import 'detail_controller.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({Key? key,  this.post,  this.state = DetailState.create}) : super(key: key);
  final Post? post;
  final DetailState state;




  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(postDataUpgarade);

    return Scaffold(
      appBar: AppBar(
        title:  Text(state == DetailState.update ? 'Update' : 'Create'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: provider.titleController,
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: provider.bodyController,
            ),

            const SizedBox(height: 20,),
            IconButton(onPressed: () {
              state == DetailState.update ? provider.updatePost(post!.id!, context) :
              provider.createPost(provider.titleController.text.trim() ,provider.bodyController.text.trim(), context);
            },
                icon: const Icon(Icons.done),
            ),
          ],


        ),
      ),
    );
  }
}