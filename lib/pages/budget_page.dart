import 'package:budget_tracker/json/budget_json.dart';
import 'package:budget_tracker/json/day_month.dart';
import 'package:budget_tracker/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BudgetPage extends StatefulWidget {
  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int activeMonth = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 20, right: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stats',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: black,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(AntDesign.plus),
                          SizedBox(width: 10),
                          Icon(AntDesign.search1)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(months.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMonth = index;
                          });
                        },
                        child: Container(
                          width: (size.width - 40) / 7,
                          child: Column(
                            children: [
                              Text(
                                months[index]['label'],
                                style: TextStyle(fontSize: 10),
                              ),
                              SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: activeMonth == index
                                      ? primary
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: activeMonth == index
                                        ? primary
                                        : black.withOpacity(0.1),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 7.0,
                                      bottom: 7.0,
                                      right: 10,
                                      left: 10),
                                  child: Text(
                                    months[index]['day'],
                                    style: TextStyle(
                                      fontSize: 10,
                                      color:
                                      activeMonth == index ? white : black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: List.generate(budget_json.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: grey.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3
                        )
                      ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(budget_json[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: grey,
                          ),),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  budget_json[index]['price'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    budget_json[index ]['label_percentage'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Text(
                                "\$5000.00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Stack(
                          children: [
                            Container(
                              width: size.width - 40,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                            ),
                            Container(
                              width: (size.width - 40) * budget_json[index]['percentage'],
                              height: 4,
                              decoration: BoxDecoration(
                                  color: budget_json[index]['color'],
                                  borderRadius: BorderRadius.circular(5)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
               );
            }),
          )
        ],
      ),
    );
  }
}
