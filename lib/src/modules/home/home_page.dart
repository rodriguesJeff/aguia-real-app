import 'package:aguia_real_dbv/src/modules/home/home_controller.dart';
import 'package:aguia_real_dbv/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey expansionTile = GlobalKey();
  late HomeController controller;

  @override
  void initState() {
    controller = HomeController();
    controller.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.primaryColor,
      bottomNavigationBar: _bottomNavigationBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Observer(
          builder: (_) {
            if (controller.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        minRadius: 45.0,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/32440959?s=40&v=4'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.currentUser!['name'],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0),
                          ),
                          Text(
                            'Unidade: ' + controller.currentUser!['unity'],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15.0),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.chat,
                        color: Utils.greyLight,
                        size: 40,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.logout,
                          color: Utils.greyLight,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text('Bem Vindo!',
                        style: TextStyle(fontSize: 25.0, color: Colors.white)),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text('Cursos!',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ExpansionTile(
                      key: expansionTile,
                      title: const Text('Selecione'),
                      backgroundColor: Colors.white,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 15.0),
                          alignment: Alignment.topLeft,
                          child: const Text('Hard Skills',
                              style: TextStyle(fontSize: 20.0)),
                        ),
                        const ListTile(
                          title: Text('Empreendedorismo e gestão de negócios',
                              style: TextStyle(fontSize: 15.0)),
                        ),
                        const ListTile(
                          title: Text('Comunicação e Web Design',
                              style: TextStyle(fontSize: 15.0)),
                        ),
                        const ListTile(
                          title: Text('Automação industrial',
                              style: TextStyle(fontSize: 15.0)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15.0),
                          alignment: Alignment.topLeft,
                          child: const Text('Soft Skills',
                              style: TextStyle(fontSize: 20.0)),
                        ),
                        const ListTile(
                          title: Text('Liderança',
                              style: TextStyle(fontSize: 15.0)),
                        ),
                        const ListTile(
                          title: Text('Inteligência emocial',
                              style: TextStyle(fontSize: 15.0)),
                        ),
                        const ListTile(
                          title: Text('Criatividade e resolução de problemas',
                              style: TextStyle(fontSize: 15.0)),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15.0),
                          alignment: Alignment.topLeft,
                          child: const Text('Sessões de brainstorming',
                              style: TextStyle(fontSize: 20.0)),
                        ),
                        const ListTile(
                          title: Text('Assistir vídeos',
                              style: TextStyle(fontSize: 15.0)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text('Meus Atalhos!',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.description,
                                size: 40.0, color: Utils.greyDark),
                            const Text('Notas'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.event_note,
                                size: 40.0, color: Utils.greyDark),
                            const Text('Calendário'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.perm_contact_calendar,
                                size: 40.0, color: Utils.greyDark),
                            const Text('Carteirinha'),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.menu_book,
                                size: 40.0, color: Utils.greyDark),
                            const Text('Notas'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text('Meus compromissos!',
                        style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 110.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: Text('Hoje 15/01/2021',
                              style: TextStyle(
                                  color: Utils.greyDark, fontSize: 10.0)),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(Icons.event_busy, size: 25.0),
                              SizedBox(width: 10.0),
                              Text('Sem compromissos para hoje!'),
                            ],
                          ),
                        ),
                        Divider(height: 6, color: Utils.greyDark),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(height: 20.0),
                            Text('Palestra - Empatia'),
                            SizedBox(width: 20.0),
                            Text('02/03/2021'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // Image(
                  //   width: MediaQuery.of(context).size.width * 0.7,
                  //   image: AssetImage(banner),
                  // ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

Widget _bottomNavigationBar() {
  return BottomNavigationBar(
    currentIndex: 1,
    onTap: null,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home, color: Utils.greyDark, size: 40),
        label: 'Início',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.book,
          color: Utils.greyDark,
          size: 40,
        ),
        label: 'Disciplinas',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.notifications,
          color: Utils.greyDark,
          size: 40,
        ),
        label: 'Notificações',
      ),
    ],
  );
}
