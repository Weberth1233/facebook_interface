import 'package:facebook_interface/components/desktop_navigation_tabs.dart';
import 'package:facebook_interface/components/navigation_tabs.dart';
import 'package:facebook_interface/utils/resposive.dart';
import 'package:facebook_interface/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final List<Widget> _screens = [
    const Home(),
    const Scaffold(
      backgroundColor: Colors.green,
    ),
    const Scaffold(
      backgroundColor: Colors.yellow,
    ),
    const Scaffold(
      backgroundColor: Colors.purple,
    ),
    const Scaffold(
      backgroundColor: Colors.black54,
    ),
    const Scaffold(
      backgroundColor: Colors.orange,
    ),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  int _indiceAbaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final sizeWidht = MediaQuery.of(context).size;
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          appBar: isDesktop
              ? PreferredSize(
                  child: DesktopNavigationTabs(
                      icons: _icons,
                      onTap: (indice) {
                        setState(() {
                          _indiceAbaSelecionada = indice;
                        });
                      },
                      selectedTab: _indiceAbaSelecionada),
                  preferredSize: Size(sizeWidht.width, 65))
              : null,
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: _screens,
          ),
          bottomNavigationBar: isDesktop
              ? null
              : NavigationTabs(
                  icons: _icons,
                  selectedTab: _indiceAbaSelecionada,
                  onTap: (indice) {
                    setState(() {
                      _indiceAbaSelecionada = indice;
                    });
                  },
                ),
        ));
  }
}
