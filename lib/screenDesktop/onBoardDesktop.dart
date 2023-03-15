import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../pages/loginpage.dart';
import '../widgets/data.dart';

class OnBoardDesktop extends StatefulWidget {
  const OnBoardDesktop({Key? key}) : super(key: key);

  @override
  State<OnBoardDesktop> createState() => _OnBoardDesktopState();
}

class _OnBoardDesktopState extends State<OnBoardDesktop> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ])),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: contents.length,
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (_, i) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(25),
                            child: Row(children: [
                              Expanded(child: Image.asset(contents[i].image)),
                              Expanded(
                                  child: Column(children: [
                                Text(
                                  contents[i].text,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  contents[i].descripcion,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ]))
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(contents.length,
                            (index) => buildPage(index, context))),
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.all(40),
                    child: MaterialButton(
                      onPressed: () async {
                        if (currentIndex == contents.length - 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => LoginPage()),
                          );
                        }
                        _controller.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOut,
                        );
                      },
                      color: Theme.of(context).colorScheme.secondary,
                      textColor: Theme.of(context).colorScheme.background,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        currentIndex == contents.length - 1
                            ? "Continuar"
                            : "Siguiente",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              child: Container(
                  child: Lottie.asset('assets/LottieLogo1.json',
                      fit: BoxFit.none)))
        ],
      ),
    );
  }

  Container buildPage(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? Color.fromARGB(255, 255, 255, 255)
            : Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
      ),
    );
  }
}
