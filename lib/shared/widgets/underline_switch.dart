import 'package:dev_radar/shared/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnderlineSwitch extends StatelessWidget {
  final List<String> options;
  final Function(String) onChange;
  final String currentOption;

  const UnderlineSwitch({Key? key, required this.options, required this.onChange, required this.currentOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > options.length * 150
        ? Row(
            children: options
                .map(
                  (e) => Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        onChange(e);
                      },
                      child: Column(
                        children: [
                          Text(
                            e,
                            style: const TextStyle(color: CustomColors.text, fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Container(height: 5),
                          Container(
                            height: 4,
                            color: e == currentOption ? CustomColors.accent : CustomColors.backgroundAccent,
                          )
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: options
                  .map(
                    (e) => SizedBox(
                      width: 150,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          onChange(e);
                        },
                        child: Column(
                          children: [
                            Text(
                              e,
                              style:
                                  const TextStyle(color: CustomColors.text, fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            Container(height: 5),
                            Container(
                              height: 4,
                              color: e == currentOption ? CustomColors.accent : CustomColors.backgroundAccent,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
