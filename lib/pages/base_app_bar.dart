import 'package:daylio_imitation/pages/sub/remove_ads.dart';
import 'package:daylio_imitation/pages/sub/search_text_delegate.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.red;

  const BaseAppBar({Key? key}) : super(key: key);

  _search(BuildContext context) async {
    final text = await showSearch(
      context: context,
      delegate: SearchTextDelegate(),
    );
    if (text != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 3,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // remove ads icon
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                splashColor: Colors.grey[300],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RemoveAds(),
                      fullscreenDialog: true,
                    ),
                  );
                },
                customBorder: const CircleBorder(),
                child: Ink(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    '/Users/K/Desktop/Daylio/assets/images/remove_ad.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent.withOpacity(0),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(0),
            ),
            onPressed: () {
              // do something
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          ),
          Expanded(child: Container()),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent.withOpacity(0),
            ),
            onPressed: () {
              // do something
            },
            child: const Text(
              '2022年8月',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Expanded(child: Container()),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent.withOpacity(0),
            ),
            onPressed: () {
              // do something
            },
            child: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ),
          // search icon
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                splashColor: Colors.grey[300],
                onTap: () {
                  _search(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => _search(context),
                  //     // const Search_try(),
                  //     // const Search(),
                  //     fullscreenDialog: true,
                  //   ),
                  // );
                },
                customBorder: const CircleBorder(),
                child: Ink(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  height: 25,
                  width: 25,
                  child: const Icon(Icons.search, color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
