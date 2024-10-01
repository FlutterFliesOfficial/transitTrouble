part of dashboard;
// Import for Mapbox

class DashboardController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController? mapController;
  // Add MapboxMapController

  // Mapbox token
  final String mapboxAccessToken =
      'pk.eyJ1IjoidGFuaXNocWJhZ3VsIiwiYSI6ImNtMXA2cWZiMzAxMjAyaXNqaWg5Y3BtNGQifQ.j5MxIrtA44LsjBXPbdvj_Q'; // Replace with your Mapbox access token

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  // Method to open the drawer
  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  // Method to build the Mapbox widget
  // Google Maps widget method

  // Data retrieval methods remain the same
  _Profile getProfil() {
    return const _Profile(
      photo: AssetImage(ImageRasterPath.avatar1),
      name: "Tanish",
      email: "tanishbagul@gmail.com",
    );
  }

  List<TaskCard> getTaskCards(BuildContext context) {
    final taskDataList = getAllTavsk();

    return taskDataList.map((taskData) {
      return TaskCard(
        data: taskData,
        onPressedMore: () {
          print("More button pressed for ${taskData.title}");
        },
        onPressedTask: () {
          print("Task button pressed for ${taskData.title}");
        },
        onPressedContributors: () {
          print("Contributors button pressed for ${taskData.title}");
        },
        onPressedComments: () {
          print("Comments button pressed for ${taskData.title}");
        },
      );
    }).toList();
  }

  List<TaskCardData> getAllTavsk() {
    return [
      const TaskCardData(
        title: "road ways",
        totalComments: 50,
        type: TaskType.chicken,
        totalContributors: 40,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar1),
          AssetImage(ImageRasterPath.avatar2),
          AssetImage(ImageRasterPath.avatar3),
          AssetImage(ImageRasterPath.avatar4),
        ],
      ),
      const TaskCardData(
        title: "Bridges",
        totalComments: 50,
        totalContributors: 34,
        type: TaskType.inProgress,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar5),
          AssetImage(ImageRasterPath.avatar6),
          AssetImage(ImageRasterPath.avatar7),
          AssetImage(ImageRasterPath.avatar8),
        ],
      ),
      const TaskCardData(
        title: "transits",
        totalComments: 50,
        totalContributors: 34,
        type: TaskType.done,
        profilContributors: [
          AssetImage(ImageRasterPath.avatar5),
          AssetImage(ImageRasterPath.avatar3),
          AssetImage(ImageRasterPath.avatar4),
          AssetImage(ImageRasterPath.avatar2),
        ],
      ),
    ];
  }

  ProjectCardData getSelectedProject() {
    return ProjectCardData(
      percent: .3,
      projectImage: const AssetImage(ImageRasterPath.logo1),
      projectName: "SystemSync",
      releaseTime: DateTime.now(),
    );
  }

  List<ImageProvider> getMember() {
    return const [
      AssetImage(ImageRasterPath.avatar1),
      AssetImage(ImageRasterPath.avatar2),
      AssetImage(ImageRasterPath.avatar3),
      AssetImage(ImageRasterPath.avatar4),
      AssetImage(ImageRasterPath.avatar5),
      AssetImage(ImageRasterPath.avatar6),
    ];
  }

  List<ChattingCardData> getChatting() {
    return const [
      ChattingCardData(
        image: AssetImage(ImageRasterPath.avatar6),
        isOnline: true,
        name: "Samantha",
        lastMessage: "i added my new tasks",
        isRead: false,
        totalUnread: 100,
      ),
      ChattingCardData(
        image: AssetImage(ImageRasterPath.avatar3),
        isOnline: false,
        name: "John",
        lastMessage: "well done john",
        isRead: true,
        totalUnread: 0,
      ),
      ChattingCardData(
        image: AssetImage(ImageRasterPath.avatar4),
        isOnline: true,
        name: "Alexander Purwoto",
        lastMessage: "we'll have a meeting at 9AM",
        isRead: false,
        totalUnread: 1,
      ),
    ];
  }
}
