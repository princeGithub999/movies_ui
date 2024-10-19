import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:movies_ui/data_model/actors_model.dart';
import 'package:movies_ui/image_list/image_list.dart';
import 'package:movies_ui/poster_detels_page.dart';

import '../data_model/data_model.dart';
import '../splace_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<ModelList1> userData = [
    ModelList1(moviesName: 'Bahubali', moviesHours: '2h 50m', moviesReting: '3.4', moviesImage: 'assets/images/img_16.png'),
    ModelList1(moviesName: 'Maharaja', moviesHours: '1h 50m', moviesReting: '9.1', moviesImage: 'assets/images/img_17.png'),
    ModelList1(moviesName: 'R E D', moviesHours: '2h 50m', moviesReting: '7.1', moviesImage: 'assets/images/img_18.png'),
    ModelList1(moviesName: 'prema Virma', moviesHours: '3h 40m', moviesReting: '8.1', moviesImage: 'assets/images/img_19.png'),
];

List<ActorsModel> actors = [

    ActorsModel(actorImage:'assets/images/img_9.png', actorName:'Ajeet kumar'),
    ActorsModel(actorImage:'assets/images/img_10.png', actorName:'Rolex vikram'),
    ActorsModel(actorImage:'assets/images/img_11.png', actorName:'Prabhat'),
    ActorsModel(actorImage:'assets/images/img_12.png', actorName:'sanjay dutt'),
    ActorsModel(actorImage:'assets/images/img_13.png', actorName:'Mahes babu'),
    ActorsModel(actorImage:'assets/images/img_15.png', actorName:'Vijay'),

];

int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
            CarouselSlider(
                items: [
                 Container(
                   margin: const EdgeInsets.all(1.0),
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8.0),
                       image: const DecorationImage(
                           image: NetworkImage('https://th.bing.com/th/id/OIP._sieGcio-iWM1nGrMlWQ0wHaEK?w=1280&h=720&rs=1&pid=ImgDetMain',),
                           fit: BoxFit.cover

                       )
                   ),
                 ),
                  Container(

                    margin: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                            image: NetworkImage('https://wallpapercave.com/wp/wp7756742.jpg',),
                            fit: BoxFit.cover

                        )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                            image: NetworkImage('https://th.bing.com/th/id/OIP.Pb81hDsC-wAdcZQXHUMiaQHaEK?w=1280&h=720&rs=1&pid=ImgDetMain',),


                        )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                            image: NetworkImage('https://images.wallpapersden.com/image/wxl-oppenheimer-2023-movie-poster_90455.jpg',),
                            fit: BoxFit.cover

                        )
                    ),
                  ),
                  Container(

                    margin: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0),
                        image: const DecorationImage(
                            image: NetworkImage('https://i.ytimg.com/vi/RX-FhPEtJwo/maxresdefault.jpg',),
                            fit: BoxFit.cover

                        )
                    ),
                  ),

                ],
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 19 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  viewportFraction: 0.8

                )),
            Padding(
            padding:  const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  child: Text('Latest',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black),),
                ),
                Align(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        ScaleTransition1(const ImageListPage()),
                      );
                    },
                   child: const Text('See all>',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),),

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
            Padding(padding: const EdgeInsets.only(left: 16,top: 20,right: 10),
              child: Card(
                color: Colors.white,
                child: SizedBox(
                  height: sizes.height * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                              Card(
                                clipBehavior:Clip.hardEdge,
                                child: SizedBox(
                                  width: sizes.width * 0.3-10,
                                  height: sizes.height * 0.2,
                                  child: Image.asset(userData[currentIndex].moviesImage,fit: BoxFit.cover,),
                                ),
                              ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10,left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Season 1'),
                                SizedBox(height: 10,),
                                Text('Sasha',style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500,color: Colors.black),),
                                SizedBox(height: 10,),
                                Text('Thriller Drama Adventure'),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
              child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Align(
                   child: Text('Popular Actors',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black),),
                 ),
                 Align(
                   child: InkWell(
                     onTap: () {
                       Navigator.of(context).push(
                         ScaleTransition1(const ImageListPage()),
                       );
                     },
                     child: const Text('See all>',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),),

                   ),
                 )

               ],
                                ),
            ),
            Row(
              children: [
                Expanded(child: SizedBox(
                  height: sizes.height * 0.1+40,
                  width: sizes.width * 0.2,
                  child:   Padding(
                    padding: const EdgeInsets.only(left: 15),
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
          Padding(
            padding:  const EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  child: Text('Latest',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.black),),
                ),
                Align(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        ScaleTransition1(const ImageListPage()),
                      );
                    },
                    child: const Text('See all>',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),),

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
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: ListView.custom(
                      scrollDirection: Axis.horizontal,
                      childrenDelegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index){
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(ScaleTransition1(PosterDetelsPage(
                                  moviesImage: userData[index].moviesImage,
                                  moviesName: userData[index].moviesName,
                                  moviesReting: userData[index].moviesReting,
                                  moviesHours: userData[index].moviesHours,
                                )));
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
    );
  }
void _changeImage() {
  setState(() {
    currentIndex = (currentIndex + 1) % userData.length;
  });
}


}
