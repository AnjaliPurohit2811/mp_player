import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../homescreen/components/icon.dart';
import '../homescreen/components/slider.dart';
import '../homescreen/components/slidertext.dart';
import '../provider/music_provider.dart';
import '../utils/music.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: const Text('RECOMMENDED LIST',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.more_vert,size: 27,),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 360,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(musicList[songProvider.songIndex]!['image']),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    musicList[songProvider.songIndex]['title'],
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: Icon(
                      songProvider.isFavorited
                          ? Icons.favorite_border
                          : Icons.favorite,
                      size: 29,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      Provider.of<SongProvider>(context,listen: false).toggleFavorite();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            slider(context, songProvider),
            sliderText(songProvider),

            const SizedBox(
              height: 15,
            ),
            icons(songProvider),


          ],
        ),
      ),
    );
  }
}