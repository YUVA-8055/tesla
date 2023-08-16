import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/screens/HomeScreen/Home_controller.dart';
import 'package:tesla/widgets/teslaBottomNav.dart';

import '../../../widgets/BatteryStatus.dart';
import '../../../widgets/DoorLock.dart';
import '../../../widgets/tempDetails.dart';
import '../../../widgets/tyrePsiTile.dart';
import '../../../widgets/tyres.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController _controller = HomeController();
  late AnimationController _batteryAnimationController;
  late Animation<double> _batteryAnimation;
  late Animation<double> _batteryStatusAnimation;

  late AnimationController _tempAnimationController;
  late Animation<double> _animationCarShift;
  late Animation<double> _animationTempDetailShow;
  late Animation<double> _animationCoolGlow;

  late AnimationController _tyreAnimationController;
  late Animation<double> _animationTyrePsi1;
  late Animation<double> _animationTyrePsi2;
  late Animation<double> _animationTyrePsi3;
  late Animation<double> _animationTyrePsi4;
  late List<Animation<double>> _tyreAnimlist;

  void setUpTyreAnimation() {
    _tyreAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));

    _animationTyrePsi1 = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.34, 0.5));
    _animationTyrePsi2 = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.5, 0.67));
    _animationTyrePsi3 = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.67, 0.84));
    _animationTyrePsi4 = CurvedAnimation(
        parent: _tyreAnimationController, curve: Interval(0.84, 1));
  }

  void setUpBatteryAnimation() {
    _batteryAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _batteryAnimation = CurvedAnimation(
        parent: _batteryAnimationController, curve: Interval(0.0, 0.5));

    _batteryStatusAnimation = CurvedAnimation(
        parent: _batteryAnimationController, curve: Interval(0.6, 1));
  }

  void setUpTempAnimation() {
    _tempAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    _animationCarShift = CurvedAnimation(
        parent: _tempAnimationController, curve: Interval(0.2, 0.4));

    _animationTempDetailShow = CurvedAnimation(
        parent: _tempAnimationController, curve: Interval(0.45, 0.65));
    _animationCoolGlow = CurvedAnimation(
        parent: _tempAnimationController, curve: Interval(0.7, 1));
  }

  @override
  void initState() {
    setUpBatteryAnimation();
    setUpTempAnimation();
    setUpTyreAnimation();
    _tyreAnimlist = [
      _animationTyrePsi1,
      _animationTyrePsi2,
      _animationTyrePsi3,
      _animationTyrePsi4
    ];
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _tempAnimationController.dispose();
    _tyreAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(
          [_controller, _batteryAnimationController, _tempAnimationController]),
      builder: (context, snapshot) {
        return Scaffold(
          bottomNavigationBar: TeslaBottomNav(
              onTap: (index) {
                if (index == 1) {
                  _batteryAnimationController.forward();
                } else if (_controller.selectedBotmNavTab == 1 && index != 1) {
                  _batteryAnimationController.reverse(from: 0.7);
                }

                if (index == 2) {
                  _tempAnimationController.forward();
                } else if (_controller.selectedBotmNavTab == 2 && index != 2) {
                  _tempAnimationController.reverse(from: 0.4);
                }
                if (index == 3) {
                  _tyreAnimationController.forward();
                } else if (_controller.selectedBotmNavTab == 3 && index != 3) {
                  _tyreAnimationController.reverse(from: 0.4);
                }
                _controller.showTyreController(index);
                _controller.onBotmNavTabChange(index);
              },
              selectedTab: _controller.selectedBotmNavTab),
          body: SafeArea(child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                  ),
                  Positioned(
                    left: constraints.maxWidth / 2 * _animationCarShift.value,
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.1),
                      child: SvgPicture.asset(
                        "assets/icons/Car.svg",
                        width: double.infinity,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      right: _controller.selectedBotmNavTab == 0
                          ? constraints.maxWidth * 0.05
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _controller.selectedBotmNavTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isRightDoorLock,
                          press: _controller.updateRightDoorLock,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      left: _controller.selectedBotmNavTab == 0
                          ? constraints.maxWidth * 0.05
                          : constraints.maxWidth / 2,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _controller.selectedBotmNavTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isLeftDoorLock,
                          press: _controller.updateLeftDoorLock,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      top: _controller.selectedBotmNavTab == 0
                          ? constraints.maxHeight * 0.15
                          : constraints.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _controller.selectedBotmNavTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isbonnetLock,
                          press: _controller.updateBonnetLock,
                        ),
                      )),
                  AnimatedPositioned(
                      duration: Duration(milliseconds: 300),
                      bottom: _controller.selectedBotmNavTab == 0
                          ? constraints.maxHeight * 0.18
                          : constraints.maxHeight / 2,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _controller.selectedBotmNavTab == 0 ? 1 : 0,
                        child: DoorLock(
                          isLock: _controller.isHoodLock,
                          press: _controller.updateHoodLock,
                        ),
                      )),
                  Opacity(
                    opacity: _batteryAnimation.value,
                    child: SvgPicture.asset(
                      "assets/icons/Battery.svg",
                      width: constraints.maxWidth * 0.5,
                    ),
                  ),
                  Positioned(
                    top: 50 * (1 - _batteryStatusAnimation.value),
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    child: Opacity(
                        opacity: _batteryStatusAnimation.value,
                        child: BatteryStatus(constraints: constraints)),
                  ),
                  Positioned(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    top: 80 * (1 - _animationTempDetailShow.value),
                    child: Opacity(
                        opacity: _animationTempDetailShow.value,
                        child: TempDetails(controller: _controller)),
                  ),
                  Positioned(
                    right: -200 * (1 - _animationCoolGlow.value),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 200),
                      child: _controller.isCoolSelected
                          ? Image.asset(
                              "assets/images/Cool_glow_2.png",
                              width: 250,
                              key: ValueKey("cool"),
                            )
                          : Image.asset(
                              "assets/images/Hot_glow_4.png",
                              width: 250,
                              key: ValueKey("heat"),
                            ),
                    ),
                  ),
                  if (_controller.isShowTyre) ...tyres(constraints),
                  if (_controller.isShowTyre)
                    TyrePsiTile(
                      constraints: constraints,
                      list: _tyreAnimlist,
                    )
                ],
              );
            },
          )),
        );
      },
    );
  }
}
