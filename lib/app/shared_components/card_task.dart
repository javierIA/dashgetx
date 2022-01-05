import 'package:dashgetx/app/features/dashboard/controllers/temp_controller.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dashgetx/app/utils/helpers/app_helpers.dart';

class CardTaskData {
  final String label;
  final String jobDesk;
  final DateTime dueDate;
  final int id;

  const CardTaskData(
      {required this.label,
      required this.jobDesk,
      required this.dueDate,
      required this.id});
}

class CardTask extends StatelessWidget {
  const CardTask({
    required this.data,
    required this.primary,
    required this.onPrimary,
    Key? key,
  }) : super(key: key);

  final CardTaskData data;
  final Color primary;
  final Color onPrimary;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 350,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primary, primary.withOpacity(.7)],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: _BackgroundDecoration(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildLabel(),
                          Row(
                            children: [
                              Column(
                                children: [
                                  _buttonUp(),
                                  const SizedBox(height: 10),
                                  _buttonDown(),
                                ],
                              ),
                              const SizedBox(width: 40),
                              _buildLCD(),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDate(),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            thickness: 1,
                            color: onPrimary,
                          ),
                        ),
                        _buildHours(),
                      ],
                    ),
                    const Spacer(flex: 2),
                    Row(
                      children: [
                        _setButton(),
                        const SizedBox(width: 15),
                        _modeButton(),
                        const SizedBox(width: 15),
                        _holdButton()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void createController() {
    Get.put(TempController(), tag: data.id.toString());
  }

  TempController tempController() {
    TempController tempController =
        Get.find<TempController>(tag: data.id.toString());

    return tempController;
  }

  Widget _buildLabel() {
    createController();

    return Text(
      data.label,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: onPrimary,
        letterSpacing: 1,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildLCD() {
    return Container(
      decoration: BoxDecoration(
        color: onPrimary.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GetBuilder<TempController>(
        tag: data.id.toString(),
        builder: (controller) {
          return Text(
            '${controller.tempModel.value.temp} C',
            style: TextStyle(
              color: onPrimary,
              fontSize: 70,
              letterSpacing: 1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          );
        },
      ),
    );
  }

  Widget _buildDate() {
    return _IconLabel(
      color: onPrimary,
      iconData: EvaIcons.calendarOutline,
      label: DateFormat('d MMM').format(data.dueDate),
    );
  }

  Widget _buttonUp() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 1),
          Ink(
            child: IconButton(
              icon: const Icon(EvaIcons.arrowUp),
              color: Colors.white,
              iconSize: 35,
              splashRadius: 10,
              disabledColor: Colors.grey,
              onPressed: () {
                tempController().updateTemp("+");
              },
              tooltip: "UP",
            ),
            decoration: const ShapeDecoration(
                color: Colors.grey, shape: CircleBorder()),
          )
        ]);
  }

  Widget _buttonDown() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(height: 1),
          Ink(
            child: IconButton(
              icon: const Icon(EvaIcons.arrowDown),
              color: Colors.white,
              iconSize: 35,
              splashRadius: 10,
              disabledColor: Colors.grey,
              onPressed: () {
                tempController().updateTemp("-");
              },
              tooltip: "UP",
            ),
            decoration: const ShapeDecoration(
                color: Colors.grey, shape: CircleBorder()),
          )
        ]);
  }

  Widget _buildHours() {
    return _IconLabel(
      color: onPrimary,
      iconData: EvaIcons.clockOutline,
      label: data.dueDate.dueDate(),
    );
  }

  Widget _setButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: onPrimary,
        onPrimary: primary,
      ),
      icon: const Icon(EvaIcons.checkmarkCircle2Outline),
      label: const Text("Set"),
    );
  }

  Widget _holdButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: onPrimary,
        onPrimary: primary,
      ),
      icon: const Icon(EvaIcons.stopCircleOutline),
      label: const Text("Hold"),
    );
  }

  Widget _modeButton() {
    return ElevatedButton.icon(
        onPressed: () {
          Get.find<TempController>(tag: data.id.toString()).updateMode();
        },
        style: ElevatedButton.styleFrom(
          primary: onPrimary,
          onPrimary: primary,
        ),
        icon: const Icon(EvaIcons.repeat),
        label: GetBuilder<TempController>(
          tag: data.id.toString(),
          builder: (controller) {
            return Text(
              controller.tempModel.value.mode.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            );
          },
        ));
  }
}

class _IconLabel extends StatelessWidget {
  const _IconLabel({
    required this.color,
    required this.iconData,
    required this.label,
    Key? key,
  }) : super(key: key);

  final Color color;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: color,
          size: 18,
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color.withOpacity(.8),
          ),
        )
      ],
    );
  }
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration({required this.child, Key? key})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Transform.translate(
            offset: const Offset(25, -25),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white.withOpacity(.1),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Transform.translate(
            offset: const Offset(-70, 70),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white.withOpacity(.1),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
