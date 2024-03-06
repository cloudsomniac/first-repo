import 'package:flutter/material.dart';

void main() {
  runApp(const StatefulRoot());
}

class StatefulRoot extends StatefulWidget{
  const StatefulRoot({super.key});
  
  @override
  _StatefulRootState createState() => _StatefulRootState();
}

class _StatefulRootState extends State<StatefulRoot> {
  
  //List of all images in the feed
  List<String> imageList = [
      'images/HS1.png',
      'images/HS2.jpg',
      'images/HS3.jpg',
      'images/HS4.jpg',
      'images/HS5.jpg',
      'images/HS6.png',
      'images/HS7.png',
      'images/HS8.jpg',
      'images/HS9.png',
   ];

  //counts how many images are in the feed
  late int count = imageList.length;

  void _incrementCount() {
    setState(() {
      count++;
    });
  }

  //uses gridview to create the feed
  Widget createMyGridView() {
    return GridView.builder(
      gridDelegate: 
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.blue,
           child: Image.asset("${imageList[index]}", 
           fit: BoxFit.cover,),
        );
      });
    }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appbar contains the username
        appBar: AppBar(
          title: const Text("@ho5hi_kwon"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.grey,
          ),
          body: 
            //column layout is used to align the main parts of the instagram profile vertically
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //container holds the rounded profile picture
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300.0),
                        child: Image.asset('images/HSIcon.jpg', fit: BoxFit.cover,),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //holds the profile name and the add bio button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Kwon Hoshi"),
                              TextButton(
                                child: Text("Add Bio"),
                                style: TextButton.styleFrom(foregroundColor: Colors.blue),
                                onPressed: () {},
                              )
                            ],),
                          //holds the number of posts, number of following and number of followers
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${imageList.length} posts"),
                              Text("12 following"),
                              Text("17 followers")
                            ],)
                        ],
                      ),
                    ),
                  ]
                ),
                //holds the posts, reels, saved and tagged buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextButton.icon(
                      icon: Icon(Icons.numbers_rounded, size: 14),
                      label: Text("POSTS", style: TextStyle(fontSize: 13)),
                      onPressed: () {},
                    )),
                    Expanded(
                      child: TextButton.icon(
                      icon: Icon(Icons.video_file, size: 14),
                      label: Text("REELS", style: TextStyle(fontSize: 13)),
                      onPressed: () {},
                    )),
                    Expanded(
                      child: TextButton.icon(
                      icon: Icon(Icons.bookmark, size: 14),
                      label: Text("SAVED", style: TextStyle(fontSize: 13)),
                      onPressed: () {},
                    )),
                    Expanded(
                      child: 
                      TextButton.icon(
                      icon: Icon(Icons.emoji_emotions, size: 14),
                      label: Text("TAGGED", style: TextStyle(fontSize: 12.5)),
                      onPressed: () {},
                    )),
                  ],),
                  //the add reels buttons
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<CircleBorder>(CircleBorder()),
                      ),
                      child: Icon(Icons.add),
                    ),
                  //calls the createMyGridView() function to display the instagram feed
                  Expanded(child: createMyGridView()),
              ],
            )
      )
    );
  }

}
