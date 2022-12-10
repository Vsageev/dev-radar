import 'package:dev_radar/pages/results/results_cubit.dart';
import 'package:dev_radar/pages/results/results_page.dart';
import 'package:dev_radar/shared/colors.dart';
import 'package:dev_radar/shared/widgets/background_balls.dart';
import 'package:dev_radar/shared/widgets/button.dart';
import 'package:dev_radar/shared/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCommunityPage extends StatefulWidget {
  NewCommunityPage({super.key});

  @override
  State<NewCommunityPage> createState() => _NewCommunityPageState();
}

class _NewCommunityPageState extends State<NewCommunityPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController gitController = TextEditingController();
  final TextEditingController stackController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.addListener(() {
      setState(() {});
    });
    gitController.addListener(() {
      setState(() {});
    });
    stackController.addListener(() {
      setState(() {});
    });
  }

  bool get buttonDisabled =>
      nameController.text.isEmpty || (gitController.text.isEmpty && stackController.text.isEmpty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBalls(),
          Padding(
            padding: const EdgeInsets.all(50),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox.shrink()),
                SizedBox(
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Community name',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 300,
                        child: CustomTextForm(hint: 'spring boot', controller: nameController),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: 250,
                        child: nameController.text.isEmpty
                            ? Container(
                                decoration: BoxDecoration(
                                  color: CustomColors.buttonDisabled,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.auto_fix_high,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    Text(
                                      '  Autofill links',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Button(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.auto_fix_high,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    Text(
                                      '  Autofill links',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  gitController.text = 'https://github.com/spring-projects/spring-boot';
                                  stackController.text = 'https://stackoverflow.com/tags/spring-boot';
                                },
                              ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Github repository',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 500,
                        child: CustomTextForm(
                            hint: 'https://github.com/spring-projects/spring-boot', controller: gitController),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '  + add repository',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.accent,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Stackowerflow tag',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 500,
                        child: CustomTextForm(
                            hint: 'https://stackoverflow.com/tags/spring-boot', controller: stackController),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '  + add tag',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: CustomColors.accent,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 150),
                Column(
                  children: [
                    const Expanded(child: SizedBox.shrink()),
                    SizedBox(
                      height: 350,
                      width: 350,
                      child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/devradar-4f27f.appspot.com/o/man.webp?alt=media&token=be4ba5d0-d7fb-4203-ad0d-242d75e12d27'),
                    ),
                    const SizedBox(height: 35),
                    buttonDisabled
                        ? Container(
                            decoration: BoxDecoration(
                              color: CustomColors.buttonDisabled,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 120, right: 105),
                            child: Row(
                              children: const [
                                Text(
                                  'Search',
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ],
                            ),
                          )
                        : Button(
                            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 120, right: 105),
                            child: Row(
                              children: const [
                                Text(
                                  'Search',
                                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return BlocProvider<ResultsCubit>(
                                  create: (context) => ResultsCubit(
                                    communityName: nameController.text,
                                    gitUrl: gitController.text.isNotEmpty ? gitController.text : null,
                                    stackUrl: stackController.text.isNotEmpty ? stackController.text : null,
                                  ),
                                  child: const ResultsPage(),
                                );
                              }));
                            },
                          ),
                    const Expanded(child: SizedBox.shrink()),
                  ],
                ),
                const Expanded(child: SizedBox.shrink()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
