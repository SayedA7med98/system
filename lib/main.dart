import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system/features/home_layout/cubit/home_cubit.dart';
import 'package:window_manager/window_manager.dart';
import 'features/home_layout/home_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  final screenSize = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
  final double screenWidth = screenSize.width;
  final double screenHeight = screenSize.height;

  WindowOptions windowOptions = WindowOptions(
    minimumSize: Size(screenWidth, screenHeight),
    size: Size(screenWidth, screenHeight), // Set to full screen size
    center: true,
    title: 'System',
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeLayOut(),
      ),
    );
  }
}