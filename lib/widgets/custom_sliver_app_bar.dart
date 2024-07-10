import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.sliverAppBarTitle,
    required this.child,
    this.actions,
    required this.flexibleSpaceBarTitle,
  });

  final Widget sliverAppBarTitle;
  final Widget child;
  final List<Widget>? actions;
  final Widget flexibleSpaceBarTitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: sliverAppBarTitle,
      pinned: true,
      floating: false,
      // the highest height that the appbar can expand to it
      expandedHeight: 340,
      // the lowest height that the appbar can expand to it
      collapsedHeight: 120,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(
            bottom: 50.0,
          ),
          child: child,
        ),
        title: flexibleSpaceBarTitle,
        centerTitle: true,
        expandedTitleScale: 1.0,
        titlePadding: const EdgeInsets.only(
          top: 0,
          left: 0,
          right: 0,
        ),
      ),
      actions: actions,
    );
  }
}
