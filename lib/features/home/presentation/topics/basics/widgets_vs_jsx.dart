import 'package:flutter/material.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/basics/topic_1/comparison_view_section.dart';
import 'package:fundamentos_flutter/features/home/presentation/widgets/basics/topic_1/interactive_demo_section.dart';

class WidgetsVsJsx extends StatefulWidget {
  const WidgetsVsJsx({super.key});

  @override
  State<WidgetsVsJsx> createState() => _WidgetsVsJsxState();
}

class _WidgetsVsJsxState extends State<WidgetsVsJsx>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        // TabBar para alternar entre Teoría/Comparación y Demo Interactiva
        TabBar(
          controller: _tabController,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurfaceVariant,
          indicatorColor: colorScheme.primary,
          tabs: const [
            Tab(icon: Icon(Icons.compare_arrows), text: '(RN vs Flutter)'),
            Tab(icon: Icon(Icons.touch_app), text: 'Composición Interactiva'),
          ],
        ),

        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              // Vista 1: Comparativa
              ComparisonViewSection(),

              // Vista 2: Demo de Composición de Widgets
              InteractiveDemoSection(),
            ],
          ),
        ),
      ],
    );
  }
}