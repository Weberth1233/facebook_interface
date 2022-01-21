import 'package:facebook_interface/utils/colors_pattern.dart';
import 'package:flutter/material.dart';

class NavigationTabs extends StatelessWidget {
  final List<IconData> icons;
  final int selectedTab;
  //Passando função que vai receber o indice do pagina selecionada
  final Function(int) onTap;
  final bool indicatorDown;

  const NavigationTabs(
      {required this.icons,
      required this.selectedTab,
      required this.onTap,
      this.indicatorDown = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      //Modificando indicador para que a borda fique em cima do icone
      indicator: BoxDecoration(
          border: indicatorDown == false
              ? const Border(
                  top: BorderSide(
                    color: ColorPattern.blueLight,
                    width: 3,
                  ),
                )
              : const Border(
                  bottom: BorderSide(
                    color: ColorPattern.blueLight,
                    width: 3,
                  ),
                )),
      //O icons.asMap().map(index, icon) - função vai percorrer a lista de icones
      //e retornar seu indice utilizado para mudar a cor do icone selecionado através da
      //da variavel selectedTab que possui o indice da pagina selecionado
      tabs: icons
          .asMap()
          .map((index, icon) {
            return MapEntry(
                index,
                Tab(
                  icon: Icon(
                    icon,
                    color: selectedTab == index
                        ? ColorPattern.blueLight
                        : Colors.black54,
                    size: 30,
                  ),
                ));
          })
          .values
          .toList(),
    );
  }
}
