import 'package:astrotak/api/api.dart';
import 'package:astrotak/model/ask_question_model.dart';
import 'package:astrotak/pages/askQuestion/bloc/askquestion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AskQuestionPage extends StatefulWidget {
  const AskQuestionPage({Key? key}) : super(key: key);

  @override
  _AskQuestionPageState createState() => _AskQuestionPageState();
}

class _AskQuestionPageState extends State<AskQuestionPage> {
  late List<AskQuestionModel> _data;

  int _selectedIndex = 0;
  int _navigationIndex = 2;
  TextEditingController _controller = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<AskquestionBloc, AskquestionState>(
      builder: (context, state) {
        if ((state is AskQuestionLoaded)) {
          _data = state.questionList;

          return SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        askAQuestion(),
                        chooseCategory(),
                        const SizedBox(
                          height: 60,
                        ),
                        cardFooter(),
                        const SizedBox(
                          height: 60,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(color: const Color(0xFF4b60bc), borderRadius: BorderRadius.circular(0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Wallet Balance : रु 0",
                              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                decoration: BoxDecoration(
                                    color: Colors.white, border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(10)),
                                height: 40,
                                child: const Center(
                                  child: Text(
                                    "Add Money",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF4b60bc)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(color: const Color(0xFF4b60bc), borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "रु 150(1 Question on ${_data[0].name})",
                              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    color: Colors.white, border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(10)),
                                height: 30,
                                child: const Center(
                                  child: Text(
                                    "Ask Now",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color(0xFF4b60bc)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _navigationIndex,
              elevation: 0,
              selectedItemColor: Color(0xFFff944d),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              onTap: (e) {
                setState(() {
                  _navigationIndex = e;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.question_answer,
                    ),
                    backgroundColor: Colors.transparent,
                    label: "Talk"),
                BottomNavigationBarItem(icon: Icon(Icons.live_help), label: "Ask Question"),
                BottomNavigationBarItem(icon: Icon(Icons.report), label: "Report"),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
              ],
            ),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: FloatingActionButton(
                onPressed: () async {
                  AskquestionState state = context.read<AskquestionBloc>().state;

                  if (state is AskQuestionLoaded) {}
                },
                tooltip: "Action Button",
                backgroundColor: const Color(0xFFf28e23),
                child: const Icon(Icons.menu),
              ),
            ),
          ));
        } else {
          return SafeArea(
              child: Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(),
            body: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFff944d)),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _navigationIndex,
              elevation: 0,
              selectedItemColor: Color(0xFFff944d),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              onTap: (e) {
                setState(() {
                  _navigationIndex = e;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.question_answer,
                    ),
                    backgroundColor: Colors.transparent,
                    label: "Talk"),
                BottomNavigationBarItem(icon: Icon(Icons.live_help), label: "Ask Question"),
                BottomNavigationBarItem(icon: Icon(Icons.report), label: "Report"),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
              ],
            ),
            floatingActionButton: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: FloatingActionButton(
                onPressed: () async {
                  AskquestionState state = context.read<AskquestionBloc>().state;

                  if (state is AskQuestionLoaded) {}
                },
                tooltip: "Action Button",
                backgroundColor: const Color(0xFFf28e23),
                child: const Icon(Icons.menu),
              ),
            ),
          ));
        }
      },
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        iconSize: 50,
        icon: const Image(
          image: AssetImage("assets/images/hamburger.png"),
          fit: BoxFit.contain,
        ),
        onPressed: () {},
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage("assets/images/profile.png"),
            ))
      ],
      title: const SizedBox(
        height: 55,
        child: Image(
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget customBottomNavigationBar() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BottomNavigationBar(items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "Talk"),
          ])
        ],
      ),
    );
  }

  Widget askAQuestion() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Ask a Question",
            style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            "Seek accurate answers to your life problems and get guidance towards the right path. Whether the problem is related to love, self, life, business, money, education or work, our astrologers will do an in depth study of your birth chart to provide personalized responses along with remedies.",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget chooseCategory() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Choose Category",
            style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Card(
            elevation: 3.0,
            child: DropdownButtonFormField(
                value: _selectedIndex,
                elevation: 6,
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                items: List.generate(
                    _data.length,
                    (index) => DropdownMenuItem(
                          child: Padding(padding: const EdgeInsets.only(left: 10), child: Text(_data[index].name.toString())),
                          value: index,
                        )),
                onChanged: (e) {
                  setState(() {
                    _selectedIndex = e as int;
                  });
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            minLines: 5,
            controller: _controller,
            maxLines: null,
            cursorColor: Colors.grey,
            maxLength: 150,
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
              ),
            ),
          ),
          const Text(
            "Ideas what to Ask (Select Any)",
            style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          ListView.builder(
              itemCount: _data[_selectedIndex].suggestions.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        _controller.text = _data[_selectedIndex].suggestions[i];
                      }),
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 25,
                            child: Image(
                              color: Color(0xFFff944d),
                              image: AssetImage("assets/images/ask.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _data[_selectedIndex].suggestions[i],
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      height: 10,
                    ),
                  ],
                );
              }),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Seeking accurate answers to difficult questions troubling your mind? Ask credible astrologers to know what future has in store for you.",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
          ),
        ],
      ),
    );
  }
}

Widget cardFooter() {
  return Container(
    padding: const EdgeInsets.all(10),
    color: const Color(0xFFff944d).withOpacity(.2),
    child: Column(
      children: const [
        Text(
          "• Personalized responses provided by our team of Vedic astrologers within 24 hours.",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xFFff944d)),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "• Qualified and experienced astrologers will look into your birth chart and provide the right guidance.",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xFFff944d)),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "• You can seek answers to any part of your life and for most pressing issues.",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xFFff944d)),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "• Our team of Vedic astrologers will not just produce answers but also suggest a remedial solution.",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color(0xFFff944d)),
        ),
      ],
    ),
  );
}
