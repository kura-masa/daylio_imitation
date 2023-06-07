import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class RemoveAds extends StatefulWidget {
  const RemoveAds({Key? key}) : super(key: key);

  @override
  State<RemoveAds> createState() => _RemoveAdsState();
}

class _RemoveAdsState extends State<RemoveAds> {
  final ScrollController _controller = ScrollController();
  List<Slide> slides = [];
  bool boo = false;
  var red = const Color.fromARGB(255, 250, 35, 19);
  var green = Colors.green;

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        widgetDescription: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconAndText(text: '広告なし！', color: green),
            IconAndText(text: '無限の気分', color: green),
            IconAndText(text: 'アイコン数 2000以上', color: green),
            IconAndText(text: '無限のリマインダー', color: green),
          ],
        ),
      ),
    );
    slides.add(
      Slide(
        widgetDescription: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconAndText(text: '自動バックアップ', color: green),
            IconAndText(text: 'もっと目標を立てる', color: green),
            IconAndText(text: '高度な統計', color: green),
            IconAndText(text: '華々しいカラーテーマ', color: green),
          ],
        ),
      ),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      tabs.add(Container(child: slides[i].widgetDescription));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 242, 195),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _controller,
              child: Stack(
                children: [
                  // big white circle
                  Align(
                    alignment: Alignment.topRight,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        heightFactor: 0.8,
                        widthFactor: 0.65,
                        child: Container(
                          height: screenWidth,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // men women (image)
                  Visibility(
                    visible: !boo,
                    child: Positioned(
                      left: 125,
                      top: 10,
                      width: 380,
                      child: Image.asset(
                        '/Users/K/Desktop/Daylio/assets/images/recommender(Men).png',
                        alignment: Alignment.topRight,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: boo,
                    child: Positioned(
                      left: 125,
                      top: 10,
                      width: 380,
                      child: Image.asset(
                        '/Users/K/Desktop/Daylio/assets/images/recommender(Women).png',
                        alignment: Alignment.topRight,
                      ),
                    ),
                  ),
                  // プレミアムを体験しよう！
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                      child: const Text(
                        'プレミアムを体験しよう！',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 33),
                      ),
                    ),
                  ),
                  //
                  Column(
                    children: [
                      // slider widget
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 50),
                          width: 300,
                          height: 250,
                          child: IntroSlider(
                            backgroundColorAllSlides: Colors.transparent,
                            showDoneBtn: false,
                            showNextBtn: false,
                            showSkipBtn: false,
                            showPrevBtn: false,
                            scrollable: true,
                            autoScroll: true,
                            loopAutoScroll: true,
                            colorDot: Colors.grey,
                            colorActiveDot: Colors.black,
                            sizeDot: 5.0,
                            typeDotAnimation:
                                DotSliderAnimation.SIZE_TRANSITION,
                            listCustomTabs: renderListCustomTabs(),
                            scrollPhysics: const BouncingScrollPhysics(),
                            onTabChangeCompleted: (value) {
                              setState(() {
                                if (value == 1) boo = true;
                                if (value == 0) boo = false;
                              });
                            },
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 140,
                            height: 140,
                            margin: const EdgeInsets.only(bottom: 5),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                                primary: Colors.white,
                                onPrimary: Colors.grey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '月額',
                                    style: TextStyle(
                                      color: green,
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    '￥360/月',
                                    style:
                                        TextStyle(color: green, fontSize: 17),
                                  ),
                                  const Text(
                                    '毎月請求',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                width: 140,
                                height: 180,
                                margin: const EdgeInsets.only(bottom: 5),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 3,
                                    primary: red,
                                    onPrimary: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                  onPressed: () {},
                                  child: Column(
                                    children: const [
                                      Text(
                                        '4か月間',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          height: 1.7,
                                        ),
                                      ),
                                      Text(
                                        '無料',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            height: 1.2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 140,
                                height: 140,
                                margin: const EdgeInsets.only(bottom: 5),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.white,
                                    onPrimary: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                          width: 3.0,
                                          color: red,
                                        )),
                                  ),
                                  onPressed: () {},
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '年間プラン',
                                        style: TextStyle(
                                          color: red,
                                          fontSize: 16,
                                          height: 1.5,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '￥240/月',
                                            style: TextStyle(
                                                color: red, fontSize: 16),
                                          ),
                                          const Text(
                                            '￥360',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              height: 0.8,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: const [
                                          Text(
                                            '年間請求額',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13),
                                          ),
                                          Text(
                                            '￥2,880',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              height: 1,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        '定期購入。いつでもキャンセル可能です。',
                        style: TextStyle(fontSize: 17, height: 3),
                      ),
                      // 使用条件　購入を復元
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.grey[300],
                            onTap: () {},
                            // customBorder: const CircleBorder(),
                            borderRadius: BorderRadius.circular(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                '使用条件',
                                style: TextStyle(color: green),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            splashColor: Colors.grey[300],
                            onTap: () {},
                            // customBorder: const CircleBorder(),
                            borderRadius: BorderRadius.circular(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                '購入を復元',
                                style: TextStyle(color: green),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // go to bottom of page
                      const SizedBox(height: 20),
                      InkWell(
                        splashColor: Colors.grey[300],
                        onTap: () {
                          _controller.animateTo(
                            _controller.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.decelerate,
                          );
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Column(
                            children: [
                              Text(
                                'もっと見る',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[700]),
                              ),
                              Stack(
                                children: [
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color.fromARGB(255, 198, 196, 196),
                                    size: 25,
                                  ),
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 198, 196, 196),
                                      ),
                                    ),
                                    child: null,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      // 注意事項
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          '無料トライアル期間が終了すると、Googlej Playに利用料が請求されます。'
                          '月額サブスクリプションは¥360で、毎月自動的に更新されます。'
                          '1回前払いの年間サブスクリプションは¥2,880で、毎年自動的に更新されます。',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 150),
                        child: Text(
                          '更新料は、現在の利用登録期間が終了する24時間以内にアカウントに'
                          '請求されます。サブスクリプションは、Google Playのアカウント設定から'
                          '管理することができ、自動更新を解除することもできます。',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // back button
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color.fromARGB(255, 209, 207, 207),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    child: InkWell(
                      splashColor: Colors.grey[300],
                      onTap: () {
                        Navigator.pop(context);
                      },
                      customBorder: const CircleBorder(),
                      child: Ink(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Transform.rotate(
                          angle: 45 * pi / 180,
                          child: const Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 209, 207, 207),
                            size: 33,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // 無料トライアルを始める
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: screenWidth,
                height: 95,
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                color: const Color.fromARGB(255, 253, 242, 195),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: green,
                    onPrimary: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '無料トライアルを始める',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        '7日間無料、その後 ￥2,880/年',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconAndText extends StatelessWidget {
  const IconAndText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.done,
            color: Colors.white,
            size: 20,
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}
