import 'package:flutter/material.dart';
import 'package:weather_flutter_app/core/utils/constants.dart';

class ToolbarBody extends StatefulWidget {
  const ToolbarBody({Key? key, required this.isOnTop}) : super(key: key);
  final bool isOnTop;

  @override
  ToolbarBodyState createState() => ToolbarBodyState();
}

class ToolbarBodyState extends State<ToolbarBody> {
  bool _showSearch = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 58,
              child: Stack(
                children: [
                  Row(
                    children: [
                      AnimatedOpacity(
                        opacity: widget.isOnTop ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            width: 48,
                            height: 48,
                            child: Container(
                                padding: const EdgeInsets.all(14),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 22,
                                  color: AppColor.txtMainColor,
                                )),
                          ),
                        ),
                      ),
                      if ((!_showSearch))
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Baghdad",
                                    style: TextStyle(
                                      color: AppColor.txtMainColor,
                                      fontSize: 20,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: AppColor.txtMainColor,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        ),
                      Container(
                        width: 78,
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.bounceOut,
                      width: _showSearch == true
                          ? MediaQuery.of(context).size.width -
                              (widget.isOnTop ? 95 : 0)
                          : 48,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),

                          // gradient: AppGradient.gradient[1],
                          border: Border.all(
                              width: 1, color: Colors.white.withOpacity(.02))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_showSearch)
                            const SizedBox(
                              height: double.infinity,
                              width: 10,
                            ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _showSearch = !_showSearch;
                              });
                            },
                            child: const Icon(
                              Icons.search,
                              size: 22,
                              color: AppColor.txtMainColor,
                            ),
                          ),
                          if (_showSearch)
                            const SizedBox(
                              height: double.infinity,
                              width: 10,
                            ),
                          if (_showSearch)
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                // controller: widget.searchController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: "Find Weather of your city",
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   height: 1,
        //   color: Colors.white.withOpacity(.05),
        // )
      ],
    );
  }
}
