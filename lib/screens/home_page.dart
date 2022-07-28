import 'package:api_with_cubit/cubit/post_fetch_cubit.dart';
import 'package:api_with_cubit/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Fetch With Cubit'),
      ),
      body: Center(
        child: BlocBuilder<PostFetchCubit, PostFetchState>(
          builder: (context, state) {
            if (state is PostFetchLoading) {
              return const CircularProgressIndicator();
            } else if (state is PostFetchError) {
              return Text(state.failure.message);
            } else if (state is PostFetchLoaded) {
              final postList = state.postList;
              return postList.isEmpty
                  ? const Text('No any posts')
                  : ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        final Post singlePost = postList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(singlePost.id.toString()),
                          ),
                          title: Text(singlePost.title),
                          subtitle: Text(singlePost.body),
                        );
                      },
                    );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
