part of dashboard;

class DashboardController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();

  final dataProfil = const UserProfileData(
    image: AssetImage(ImageRasterPath.man),
    name: "Javier Flores",
    jobDesk: "Developers",
  );

  final member = ["Test Joe", "Test Greg"];

  final dataTask = const TaskProgressData(totalTask: 2, totalCompleted: 1);

  final taskInProgress = [
    CardTaskData(
        label: "Kitchen",
        jobDesk: "20 C",
        dueDate: DateTime.now().add(const Duration(days: 2)),
        id: 1),
    CardTaskData(
        label: "Living room",
        jobDesk: "20 C",
        dueDate: DateTime.now().add(const Duration(minutes: 50)),
        id: 2)
  ];

  final weeklyTask = [
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.image, color: Colors.blueGrey),
      label: "Kitchen",
      jobDesk: "Javier Flores",
      assignTo: "X D",
      editDate: DateTime.now().add(-const Duration(hours: 2)),
    ),
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.tv, color: Colors.amber),
      label: "Living room",
      jobDesk: "Javier Flores",
      assignTo: "X D",
      editDate: DateTime.now().add(-const Duration(days: 50)),
    ),
  ];

  final taskGroup = [
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 2, hours: 10)),
        label: "Auto",
        jobdesk: "20 C",
        name: "LivingRoom",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 2, hours: 11)),
        label: "Manual",
        jobdesk: "19 c",
        name: "Kitchen",
      ),
    ],
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 4, hours: 5)),
        label: "Auto",
        jobdesk: "20 C",
        name: "LivingRoom",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 4, hours: 6)),
        label: "Manual",
        jobdesk: "18 C",
        name: "Kitchen",
      ),
    ],
  ];

  void onPressedProfil() {
    print("onPressedProfil");
  }

  void onSelectedMainMenu(int index, SelectionButtonData value) {
    print("index: $index, value: $value");
  }

  void onSelectedTaskMenu(int index, String label) {
    print("index: $index, label: $label");
  }

  void searchTask(String value) {
    print("searchTask: $value");
  }

  void onPressedTask(int index, ListTaskAssignedData data) {
    print("index: $index, data: $data");
  }

  void onPressedAssignTask(int index, ListTaskAssignedData data) {
    print("index: $index, data: $data");
  }

  void onPressedMemberTask(int index, ListTaskAssignedData data) {}
  void onPressedCalendar() {
    print("onPressedCalendar");
  }

  void onPressedTaskGroup(int index, ListTaskDateData data) {
    print("index: $index, data: $data");
  }

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }
}
