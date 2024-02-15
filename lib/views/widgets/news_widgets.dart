import 'package:flutter/material.dart';
import 'package:news/components/const.dart';

class NewslistWidget extends StatelessWidget {
  const NewslistWidget({super.key, this.image, this.desc, this.title});
  final String? image;
  final String? desc;
  final String? title;
  static const String defaultUrl='https://dribbble.com/shots/2547653-Skypicker-default-image?utm_source=Clipboard_Shot&utm_campaign=Mitas&utm_content=Skypicker%20default%20image&utm_medium=Social_Share&utm_source=Clipboard_Shot&utm_campaign=Mitas&utm_content=Skypicker%20default%20image&utm_medium=Social_Share';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 800,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: const Color.fromARGB(255, 255, 255, 255),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 4))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: image!=null?
                  Image.network(
                    image!,
                     width: 300,
                        height: 200,
                  ):
                 Center(child: Center(child: Image.asset("assets/images/27002.jpg",width: 200,height: 200,)))
                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  title!=null?
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 122, 93, 170),
                          borderRadius: radius4),
                      child: Text(
                        title!,
                        style: textStyleFuc(
                            weight: FontWeight.w300, color: kwhite, size: 14),
                      ),
                    ),
                  ):Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 122, 93, 170),
                          borderRadius: radius4),
                      child: Text(
                        "title is empty",
                        style: textStyleFuc(
                            weight: FontWeight.w300, color: kwhite, size: 14),
                      ),
                    ),
                  ),
                  desc!=null?
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 10),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: Text(
                        
                        desc!,
                        style: textStyleFuc(
                            weight: FontWeight.w500, color: kBlack, size: 15),
                      ),
                    ),
                  ):
                     Padding(
                    padding: const EdgeInsets.only(left: 30, right: 10),
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      child: Text(
                        
                        "no description",
                        style: textStyleFuc(
                            weight: FontWeight.w500, color: kBlack, size: 15),
                      ),
                    ),
                  ),
                  kHeight15,
                  Center(
                      child: GestureDetector(
                        onTap: (){
                          
                        },
                        child: Text(
                                            "read more",
                                            style: textStyleFuc(
                          weight: FontWeight.normal, color: Colors.blue, size: 14),
                                          ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}