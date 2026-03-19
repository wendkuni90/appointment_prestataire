import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/utils/router.dart';
import '../core/utils/theme.dart';

class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final loc = GoRouterState.of(context).matchedLocation;
    if (loc.startsWith(AppRoutes.home))     return 0;
    if (loc.startsWith(AppRoutes.agenda))   return 1;
    if (loc.startsWith(AppRoutes.services)) return 2;
    if (loc.startsWith(AppRoutes.profile))  return 3;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final idx = _currentIndex(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: BottomNavigationBar(
          currentIndex: idx,
          onTap: (i) {
            switch (i) {
              case 0: context.go(AppRoutes.home);     break;
              case 1: context.go(AppRoutes.agenda);   break;
              case 2: context.go(AppRoutes.services); break;
              case 3: context.go(AppRoutes.profile);  break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Tableau de bord',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              activeIcon: Icon(Icons.calendar_today_rounded),
              label: 'Agenda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.design_services_outlined),
              activeIcon: Icon(Icons.design_services_rounded),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
