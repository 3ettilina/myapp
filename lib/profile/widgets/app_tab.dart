import 'package:flutter/material.dart';
import 'package:myapp/core/extensions/extensions.dart';
import 'package:myapp/profile/widgets/profile_header.dart';

class AppTab extends StatefulWidget {
  const AppTab({
    required this.options,
    required this.onTabChanged,
    super.key,
  }) : assert(options.length <= 3, 'Options shouldn\'t be more than 3');

  final Set<String> options;
  final void Function(String) onTabChanged;

  @override
  State<AppTab> createState() => _AppTabState();
}

class _AppTabState extends State<AppTab> {
  late String selectedTab;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.options.first;
  }

  void onTabChanged(String option) {
    setState(() {
      selectedTab = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ColoredBox(
        color: const Color.fromRGBO(246, 246, 246, 1),
        child: Row(
          children: widget.options
              .map((opt) => _AnimatedTabButton(
                    label: opt,
                    onTap: onTabChanged,
                    isSelected: opt == selectedTab,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _AnimatedTabButton extends StatelessWidget {
  const _AnimatedTabButton({
    required this.label,
    required this.onTap,
    this.isSelected = false,
  });

  final String label;
  final bool isSelected;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final selectedColor = context.theme.primaryColor;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(label),
        child: AnimatedContainer(
          duration: Durations.short4,
          padding: const EdgeInsets.symmetric(vertical: 4),
          curve: Curves.easeInOutQuad,
          decoration: BoxDecoration(
              color: isSelected ? selectedColor : Colors.transparent,
              borderRadius: BorderRadius.circular(40)),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black38,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
