import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'redeem_viewmodel.dart';

class RedeemView extends StatelessWidget {
  const RedeemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RedeemViewModel>.reactive(
      viewModelBuilder: () => RedeemViewModel(),
      builder: (context, model, child) => Scaffold(
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
                                'Claim it!',
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
                      // ... your existing UI code here ...

                      // Add the timer display
                      Padding(
                        padding: const EdgeInsets.only(top: 250.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                '${model.timerDuration}',
                                style: const TextStyle(
                                  fontSize: 150,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Text(
                              'seconds to collect',
                              style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFFDA1D1D),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height: 300,
                                child: GestureDetector(
                                  onTap: model.claimedVoucher,
                                  child: Image.asset('assets/voucher.png',
                                      fit: BoxFit.contain),
                                ),
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
      ),
    );
  }
}
