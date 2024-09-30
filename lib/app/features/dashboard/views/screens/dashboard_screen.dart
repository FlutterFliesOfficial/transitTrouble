library dashboard;

import 'dart:developer';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hell_o/app/constans/app_constants.dart';
import 'package:hell_o/app/features/dashboard/views/components/line_chart.dart';
import 'package:hell_o/app/shared_components/chatting_card.dart';
import 'package:hell_o/app/shared_components/get_premium_card.dart';
import 'package:hell_o/app/shared_components/list_profil_image.dart';
import 'package:hell_o/app/shared_components/project_card.dart';
import 'package:hell_o/app/shared_components/responsive_builder.dart';
import 'package:hell_o/app/shared_components/search_field.dart';
import 'package:hell_o/app/shared_components/selection_button.dart';
import 'package:hell_o/app/shared_components/task_card.dart';
import 'package:hell_o/app/shared_components/today_text.dart';
import 'package:hell_o/app/shared_components/upgrade_premium_card.dart';
import 'package:hell_o/app/utils/helpers/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:mapbox_gl/mapbox_gl.dart';

// binding
part '../../bindings/dashboard_binding.dart';

// controller
part '../../controllers/dashboard_controller.dart';

// models
part '../../models/profile.dart';

// component
part '../components/active_project_card.dart';
part '../components/header.dart';
part '../components/overview_header.dart';
part '../components/profile_tile.dart';
part '../components/recent_messages.dart';
part '../components/sidebar.dart';
part '../components/team_member.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: (ResponsiveBuilder.isDesktop(context))
          ? null
          : Drawer(
              child: Padding(
                padding: const EdgeInsets.only(top: kSpacing),
                child: _Sidebar(data: controller.getSelectedProject()),
              ),
            ),
      body: SingleChildScrollView(
          child: ResponsiveBuilder(
        mobileBuilder: (context, constraints) {
          return Column(children: [
            ViewLineChart(),
            const SizedBox(height: kSpacing * (kIsWeb ? 1 : 2)),
            _buildHeader(onPressedMenu: () => controller.openDrawer()),
            const SizedBox(height: kSpacing / 2),
            const Divider(),
            _buildProfile(data: controller.getProfil()),
            const SizedBox(height: kSpacing),

            // Add the map here
            // _buildMap(),

            const SizedBox(height: kSpacing),
            _buildTeamMember(data: controller.getMember()),
            const SizedBox(height: kSpacing),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpacing),
              child: GetPremiumCard(onPressed: () {}),
            ),
            const SizedBox(height: kSpacing * 2),
            _buildTaskOverview(
              data: controller.getAllTavsk(),
              headerAxis: Axis.vertical,
              crossAxisCount: 6,
              crossAxisCellCount: 3,
            ),
            const SizedBox(height: kSpacing * 2),
            _buildRecentMessages(data: controller.getChatting()),
          ]);
        },
        tabletBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 4,
                child: Column(
                  children: [
                    const SizedBox(height: kSpacing * (kIsWeb ? 0.5 : 1.5)),
                    _buildProfile(data: controller.getProfil()),
                    const Divider(thickness: 1),
                    const SizedBox(height: kSpacing),

                    // Add the map here
                    // _buildMap(),

                    _buildTeamMember(data: controller.getMember()),
                    const SizedBox(height: kSpacing),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                      child: GetPremiumCard(onPressed: () {}),
                    ),
                    const SizedBox(height: kSpacing),
                    const Divider(thickness: 1),
                    const SizedBox(height: kSpacing),
                    _buildRecentMessages(data: controller.getChatting()),
                  ],
                ),
              )
            ],
          );
        },
        desktopBuilder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: (constraints.maxWidth < 1360) ? 4 : 3,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(kBorderRadius),
                      bottomRight: Radius.circular(kBorderRadius),
                    ),
                    child: _Sidebar(data: controller.getSelectedProject())),
              ),
              Flexible(
                flex: 9,
                child: Column(
                  children: [
                    const SizedBox(height: kSpacing),
                    _buildHeader(),
                    const SizedBox(height: kSpacing * 2),
                    _buildTaskOverview(
                      data: controller.getAllTavsk(),
                      crossAxisCount: 6,
                      crossAxisCellCount: (constraints.maxWidth < 1360) ? 3 : 2,
                    ),
                    const SizedBox(height: kSpacing * 2),

                    // Add the map here
                    _buildMap(),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Column(
                  children: [
                    const SizedBox(height: kSpacing / 2),
                    _buildProfile(data: controller.getProfil()),
                    const Divider(thickness: 1),
                    const SizedBox(height: kSpacing),
                    _buildTeamMember(data: controller.getMember()),
                    const SizedBox(height: kSpacing),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
                      child: GetPremiumCard(onPressed: () {}),
                    ),
                    const SizedBox(height: kSpacing),
                    const Divider(thickness: 1),
                    const SizedBox(height: kSpacing),
                    _buildRecentMessages(data: controller.getChatting()),
                  ],
                ),
              )
            ],
          );
        },
      )),
    );
  }

  // Build the Mapbox map widget
  Widget _buildMap() {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(10),
      child: MapboxMap(
        accessToken:
            'pk.eyJ1IjoidGFuaXNocWJhZ3VsIiwiYSI6ImNtMXA2cWZiMzAxMjAyaXNqaWg5Y3BtNGQifQ.j5MxIrtA44LsjBXPbdvj_Q',
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Starting coordinates
          zoom: 12, // Starting zoom level
        ),
        onMapCreated: (MapboxMapController? controller) {
          if (controller != null) {
            // Add multiple markers to the map
            _addMarkers(controller);
          } else {
            print('Error: Mapbox controller is null.');
          }
        },
      ),
    );
  }

  Widget _buildHeader({Function()? onPressedMenu}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Row(
        children: [
          if (onPressedMenu != null)
            Padding(
              padding: const EdgeInsets.only(right: kSpacing),
              child: IconButton(
                onPressed: onPressedMenu,
                icon: const Icon(EvaIcons.menu),
                tooltip: "menu",
              ),
            ),
          const Expanded(child: _Header()),
        ],
      ),
    );
  }

  Widget _buildTaskOverview({
    required List<TaskCardData> data,
    int crossAxisCount = 6,
    int crossAxisCellCount = 2,
    Axis headerAxis = Axis.horizontal,
  }) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: crossAxisCount,
      itemCount: data.length + 1,
      addAutomaticKeepAlives: false,
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return (index == 0)
            ? Padding(
                padding: const EdgeInsets.only(bottom: kSpacing),
                child: _OverviewHeader(
                  axis: headerAxis,
                  onSelected: (task) {},
                ),
              )
            : TaskCard(
                data: data[index - 1],
                onPressedMore: () {},
                onPressedTask: () {},
                onPressedContributors: () {},
                onPressedComments: () {},
              );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.fit((index == 0) ? crossAxisCount : crossAxisCellCount),
    );
  }

  Widget _buildProfile({required _Profile data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: _ProfilTile(
        data: data,
        onPressedNotification: () {},
      ),
    );
  }

  Widget _buildTeamMember({required List<ImageProvider> data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TeamMember(
            totalMember: data.length,
            onPressedAdd: () {},
          ),
          const SizedBox(height: kSpacing / 2),
          ListProfilImage(maxImages: 6, images: data),
        ],
      ),
    );
  }

  Widget _buildRecentMessages({required List<ChattingCardData> data}) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: TodayText(onPressed: () {}),
      ),
      const SizedBox(height: kSpacing),
      StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: data.length,
        addAutomaticKeepAlives: false,
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ChattingCard(
            data: data[index],
            onPressed: () {},
          );
        },
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(3),
      )
    ]);
  }

  void _addMarkers(MapboxMapController controller) {
    // Define locations and labels for the markers
    final List<Map<String, dynamic>> locations = [
      {'position': LatLng(37.7749, -122.4194), 'label': 'San Francisco'},
      {'position': LatLng(34.0522, -118.2437), 'label': 'Los Angeles'},
      {'position': LatLng(40.7128, -74.0060), 'label': 'New York'},
      {'position': LatLng(41.8781, -87.6298), 'label': 'Chicago'},
      {'position': LatLng(29.7604, -95.3698), 'label': 'Houston'},
    ];

    // Iterate over the locations and add markers with labels
    for (var location in locations) {
      final symbolOptions = SymbolOptions(
        geometry: location['position'],
        iconImage: "marker-15", // Use Mapbox's built-in marker icon
        iconSize: 1.5, // Adjust the size of the icon
        textField: location['label'], // Display the label
        textSize: 12.0, // Adjust the label size
        textOffset:
            const Offset(0, 1.5), // Adjust text position relative to the marker
        textColor: '#000000', // Text color (black)
      );

      // Add the marker to the map with a label
      try {
        controller.addSymbol(symbolOptions);
      } catch (e) {
        print('Error adding marker: $e');
      }
    }
  }
}
