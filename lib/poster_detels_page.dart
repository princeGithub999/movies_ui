import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_ui/splace_screen.dart';
import 'package:movies_ui/utils/contence/string_contence.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

import 'data_model/actors_model.dart';
import 'data_model/data_model.dart';

class PosterDetelsPage extends StatefulWidget {

  final String moviesImage;
  final String moviesName;
  final String moviesReting;
  final String moviesHours;


  const PosterDetelsPage({
    super.key,
      required this.moviesImage, required this.moviesName, required this.moviesReting, required this.moviesHours,
  });

  @override
  State<PosterDetelsPage> createState() => _PosterDetelsPageState();
}

class _PosterDetelsPageState extends State<PosterDetelsPage> {

  late String receiveMoviesImage;
  late String receiveMoviesName;
  late String receiveMoviesReting;
  late String receiveMoviesHours;


  late VideoPlayerController _controllerVideo;
  late Future<void> _initializeVideoPlayerFuture;

  var starCount = 0;
  var starCount1 = 0;

  @override
  void initState() {

    receiveMoviesImage = widget.moviesImage;
    receiveMoviesName = widget.moviesName;
    receiveMoviesReting = widget.moviesReting;
    receiveMoviesHours = widget.moviesHours;

    _controllerVideo = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );


    _initializeVideoPlayerFuture = _controllerVideo.initialize();
    _controllerVideo.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controllerVideo.dispose();
    super.dispose();
  }

  List<ActorsModel> actors = [

    ActorsModel(actorImage:'assets/images/img_9.png', actorName:'Ajeet kumar'),
    ActorsModel(actorImage:'assets/images/img_10.png', actorName:'Rolex vikram'),
    ActorsModel(actorImage:'assets/images/img_11.png', actorName:'Prabhat'),
    ActorsModel(actorImage:'assets/images/img_12.png', actorName:'sanjay dutt'),
    ActorsModel(actorImage:'assets/images/img_13.png', actorName:'Mahes babu'),
    ActorsModel(actorImage:'assets/images/img_15.png', actorName:'Vijay'),

  ];

  List<ModelList1> userData = [
    ModelList1(moviesName: 'Bahubali', moviesHours: '2h 50m', moviesReting: '3.4', moviesImage: 'assets/images/img_16.png'),
    ModelList1(moviesName: 'Maharaja', moviesHours: '1h 50m', moviesReting: '9.1', moviesImage: 'assets/images/img_17.png'),
    ModelList1(moviesName: 'R E D', moviesHours: '2h 50m', moviesReting: '7.1', moviesImage: 'assets/images/img_18.png'),
    ModelList1(moviesName: 'prema Virma', moviesHours: '3h 40m', moviesReting: '8.1', moviesImage: 'assets/images/img_19.png'),
  ];

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child:  Column(
          children: [
            Stack(
              children: [
                Container(
                  width: sizes.width * 1,
                  height: sizes.height * 0.4+20,
                  color: Colors.blueGrey,
                  child: Image.asset(receiveMoviesImage,fit: BoxFit.cover,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25,left: 10),
                          child: IconButton(onPressed: () {

                          }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
                        ),
                        SizedBox(width: sizes.width * 0.6+25,),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 10),
                          child: IconButton(
                            onPressed: () {
                              // Button action
                            },
                            icon: const Icon(Icons.save,color: Colors.white,),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: sizes.height*0.2),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(receiveMoviesName,style: const TextStyle(color: Colors.white,fontSize: 30),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('2017 Thriller Dream Adventure ${receiveMoviesHours}',style: TextStyle(color: Colors.white70,fontSize: 17),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Image.asset('assets/images/star.png',height: 15,width: 15,),
                          SizedBox(width: sizes.width * 0.1-30,),
                          Text(receiveMoviesReting,style: const TextStyle(color: Colors.white70,fontSize: 17),),
                          SizedBox(width: sizes.width * 0.8-40,),
                          Image.asset('assets/images/play.png',height: 50,width: 50,),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(left: 15,right: 15,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child:  Text('Story',style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.w500),),
                  ),

                  SizedBox(height: sizes.height * 0.1-75,),
                  const ReadMoreText(moviesStory,
                    style: TextStyle(fontSize: 17,color: Colors.black87),
                    lessStyle: TextStyle(color: Colors.red),
                    moreStyle: TextStyle(color: Colors.red),
                    textAlign: TextAlign.justify,
                    trimLines: 5,
                    trimMode: TrimMode.Line,
                  ),

                  SizedBox(height: sizes.height * 0.1-30,),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Gallery',style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.w500)),
                  ),

                  SizedBox(height: sizes.height * 0.1-50),

                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                          aspectRatio: _controllerVideo.value.aspectRatio,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              VideoPlayer(_controllerVideo),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if(_controllerVideo.value.isPlaying){
                                      _controllerVideo.pause();
                                    }else{
                                      _controllerVideo.play();
                                    }
                                  });
                                },
                                child: Icon(_controllerVideo.value.isPlaying ?Icons.pause: Icons.play_arrow,color: Colors.white,),
                              )
                            ],
                          ),
                        );
                      } else {

                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),

                  SizedBox(height: sizes.height * 0.1-50),

                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Cast',style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.w500),)
                  ),
                  Row(
                    children: [
                      Expanded(child: SizedBox(
                        height: sizes.height * 0.1+40,
                        width: sizes.width * 0.2,
                        child:   Padding(
                          padding: const EdgeInsets.only(left: 1),
                          child: ListView.custom(
                              scrollDirection: Axis.horizontal,
                              childrenDelegate: SliverChildBuilderDelegate((BuildContext context , int index){
                                return Column(
                                  children: [
                                    Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: SizedBox(
                                        width: sizes.width * 0.2-7,
                                        height: sizes.height * 0.1,
                                        child: Image.asset(
                                          actors[index].actorImage,fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return const Center(
                                              child: Text('Image not found'),
                                            );
                                          },
                                        ),
                                      ),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(actors[index].actorName),
                                    )
                                  ],
                                );
                              },
                                  childCount: actors.length
                              )
                          ),
                        )
                        ,
                      ))
                    ],
                  ),

                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text('Reviews',style: TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.w500),)
                ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Card(
                        color: Colors.white70,
                        child: SizedBox(

                          width: sizes.width * 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      maxRadius: 25,
                                      child: ClipOval(
                                        child: Image.asset('assets/images/img_15.png',fit: BoxFit.cover,height: sizes.height*0.1,width: sizes.height*0.1,),
                                      ),

                                    ),
                                    SizedBox(width: sizes.width * 0.1-20),
                                    Text('Krishna Patel \n@krishana013'),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: ReadMoreText(reviewText,
                                    trimMode: TrimMode.Line,
                                    trimLines: 3,
                                    moreStyle: TextStyle(color: Colors.red),
                                    lessStyle: TextStyle(color: Colors.red),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                               SizedBox(height: sizes.height * 0.1-60,),
                               Row(
                                 children: [
                                   FivePointedStar(
                                     onChange: (count) {
                                       setState(() {
                                         starCount1 = count;
                                       });
                                     },
                                   ),
                                   SizedBox(width: sizes.width * 0.1 - 20,),
                                   Text('$starCount1',style: TextStyle(fontSize: 18,color: Colors.red),)
                                 ],
                               )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Card(
                        color: Colors.white70,
                        child: SizedBox(

                          width: sizes.width * 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15,left: 15,right: 15,bottom: 20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      maxRadius: 25,
                                      child: ClipOval(
                                        child: Image.asset('assets/images/img_12.png',fit: BoxFit.cover,height: sizes.height*0.1,width: sizes.height*0.1,),
                                      ),

                                    ),
                                    SizedBox(width: sizes.width * 0.1-20),
                                    Text('Bhakti Thakar \n@bhxkti2'),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: ReadMoreText(reviewText2,
                                    trimMode: TrimMode.Line,
                                    trimLines: 3,
                                    moreStyle: TextStyle(color: Colors.red),
                                    lessStyle: TextStyle(color: Colors.red),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                SizedBox(height: sizes.height *0.1-50),
                                Row(
                                  children: [
                                    FivePointedStar(
                                      onChange: (count) {
                                        setState(() {
                                          starCount = count;
                                        });
                                      },
                                    ),
                                    SizedBox(width: sizes.width * 0.1 - 20,),
                                    Text('$starCount',style: TextStyle(fontSize: 18,color: Colors.red),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
            Row(
              children: [
                Expanded(child:
                SizedBox(
                  height: sizes.height * 0.3,
                  child: Padding(
                    padding:  EdgeInsets.only(top: 10,left: 10),
                    child: ListView.custom(
                        scrollDirection: Axis.horizontal,
                        childrenDelegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index){
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push( ScaleTransition1(
                                    PosterDetelsPage(
                                      moviesImage: userData[index].moviesImage,
                                      moviesName: userData[index].moviesName,
                                      moviesReting: userData[index].moviesReting,
                                      moviesHours: userData[index].moviesHours,
                                    ),
                                  )
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Card(
                                        clipBehavior: Clip.hardEdge,
                                        child: SizedBox(height: sizes.height * 0.2, width: sizes.width * 0.3-10,
                                          child: Image.asset(
                                            userData[index].moviesImage,
                                            fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
                                            return const Center(child: Text('Image not available'));  // Fallback for any error
                                          },
                                          ),
                                        ),

                                      ),
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 10,top: 5),
                                      child: Text(userData[index].moviesName,style: const TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),),),
                                    Padding(
                                      padding:  const EdgeInsets.only(left: 10),
                                      child: Row(

                                        children: [
                                          Text(userData[index].moviesHours,style: const TextStyle(fontSize: 13,color: Colors.black38),),
                                          const SizedBox(width: 33,),
                                          Image.asset('assets/images/star.png',height: 15,width: 15,),
                                          const SizedBox(width: 5,),
                                          Text(userData[index].moviesReting,style: const TextStyle(fontSize: 13)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            childCount: userData.length
                        )),
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
