import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/data_controller.dart';
import '../utils/utils.dart';
import '../widgets/single_card.dart';
import 'details_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ApiController controller = Get.put(ApiController());
  @override
  void initState() {
    controller.fetchApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                return controller.friendsList.isEmpty
                    ? const Center(
                        child: Text(
                          "Sorry, There is no internet or some error occurs",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: controller.friendsList.length,
                          itemBuilder: (context, index) {
                            var model = controller.friendsList[index];
                            return SizedBox(
                              height: 100,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          DetailsScreen(model: model),
                                    ),
                                  );
                                },
                                child: SingleCard(
                                  name: Utils()
                                      .getFriendsName(model.name!.toJson()),
                                  image: model.picture!.medium!,
                                  country: model.location!.country!,
                                ),
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
