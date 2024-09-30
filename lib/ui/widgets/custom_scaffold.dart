import 'package:flutter/material.dart';
import 'package:task_manager_app/ui/widgets/screen_background.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.drawer,
    this.bottomNavigationBar,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildBody(context),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildBody(BuildContext context) {
    final fixedHeight = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minHeight: fixedHeight.size.height - fixedHeight.viewInsets.bottom,
        ),
        child: body,
      ),
    );
  }
}
