import 'package:flutter/material.dart';
import 'package:flutter_application_2/view/resultscreen/result_screen.dart';
import 'package:flutter_application_2/view/utils/color_constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.ListOfList});
  final List ListOfList;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentQusindex = 0;
  int? selectedIndex;
  // int questionIndex = Dummydb.questions.length;
  int rightanswercount = 0;
  int skipcount = 0;
  int wrongcount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.BLACK,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.cancel,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  height: 30,
                  // width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: LinearPercentIndicator(
                    alignment: MainAxisAlignment.start,
                    barRadius: Radius.circular(5),
                    width: 230,
                    progressColor: Colors.orangeAccent,
                    lineHeight: 14,
                    percent: currentQusindex / widget.ListOfList.length,
                    animation: true,
                    trailing: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "${currentQusindex +1}/${widget.ListOfList.length}",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: 500,
                ),
                Positioned(
                  // top: 20,
                  top: 40,
                  left: 10,
                  height: 290,
                  width: 350,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 36, 36, 36),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Text(
                          widget.ListOfList[currentQusindex]["questions"]
                              .toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 150,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    // top: 10,

                    right: 160,
                    child: CircularPercentIndicator(
                      radius: 30,
                      progressColor: Colors.blue,
                      percent: currentQusindex / widget.ListOfList.length,
                      center: Text(
                        "${currentQusindex + 1}/${widget.ListOfList.length}",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
                children: List.generate(4, (index) {
              List answerOption = widget.ListOfList[currentQusindex]["options"];
              return Option_card(
                bordercolour: getColour(index),
                onTapoption: () {
                  // selectedIndex = index;
                  if (selectedIndex == null) {
                    setState(() {
                      selectedIndex = index;
                    });
                    if (selectedIndex ==
                        widget.ListOfList[currentQusindex]["answerIndex"]) {
                      rightanswercount++;
                      print(rightanswercount);
                    } else {
                      wrongcount++;
                      print("wrong answer");
                    }
                  }
                },
                option: answerOption[index],
                optionIcon: getIcon(index),
              );
            })),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                  onPressed: () {
                    if (selectedIndex != null) {
                      selectedIndex = null;
                      if (currentQusindex < widget.ListOfList.length - 1) {
                        setState(() {
                          currentQusindex++;
                          print(currentQusindex);
                        });
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                wronganswercount: wrongcount,
                                rightanswercount: rightanswercount,
                                skipanswer: skipcount, questions: widget.ListOfList.length,
                              ),
                            ));
                      }
                    } else {
                      if (currentQusindex < widget.ListOfList.length - 1) {
                        setState(() {
                          currentQusindex++;
                          skipcount++;
                          print(currentQusindex);
                        });
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                wronganswercount: wrongcount,
                                rightanswercount: rightanswercount,
                                skipanswer: skipcount + 1, questions: widget.ListOfList.length,
                              ),
                            ));
                      }
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget getIcon(int index) {
    if (selectedIndex != null) {
      if (widget.ListOfList[currentQusindex]["answerIndex"] == selectedIndex &&
          index == selectedIndex) {
        return Icon(
          Icons.check_circle_outline,
          color: Colors.blue,
        );
      } else if (widget.ListOfList[currentQusindex]["answerIndex"] != index &&
          selectedIndex == index) {
        return Icon(
          Icons.cancel_outlined,
          color: Colors.red,
        );
      } else if (widget.ListOfList[currentQusindex]["answerIndex"] == index) {
        return Icon(
          Icons.check_circle_outline,
          color: Colors.blue,
        );
      }
    }
    return Container(
      height: 18,
      width: 18,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white), shape: BoxShape.circle),
    );
  }

  Color getColour(int index) {
    if (selectedIndex != null) {
      if (widget.ListOfList[currentQusindex]["answerIndex"] == selectedIndex &&
          index == selectedIndex) {
        return Colors.blue;
      } else if (widget.ListOfList[currentQusindex]["answerIndex"] != index &&
          selectedIndex == index) {
        return Colors.red;
      } else if (widget.ListOfList[currentQusindex]["answerIndex"] == index) {
        return Colors.blue;
      }
    }

    return Colors.white;
  }
}

class Option_card extends StatelessWidget {
  const Option_card({
    super.key,
    required this.option,
    this.onTapoption,
    required this.bordercolour,
    required this.optionIcon,
  });
  final String option;
  final void Function()? onTapoption;
  final Color? bordercolour;
  final Widget optionIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTapoption,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: bordercolour ?? Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  option,
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                optionIcon
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
