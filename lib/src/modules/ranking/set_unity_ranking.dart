import 'package:aguia_real_dbv/src/modules/ranking/unity_ranking_controller.dart';
import 'package:aguia_real_dbv/src/shared/models/event.dart';
import 'package:aguia_real_dbv/src/shared/services/get_unity_logo.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:aguia_real_dbv/src/views/unity_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class SetUnityRanking extends StatefulWidget {
  const SetUnityRanking({Key? key, required this.event}) : super(key: key);

  final Event event;

  @override
  State<SetUnityRanking> createState() => _SetUnityRankingState();
}

class _SetUnityRankingState extends State<SetUnityRanking>
    implements UnityView {
  late UnityRankingController controller;

  final GlobalKey expansionTile = GlobalKey();

  @override
  void initState() {
    controller = UnityRankingController(view: this, event: widget.event);
    controller.initScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('ADICIONAR PONTOS'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          child: controller.isLoading
              ? Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: Colors.white,
                    size: 20,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ExpansionTile(
                          key: expansionTile,
                          title: const Text('Unidades'),
                          backgroundColor: Colors.white,
                          children: [
                            for (var unity in controller.unityesNames)
                              InkWell(
                                onTap: () {
                                  controller.setUnity(unity);
                                },
                                child: ListTile(
                                  title: Text(
                                    unity['name'],
                                    style: const TextStyle(fontSize: 15.0),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'ADICIONAR PONTOS DA UNIDADE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Observer(builder: (_) {
                        if (controller.unity != null) {
                          return Text(
                            controller.unity!['name'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        } else {
                          return const Text(
                            'escolha a unidade',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                      }),
                      const SizedBox(height: 30.0),
                      const Text(
                        'Razão da pontuação',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        onChanged: controller.setReason,
                        decoration: InputDecoration(
                          hintText: 'Arrecadação de alimentos',
                          hintStyle: TextStyle(color: Utils.greyMid),
                          prefixIcon:
                              Icon(Icons.description, color: Utils.greyLight),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Pontuação',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      const SizedBox(height: 10.0),
                      TextField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        onChanged: controller.setScore,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '10 pontos',
                          hintStyle: TextStyle(color: Utils.greyMid),
                          prefixIcon:
                              Icon(Icons.poll_outlined, color: Utils.greyLight),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 241, 235),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(getUnityLogo(
                                        controller.unity?['name'] ??
                                            'assets/images/unityes/unidade-aguia.jpeg')),
                                    radius: 30,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: DottedLine(
                                    direction: Axis.vertical,
                                    lineLength: 80.0,
                                    lineThickness: 1.0,
                                    dashLength: 4.0,
                                    dashColor: Colors.black,
                                    dashGapLength: 4.0,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.reason?.toUpperCase() ??
                                          'razão da pontuação'.toUpperCase(),
                                      style: TextStyle(
                                        color: Utils.greyMid,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          controller.score?.toString() ?? '0',
                                          style: TextStyle(
                                            color: Utils.greyDark,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          'pontos',
                                          style: TextStyle(
                                            color: Utils.greyMid,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        const SizedBox.shrink(),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      controller.event?.eventName ??
                                          'nome do evento',
                                      style: TextStyle(
                                        color: Utils.greyMid,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15.0),
                            ElevatedButton(
                              onPressed: () {
                                controller.submitScore;
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Utils.greenAction),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: controller.isregistering
                                    ? LoadingAnimationWidget.inkDrop(
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    : const Text('SALVAR'),
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

  @override
  backToEventDetailsPage() {
    Navigator.pop(context);
  }
}
