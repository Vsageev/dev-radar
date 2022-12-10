import 'package:dev_radar/pages/landing/landing_page.dart';
import 'package:dev_radar/pages/results/answerer_widget.dart';
import 'package:dev_radar/pages/results/contributor_widget.dart';
import 'package:dev_radar/pages/results/results_cubit.dart';
import 'package:dev_radar/pages/results/results_states.dart';
import 'package:dev_radar/shared/colors.dart';
import 'package:dev_radar/shared/widgets/button.dart';
import 'package:dev_radar/shared/widgets/underline_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ResultType {
  contributors,
  answerers;

  static ResultType fromString(String string) {
    switch (string) {
      case "top contributors":
        return ResultType.contributors;
      case "top answerers":
        return ResultType.answerers;
      default:
        return ResultType.contributors;
    }
  }

  @override
  String toString() {
    switch (this) {
      case ResultType.contributors:
        return "top contributors";
      case ResultType.answerers:
        return "top answerers";
      default:
        return "";
    }
  }
}

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  ResultType screen = ResultType.contributors;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultsCubit, ResultsState>(
      builder: (context, state) {
        if (state is ResultsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ResultsLoaded) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 180,
                      height: 100,
                      child: Center(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LandingPage()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'DR',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600, fontSize: 40, color: CustomColors.accent),
                                ),
                                Icon(Icons.track_changes, size: 40, color: CustomColors.accent),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    Text("${BlocProvider.of<ResultsCubit>(context).communityName} community",
                        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 280),
                    Expanded(
                      child: UnderlineSwitch(
                        options: const ['top contributors', 'top answerers'],
                        onChange: (selected) {
                          setState(() {
                            screen = ResultType.fromString(selected);
                          });
                        },
                        currentOption: screen.toString(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'Leaderboard',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                                    ),
                                    Icon(Icons.expand_more),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    Text(
                                      screen == ResultType.contributors ? 'Sort by:  commits' : 'Sort by:  score',
                                      style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                                    ),
                                    const Icon(Icons.arrow_downward_rounded, size: 20),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(),
                                      ),
                                      child: Center(
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: CustomColors.accent,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      'All period',
                                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox.shrink()),
                          Container(
                            width: 220,
                            padding: const EdgeInsets.all(10),
                            child: Button(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.save_alt, size: 20, color: Colors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'download',
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
                                  ),
                                ],
                              ),
                              onTap: () {
                                BlocProvider.of<ResultsCubit>(context).downloadData(
                                    screen == ResultType.contributors ? state.contriburors : state.answerers);
                              },
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                      const SizedBox(width: 30),
                      screen == ResultType.contributors
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: state.contriburors?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return ContributorWidget(
                                    position: index + 1,
                                    contributor: state.contriburors![index],
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: state.answerers?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return AnswererWidget(
                                    position: index + 1,
                                    item: state.answerers![index],
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
