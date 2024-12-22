import 'package:flutter/widgets.dart';

class AdaptiveWidget extends StatelessWidget {
  final Widget small;
  final Widget medium;
  final Widget large;

  const AdaptiveWidget({
    super.key,
    required this.small,
    required this.medium,
    required this.large,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return small;
        } else if (constraints.maxWidth < 1000) {
          return medium;
        } else {
          return large;
        }
      },
    );
  }
}
