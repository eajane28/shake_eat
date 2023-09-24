import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'share_viewmodel.dart';

class ShareView extends StackedView<ShareViewModel> {
  const ShareView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ShareViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 138.0,
            decoration: const BoxDecoration(
              color: Color(0xFFFBAB10),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Row(children: [
              const SizedBox(width: 30.0),
              GestureDetector(
                  onTap: viewModel.toInteractiveView,
                  child: const Icon(Icons.chevron_left,
                      color: Colors.white, size: 40.0)),
              const Text(
                'Share to',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 96.0),
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18.0),
                  padding: const EdgeInsets.only(top: 96.0),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 44.22,
                                width: 46.9,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: SvgPicture.asset(
                                          'assets/messenger.svg'),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const Text('Message',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 44.22,
                                width: 46.9,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Stack(
                                  children: [
                                    Center(
                                        child: SvgPicture.asset(
                                            'assets/group.svg')),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const Text('Group',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 44.22,
                                width: 46.9,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Stack(
                                  children: [
                                    Center(
                                        child: SvgPicture.asset(
                                            'assets/link.svg')),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const Text('Copy link',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 44.22,
                                width: 46.9,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Stack(
                                  children: [
                                    Center(
                                        child: SvgPicture.asset(
                                            'assets/more.svg')),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              const Text('More',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  ShareViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ShareViewModel();
}
