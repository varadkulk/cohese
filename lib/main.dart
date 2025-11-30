// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:macos_ui/macos_ui.dart';

Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig(
    toolbarStyle: NSWindowToolbarStyle.unified,
  );
  await config.apply();
}

void main() async {
  await _configureMacosWindowUtils();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      themeMode: ThemeMode.system,
      //   theme: themeData(context),
      home: PlatformMenuBar(
        menus: const [
          PlatformMenu(
            label: '',
            menus: [
              PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.about,
              ),
              PlatformProvidedMenuItem(type: PlatformProvidedMenuItemType.quit),
            ],
          ),
          PlatformMenu(
            label: 'View',
            menus: [
              PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.toggleFullScreen,
              ),
            ],
          ),
          PlatformMenu(
            label: 'Window',
            menus: [
              PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.minimizeWindow,
              ),
              PlatformProvidedMenuItem(
                type: PlatformProvidedMenuItemType.zoomWindow,
              ),
            ],
          ),
        ],
        child: MacosWindow(
          sidebar: Sidebar(
            builder: (context, scrollController) {
              return SidebarItems(
                items: const [],
                currentIndex: 0,
                onChanged: (index) {},
              );
            },
            minWidth: 200,
          ),
          // appBar: AppBar(title: Text('My App')),
          // body: Center(child: Text('Hello World!')),
        ),
      ),
    );
  }
}
