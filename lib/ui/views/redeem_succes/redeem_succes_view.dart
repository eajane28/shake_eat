import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'redeem_succes_viewmodel.dart';

class RedeemSuccesView extends StackedView<RedeemSuccesViewModel> {
  const RedeemSuccesView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RedeemSuccesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: null,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 405,
                      decoration: const BoxDecoration(
                        color: Color(0xFFDA1D1D),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                          bottomLeft: Radius.circular(150.0),
                          bottomRight: Radius.circular(150.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65.0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  width: 61,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  width: 61,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  width: 61,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBAB10),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ]),
                          const Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Text(
                              'Claimed!',
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 250.0),
                      child: Column(
                        children: [
                          const Center(
                            child: Text(
                              'CONGRATULATIONS!',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 165),
                          Center(
                            child: SizedBox(
                              height: 300,
                              child: Image.asset('assets/collected.png',
                                  fit: BoxFit.contain),
                            ),
                          ),
                          const SizedBox(height: 70),
                          Column(
                            children: [
                              Image.asset(
                                'assets/Vector.png',
                              ),
                              const Text(
                                'Let\'s eat!',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFFDA1D1D),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
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
      ),
    );
  }

  @override
  RedeemSuccesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RedeemSuccesViewModel();
}
