import 'package:flutter/material.dart';
import 'package:news/components/const.dart';


class NewslistWidget extends StatelessWidget {
  const NewslistWidget({
    Key? key,
    this.image,
    this.desc,
    this.title,
    this.publishedAt,
    this.souceName,
  }) : super(key: key);

  final String? image;
  final String? desc;
  final String? title;
  final String? publishedAt;
  final String? souceName;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    DateTime dateTime = DateTime.parse(publishedAt!);
    DateTime publishedTime = DateTime.parse(publishedAt!);
    DateTime currentTime = DateTime.now();
    int differenceInHours = currentTime.difference(publishedTime).inHours;

    final String timeAgo;
    if (differenceInHours == 0) {
      timeAgo = "Just now";
    } else if (differenceInHours == 1) {
      timeAgo = "1 hour ago";
    } else {
      timeAgo = "$differenceInHours hours ago";
    }

    return Padding(
      padding: EdgeInsets.only(bottom:screenWidth * 0.030), 
      child: Center(
        child: Container(

          width: screenWidth * 0.90,
          height: screenHeight * 0.55, 
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 160, 160, 160).withOpacity(0.9),
                spreadRadius: 3,
                blurRadius: 12,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: image != null
                    ? Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02), 
                        child: Container(
                          width: screenWidth * 0.9  , 
                          height: screenHeight * 0.25, 
                          decoration: const BoxDecoration(
                          ),
                          child: Image.network(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Center(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), 
                            ),
                            child: Image.asset(
                              "assets/images/27002.jpg",
                              width: screenWidth * 0.8,
                              height: screenHeight * 0.25,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.01), 
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 122, 93, 170),
                              borderRadius: BorderRadius.circular(4), 
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02), 
                              child: Text(
                                title!,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.01), // Adjust padding based on screen size
                          child: Container(
                            height: screenHeight * 0.05, 
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 122, 93, 170),
                              borderRadius: BorderRadius.circular(4), 
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02), 
                              child: Text(
                                "title is empty",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.04,
                                ),
                              ),
                            ),
                          ),
                        ),
                  desc != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.01),
                          child: Container(
                            height: screenHeight * 0.06,
                            width: double.infinity,
                            child: Text(
                              desc!,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                fontSize: screenWidth * 0.034,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.01),
                          child: Container(
                            height: screenHeight * 0.035,
                            width: double.infinity,
                            child: Text(
                              "no description",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: screenWidth * 0.035, 
                              ),
                            ),
                          ),
                        ),
                        kHeight15,
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "read more",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.blue,
                          fontSize: screenWidth * 0.04, 
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          souceName!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: screenWidth * 0.03,
                          ),
                        ),
                        Text(
                          timeAgo,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03, 
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}