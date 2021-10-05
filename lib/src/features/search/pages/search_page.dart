import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_fm/src/core/utils/debouncer.dart';
import 'package:last_fm/src/core/utils/sized_cofig.dart';
import 'package:last_fm/src/features/search/bloc/search_bloc.dart';
import 'package:last_fm/src/style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchBloc bloc = SearchBloc();
  String query = "";
  final ScrollController scrollController = ScrollController();
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    debouncer.run(() {
      final maxScroll = scrollController.position.maxScrollExtent;
      final currentScroll = scrollController.position.pixels;
      if (maxScroll - currentScroll <= 50) {
        bloc.add(GetMoreSearchResult(query));
      }
    });
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [buildSearchBar(), buildContent()],
        ),
      ),
    );
  }

  Widget buildContent() {
    return Expanded(
      child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoadingResults) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ErrorInSearch) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is ResultReady) {
              if (state.result.isEmpty) {
                return const Center(
                  child: Text("No Results!"),
                );
              }
              return ListView.builder(
                  controller: scrollController,
                  itemCount: state.hasReachedMax
                      ? state.result.length
                      : state.result.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= state.result.length) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final track = state.result[index];
                    return ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, "/trackView",
                            arguments: track);
                      },
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(track.image?.first.text ?? ""),
                      ),
                      title: Text(track.name),
                      subtitle: Text(track.artist),
                    );
                  });
            }
            return const Center(
              child: Text("Type the name of a track to search.."),
            );
          }),
    );
  }

  Container buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(SizeConfig.h(15)),
      color: AppColors.primaryColor,
      child: Container(
          height: SizeConfig.h(44),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: TextField(
                    style: TextStyle(fontSize: SizeConfig.h(15)),
                    autofocus: true,
                    onSubmitted: (v) {
                      if (v.isNotEmpty && v != query) {
                        query = v;
                        bloc.add(GetSearchResult(query));
                      }
                    },
                    onChanged: (v) {
                      if (v.isNotEmpty) {
                        debouncer.run(() {
                          bloc.add(GetSearchResult(v));
                        });
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.primaryColor,
                        ),
                        hintText: "Search here",
                        hintStyle: TextStyle(
                          fontSize: SizeConfig.h(15),
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
