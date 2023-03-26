import 'package:flutter/material.dart';
import 'package:enimilo/screens/funding/components/story_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "Current Fundings",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.green.shade900,
                            fontFamily: "krona",
                            fontWeight: FontWeight.w300),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SizedBox(
                  height: 320,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: upcomingTransactions.length,
                      itemBuilder: (context, int index) {
                        return SizedBox(
                          height: 300,
                          width: 220,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 0.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/test.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(13.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Container(
                                                color: Colors.greenAccent,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Target: ${upcomingTransactions[index][1]}",
                                                    style: const TextStyle(
                                                        color: Colors.indigo,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Trending Stories",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.green.shade900,
                          fontFamily: "krona",
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              StoryCard(context, "How it started"),
              StoryCard(context, "Get the rain"),
              StoryCard(context, "Farming Campaigns"),
              StoryCard(context, "Seeding insured"),
              StoryCard(context, "AgroProcessing Mechanisims"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}

List upcomingTransactions = [
  [
    const Icon(
      Icons.diamond,
      color: Colors.red,
      size: 40,
    ),
    "SHS150.52",
    DateTime(2022, 10, 16),
    "Luxury"
  ],
  [
    const Icon(
      Icons.logo_dev,
      color: Colors.blue,
      size: 40,
    ),
    "SHS180.01",
    DateTime(2022, 10, 17),
    "Software"
  ],
  [
    const Icon(
      Icons.polymer,
      color: Colors.blue,
      size: 40,
    ),
    "SHS10.32",
    DateTime(2022, 10, 18),
    "Tooling"
  ],
  [
    const Icon(
      Icons.anchor,
      size: 40,
      color: Colors.green,
    ),
    "SHS19.39",
    DateTime(2022, 10, 22),
    "Vacation/Travel"
  ],
  [
    const Icon(
      Icons.music_note,
      color: Colors.purple,
      size: 40,
    ),
    "SHS90.19",
    DateTime(2022, 10, 23),
    "Education"
  ],
  [
    const Icon(
      Icons.face,
      color: Colors.purple,
      size: 40,
    ),
    "SHS89.32",
    DateTime(2022, 10, 24),
    "Makeup"
  ],
  [
    const Icon(
      Icons.music_note,
      color: Colors.purple,
      size: 40,
    ),
    "SHS90.19",
    DateTime(2022, 10, 23),
    "Education"
  ],
];

List pastTransactions = [
  [
    const Icon(
      Icons.diamond,
      color: Colors.pink,
      size: 40,
    ),
    "-€150.52",
    DateTime(2022, 9, 16),
    "Jewlery"
  ],
  [
    const Icon(
      Icons.home,
      color: Colors.green,
      size: 40,
    ),
    "-€180.32",
    DateTime(2022, 9, 13),
    "Gardening"
  ],
  [
    const Icon(
      Icons.branding_watermark,
      color: Colors.blue,
      size: 40,
    ),
    "-€112.39",
    DateTime(2022, 9, 11),
    "Software"
  ],
  [
    const Icon(
      Icons.polymer,
      color: Colors.orange,
      size: 40,
    ),
    "-€170.19",
    DateTime(2022, 9, 10),
    "Materials"
  ],
  [
    const Icon(
      Icons.face,
      color: Colors.blue,
      size: 40,
    ),
    "-€250.12",
    DateTime(2022, 9, 9),
    "Beauty"
  ],
];
