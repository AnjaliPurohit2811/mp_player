import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp_player/accountscreen/account_screen.dart';
import 'package:mp_player/detailscreen/detail_screen.dart';
import 'package:mp_player/queuescreen/queue_screen.dart';
import 'package:mp_player/utils/music.dart';
import 'package:provider/provider.dart';

import '../provider/music_provider.dart';
import '../utils/music_list.dart';
import 'components/container_box.dart';
import 'components/list_tile.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<SongProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu , size: 35,),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => QueueScreen(),));
          }, icon: Icon(Icons.queue_music_outlined , size: 35,)),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen(),));
          }, icon: Icon(Icons.person_2_outlined , size: 35,)),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "SONGS FOR YOU",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Spacer(),
                 
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Image.asset('asset/img/safar.png', fit: BoxFit.cover,),
            ),
             SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "VIBES & GENERES",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    'VIEW ALL',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: musicList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    audioProvider.changeIndex(index);
                    audioProvider.openAudio();
                    Navigator.of(context)
                        .pushNamed('/detail', arguments: musicList[index]);
                  },
                  child: containerbox(
                      title: musicList[index]['title'],
                      subtitle: musicList[index]['subtitle'],
                      img: "${musicList[index]['image']}"),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "RECOMMENDED LIST",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    'VIEW ALL',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 315,
                ),
                itemCount: musicList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      audioProvider.changeIndex(index);
                      audioProvider.openAudio();

                      Navigator.of(context)
                          .pushNamed('/detail', arguments: musicList[index]);
                    },
                    child: list_tileScreen(
                      title: musicList[index]['title'],
                      subtitle: musicList[index]['subtitle'],
                      img: "${musicList[index]['image']}",
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),

    );


  }
}
