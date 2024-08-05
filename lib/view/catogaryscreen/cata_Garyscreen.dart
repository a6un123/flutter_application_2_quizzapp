import 'package:flutter/material.dart';
import 'package:flutter_application_2/dummydb.dart';
import 'package:flutter_application_2/view/catogaryscreen/widget/catagary_card.dart';
import 'package:flutter_application_2/view/homescreen/homescreen.dart';
import 'package:flutter_application_2/view/utils/color_constants.dart';

class CataGaryscreen extends StatelessWidget {
  const CataGaryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi john",
                        style: TextStyle(
                            color: ColorConstants.WHITE,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "lets make this day more productive",
                        style: TextStyle(color: ColorConstants.GREY),
                      )
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 15,
                    // backgroundColor: Colors.orange,
                    child: Image.network(
                        fit: BoxFit.contain,
                        "https://i.pinimg.com/236x/fa/99/00/fa9900c8047d5c4b5f1c2f1ed2f66b86.jpg"),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Lets, play",
                style: TextStyle(
                    color: ColorConstants.WHITE,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              GridView.builder(
                physics: ScrollPhysics(),
                itemCount: Dummydb.Quizlist.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 10, mainAxisExtent: 280
                    // mainAxisExtent: 300,
                    ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(ListOfList: Dummydb.questions[index],),));
                  },
                  child: CatagaryCard(
                    image: Dummydb.Quizlist[index]["image"]!,
                    title: Dummydb.Quizlist[index]["title"]!,
                    quiz: Dummydb.Quizlist[index]["quiz"]!,
                  ),
                ),
              )
            ],
          ),
        ),
      
      ),
    );
  }
}
