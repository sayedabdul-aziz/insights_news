import 'package:flutter/material.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/feature/search/search_list_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String queryData = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.containerColor,
          title: Text(
            'Insights Search',
            style: TextStyle(color: AppColor.lomanadaColor),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: AppColor.whiteColor),
                cursorColor: AppColor.lomanadaColor,
                onChanged: (value) {
                  setState(() {
                    queryData = value;
                  });
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    queryData = value;
                  });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColor.lomanadaColor,
                    ),
                    filled: true,
                    fillColor: AppColor.containerColor,
                    hintText: 'Search for news keyword like egypt,..',
                    hintStyle:
                        TextStyle(color: AppColor.whiteColor, fontSize: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: AppColor.containerColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: AppColor.containerColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColor.containerColor))),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: SearchListView(query: queryData)),
            ],
          ),
        ));
  }
}
