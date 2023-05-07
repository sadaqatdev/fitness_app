import 'package:fitness_app/features/authentication/presentation/providers/auth_state.dart';
import 'package:fitness_app/features/dashboard/presentation/provider/providers.dart';
import 'package:fitness_app/shared/extentions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({super.key});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  void initState() {
    ref.read(dashboardStateProvider.notifier).getPermissionForActivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lableStyle = context.getTextStyle().copyWith(
        fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600);

    var dashboardState = ref.watch(dashboardStateProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Your Steps Count",
            style: context
                .getTextStyle()
                .copyWith(fontSize: 18, color: Colors.white)),
        centerTitle: true,
      ),
      body: SizedBox(
        height: context.getScreenSize().height,
        width: context.getScreenSize().width,
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (dashboardState.screenState == ScreenState.loading ||
                  dashboardState.screenState == ScreenState.init)
                const Center(child: CircularProgressIndicator())
              else if (dashboardState.screenState == ScreenState.error) ...[
                const Text("No data fetch please try again"),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  onPressed: () {
                    ref
                        .read(dashboardStateProvider.notifier)
                        .getPermissionForActivity();
                  },
                  child: const Text("Try again"),
                )
              ] else ...[
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today Steps:",
                      style: lableStyle,
                    ),
                    Text(
                      dashboardState.todaySteps.toString(),
                      style: lableStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Weekly Steps:",
                      style: lableStyle,
                    ),
                    Text(
                      dashboardState.todaySteps.toString(),
                      style: lableStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Monthly Steps:",
                      style: lableStyle,
                    ),
                    Text(
                      dashboardState.todaySteps.toString(),
                      style: lableStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Yearly Steps:",
                      style: lableStyle,
                    ),
                    Text(
                      dashboardState.todaySteps.toString(),
                      style: lableStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
