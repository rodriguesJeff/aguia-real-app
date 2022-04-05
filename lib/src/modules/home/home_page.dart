import 'package:aguia_real_dbv/src/modules/event/event_page.dart';
import 'package:aguia_real_dbv/src/modules/home/home_controller.dart';
import 'package:aguia_real_dbv/src/modules/home/widgets/item_shortcut.dart';
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
    controller.initApp();
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
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
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
                        Icons.person,
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
                    child: const Text(
                      'Bem Vindo!',
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 15.0),
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
                        for (var unity in controller.unityes)
                          ListTile(
                            title: Text(
                              unity['name'],
                              style: const TextStyle(fontSize: 15.0),
                            ),
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
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EventPage(),
                            ),
                          ),
                          child: itemShortCut(Icons.event_note, 'Eventos'),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EventPage(),
                            ),
                          ),
                          child: itemShortCut(Icons.description, 'Relatórios'),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EventPage(),
                            ),
                          ),
                          child: itemShortCut(
                              Icons.perm_contact_calendar, 'Informações'),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const EventPage(),
                            ),
                          ),
                          child: itemShortCut(Icons.group, 'Meu Clube'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Caixa do clube',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'R\$ 1200,00',
                            style: TextStyle(
                                fontSize: 20.0, color: Utils.greyDark),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Utils.greyDark,
                            ),
                          ),
                        ]),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Ranking das unidades',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10.0),
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
