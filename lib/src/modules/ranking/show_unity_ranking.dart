import 'package:aguia_real_dbv/src/modules/ranking/unity_ranking_controller.dart';
import 'package:aguia_real_dbv/src/modules/ranking/widgets/unity_info.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
                      for (var c in controller.lista)
                        unityInfo(name: c.name, score: c.score),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
