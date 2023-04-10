import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Network/Local/cache_helper.dart';
import '../../Shared/Colors and Icons/colors_icons.dart';
import '../../Shared/Components/On Boarding Item/on_boarding_item.dart';
import '../../Shared/Components/components.dart';
import '../Shop Login/shop_login.dart';

class PageViewModel {
  final String? image;
  final String? title;
  final String? body;

  PageViewModel(
    this.image,
    this.title,
    this.body,
  );
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  var onBoardingController = PageController();
  bool isLast = false;

  List<PageViewModel> onBoardingModel =
  [
    PageViewModel(
      'assets/images/onBoard_3.jpg',
      'Welcome To Trendy',
      'The World\'s largest shopping Community',
    ),
    PageViewModel(
      'assets/images/onBoard_3.jpg',
      'Shop from Trendy',
      'From games to gadgets, get any product from abroad, delivered by Trendy.',
    ),
    PageViewModel(
      'assets/images/onBoard_3.jpg',
      'Travel for less',
      'Make money every time you travel by delivering products to local along the way',
    ),
  ];

  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value)
    {
      if(value)
      {
        NavigateAnfFinish(context, ShopLogin());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:
        [
          TextButton(
              onPressed: submit,
              child: const Text('SKIP', style: TextStyle(
                color: maincolor0,
              ),),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: onBoardingController,
                itemBuilder: (context, index) => onBoardingItemBuilder(context, onBoardingModel[index]),
                itemCount: onBoardingModel.length,
                onPageChanged: (int index)
                {
                  if(index == onBoardingModel.length-1)
                  {
                    setState(() {
                      isLast = true;
                    });
                  }
                  else
                  {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 70),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                      dotColor: Colors.black26,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                      expansionFactor: 4,
                      activeDotColor: maincolor0,
                    ),
                    controller: onBoardingController,
                    count: onBoardingModel.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: maincolor0,
                  onPressed: ()
                  {
                    if(isLast)
                    {
                      submit();
                    }
                    else
                    {
                      onBoardingController.nextPage(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(IconAPP.arrowIcon,color: ColorApp.whiteColor,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
