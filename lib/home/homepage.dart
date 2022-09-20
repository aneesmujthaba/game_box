import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:game_box/models/game_data_model.dart';
import 'package:group_button/group_button.dart';

import '../api_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

late Future<GameDataResponseModel> _gameData;

List<bool> isSelected1 = [false];
List<bool> isSelected2 = [false];
List<bool> isSelected3 = [false];
List<bool> isSelected4 = [false];
List<bool> isSelected5 = [false];
List<bool> isSelected6 = [false];

Color _iconColorAll = Colors.white;
Color _iconColorAction = Colors.white;
Color _iconColorAdventure = Colors.white;
Color _iconColorPuzzle = Colors.white;
Color _iconColorSports = Colors.white;
Color _iconColorSimulation = Colors.white;

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    APIService().gameData();
    _gameData = APIService().gameData();
    super.initState();
    isSelected1 = [true];
    _iconColorAll = Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff050B18),
        unselectedItemColor: const Color(0xff808191),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.format_list_bulleted,
              color: Color(0xff7560E3),
            ),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorites',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 56,
        backgroundColor: const Color(0xff050B18),
        flexibleSpace: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xff02B2D47),
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            alignment: FractionalOffset.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Color(0xff7560E3),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundImage:
                              AssetImage('assets/avatar/avatar.png'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'John',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    CupertinoButton(
                      minSize: double.minPositive,
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.search_sharp,
                        color: Color(0xff7560E3),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                    CupertinoButton(
                      minSize: double.minPositive,
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Color(0xff7560E3),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text('Popular',
                      style: TextStyle(
                          color: Color(0xff7560E3),
                          fontWeight: FontWeight.w900,
                          fontSize: 22))),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  height: 200,
                  width: 272,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AspectRatio(
                            aspectRatio: 305 / 150,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                image: DecorationImage(
                                  image:
                                      AssetImage('./assets/images/image1.jpeg'),
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color(0xff2B2D47),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0))),
                            height: 48,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    'Game Caption',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.favorite_outline,
                                    color: Color(0xff7560E3),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Color(0xff2B2D47),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 12, bottom: 6),
                child: GroupButton(
                  isRadio: true,
                  buttonHeight: 24,
                  textPadding: const EdgeInsets.only(left: 10, right: 10),
                  selectedColor: const Color(0xff674FE0),
                  unselectedColor: const Color(0xff2B2D47),
                  selectedTextStyle: const TextStyle(fontSize: 12),
                  borderRadius: BorderRadius.circular(20),
                  unselectedTextStyle:
                      const TextStyle(fontSize: 12, color: Color(0xff808191)),
                  spacing: 10,
                  selectedButton: 0,
                  onSelected: (index, isSelected) =>
                      print('$index button is selected'),
                  buttons: const [
                    "All",
                    "PlayStation",
                    "Nintendo",
                    "X-Box",
                    "PC",
                    "Steam",
                    "Stadia"
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 12.0),
                    child: Container(
                      height: 34,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: const Color(0xff2B2D47),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(20),
                        isSelected: isSelected1,
                        color: Colors.white,
                        selectedColor: Colors.white,
                        fillColor: const Color(0xff2B2D47),
                        splashColor: Colors.black26,
                        selectedBorderColor: const Color(0xff674FE0),
                        onPressed: (int index) {
                          setState(() {
                            isSelected1[index] = !isSelected1[index];
                            !isSelected1[index]
                                ? _iconColorAll = Colors.white
                                : _iconColorAll = Colors.red;
                          });
                        },
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 14.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.flash_on,
                                  size: 18,
                                  color: _iconColorAll,
                                ),
                                const Text(
                                  'All',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      height: 34,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: const Color(0xff2B2D47),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(20),
                        isSelected: isSelected2,
                        color: Colors.white,
                        selectedColor: Colors.white,
                        fillColor: const Color(0xff2B2D47),
                        splashColor: Colors.black26,
                        selectedBorderColor: const Color(0xff674FE0),
                        onPressed: (int index) {
                          setState(() {
                            isSelected2[index] = !isSelected2[index];
                            !isSelected2[index]
                                ? _iconColorAction = Colors.white
                                : _iconColorAction = Colors.red;
                          });
                        },
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 14.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.flash_on,
                                  size: 18,
                                  color: _iconColorAction,
                                ),
                                const Text(
                                  'Action',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      height: 34,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: const Color(0xff2B2D47),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(20),
                        isSelected: isSelected3,
                        color: Colors.white,
                        selectedColor: Colors.white,
                        fillColor: const Color(0xff2B2D47),
                        splashColor: Colors.black26,
                        selectedBorderColor: const Color(0xff674FE0),
                        onPressed: (int index) {
                          setState(() {
                            isSelected3[index] = !isSelected3[index];
                            !isSelected3[index]
                                ? _iconColorAdventure = Colors.white
                                : _iconColorAdventure = Colors.red;
                          });
                        },
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 14.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.flash_on,
                                  size: 18,
                                  color: _iconColorAdventure,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  'Adventure',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      height: 34,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: const Color(0xff2B2D47),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(20),
                        isSelected: isSelected4,
                        color: Colors.white,
                        selectedColor: Colors.white,
                        fillColor: const Color(0xff2B2D47),
                        splashColor: Colors.black26,
                        selectedBorderColor: const Color(0xff674FE0),
                        onPressed: (int index) {
                          setState(() {
                            isSelected4[index] = !isSelected4[index];
                            !isSelected4[index]
                                ? _iconColorPuzzle = Colors.white
                                : _iconColorPuzzle = Colors.red;
                          });
                        },
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 14.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.album_rounded,
                                  size: 18,
                                  color: _iconColorPuzzle,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  'Puzzle',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      height: 34,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: const Color(0xff2B2D47),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(20),
                        isSelected: isSelected5,
                        color: Colors.white,
                        selectedColor: Colors.white,
                        fillColor: const Color(0xff2B2D47),
                        splashColor: Colors.black26,
                        selectedBorderColor: const Color(0xff674FE0),
                        onPressed: (int index) {
                          setState(() {
                            isSelected5[index] = !isSelected5[index];
                            !isSelected5[index]
                                ? _iconColorSports = Colors.white
                                : _iconColorSports = Colors.red;
                          });
                        },
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 14.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.sports_football,
                                  size: 18,
                                  color: _iconColorSports,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  'Sports',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, right: 20.0),
                    child: Container(
                      height: 34,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        color: const Color(0xff2B2D47),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(20),
                        isSelected: isSelected6,
                        color: Colors.white,
                        selectedColor: Colors.white,
                        fillColor: const Color(0xff2B2D47),
                        splashColor: Colors.black26,
                        selectedBorderColor: const Color(0xff674FE0),
                        onPressed: (int index) {
                          setState(() {
                            isSelected6[index] = !isSelected6[index];
                            !isSelected6[index]
                                ? _iconColorSimulation = Colors.white
                                : _iconColorSimulation = Colors.red;
                          });
                        },
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 14.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.train,
                                  size: 18,
                                  color: _iconColorSimulation,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  'Simulation',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  alignment: Alignment.topLeft,
                  child: const Text('Today',
                      style: TextStyle(
                          color: Color(0xff7560E3),
                          fontWeight: FontWeight.w900,
                          fontSize: 22))),
            ),
            StaggeredGridView.countBuilder(
                staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                shrinkWrap: true,
                itemCount: 3,
                mainAxisSpacing: 14,
                crossAxisCount: 1,
                physics: const ScrollPhysics(),
                itemBuilder: (_, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AspectRatio(
                          aspectRatio: 400 / 200,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                              image: DecorationImage(
                                image:
                                    AssetImage('./assets/images/image1.jpeg'),
                                fit: BoxFit.fitWidth,
                                alignment: FractionalOffset.center,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Color(0xff2B2D47),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0))),
                          height: 120,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, top: 10, bottom: 10),
                                    child: Text(
                                      'Game Caption',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 20, top: 10, bottom: 10),
                                    child: Icon(
                                      Icons.favorite_outline,
                                      color: Color(0xff7560E3),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 26,
                                      child: ElevatedButton(
                                        onPressed: null,
                                        style: ElevatedButton.styleFrom(
                                          disabledBackgroundColor:
                                              const Color(0xff1f2137),
                                          shape: const StadiumBorder(),
                                        ),
                                        child: Row(
                                          children: const <Widget>[
                                            Icon(
                                              Icons.calendar_today_rounded,
                                              color: Colors.orange,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              '12 Feb 2021',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 26,
                                      child: ElevatedButton(
                                        onPressed: null,
                                        style: ElevatedButton.styleFrom(
                                          disabledBackgroundColor:
                                              const Color(0xff1f2137),
                                          shape: const StadiumBorder(),
                                        ),
                                        child: Row(
                                          children: const <Widget>[
                                            Icon(
                                              Icons.flash_on,
                                              color: Colors.red,
                                              size: 16,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(
                                              'Action',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, right: 12),
                                child: Row(
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Download',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        )),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Image.asset(
                                      'assets/icon/appstoreicon.png',
                                      width: 24,
                                      height: 24,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(
                                      'assets/icon/playstoreicon.png',
                                      width: 24,
                                      height: 24,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Image.asset(
                                      'assets/icon/steamicon.png',
                                      width: 24,
                                      height: 24,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
