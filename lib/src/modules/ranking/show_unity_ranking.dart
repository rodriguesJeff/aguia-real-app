import 'package:aguia_real_dbv/src/modules/ranking/unity_ranking_controller.dart';
import 'package:aguia_real_dbv/src/shared/services/get_unity_logo.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class ShowUnityRanking extends StatefulWidget {
  const ShowUnityRanking({Key? key}) : super(key: key);

  @override
  State<ShowUnityRanking> createState() => _ShowUnityRankingState();
}

class _ShowUnityRankingState extends State<ShowUnityRanking> {
  late UnityRankingController controller;

  @override
  void initState() {
    controller = UnityRankingController();
    controller.initScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      appBar: AppBar(
        title: const Text('RANKING DAS UNIDADES'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (_) => Padding(
            padding: const EdgeInsets.all(16),
            child: controller.isLoading
                ? Center(
                    child: LoadingAnimationWidget.inkDrop(
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30.0),
                      for (var unity in controller.unityes)
                        Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(getUnityLogo(unity['name'])),
                                radius: 30,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    unity['name'],
                                    style: TextStyle(
                                      color: Utils.greyMid,
                                      fontSize: 20,
                                    ),
                                  ),
                                  RatingBarIndicator(
                                    rating: 5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 20.0,
                                    direction: Axis.horizontal,
                                  ),
                                ],
                              ),
                              const SizedBox.shrink(),
                              const SizedBox.shrink(),
                              const SizedBox.shrink(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '800\npts',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Utils.greyDark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
