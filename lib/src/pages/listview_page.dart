import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final _scrollController = ScrollController();
  final List<int> _list = [];
  int _finalItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _pagination();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista builder'),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          (_isLoading)
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20)
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: ListView.builder(
        itemCount: _list.length,
        controller: _scrollController,
        itemBuilder: (BuildContext context, int key) {
          return FadeInImage(
            height: 250,
            fit: BoxFit.fitWidth,
            placeholder: const AssetImage("assets/jar-loading.gif"),
            image:
                NetworkImage("https://picsum.photos/id/${_list[key]}/500/300"),
          );
        },
      ),
    );
  }

  Future<void> _pullRefresh() async {
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      _list.clear();
      _finalItem++;
      _pagination();
    });
    return Future.delayed(duration);
  }

  void _pagination() {
    for (int i = 0; i < 10; i++) {
      setState(() => _list.add(_finalItem++));
    }
  }

  Future<Timer> _fetchData() async {
    setState(() => _isLoading = true);
    return Timer(const Duration(seconds: 2), () {
      _isLoading = false;
      _scrollController.animateTo(
        _scrollController.position.pixels + 100,
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
      );
      _pagination();
    });
  }
}
