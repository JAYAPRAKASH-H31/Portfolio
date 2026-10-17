import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio_01/main.dart';
import 'package:portfolio_01/pages/about_page.dart';
import 'package:portfolio_01/pages/contact_page.dart';
import 'package:portfolio_01/pages/projects_page.dart';
import 'package:portfolio_01/pages/skills_page.dart';
import 'package:portfolio_01/utils/app_theme.dart';

void main() {
  testWidgets('Portfolio loads and displays Jayaprakash developer info on desktop',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('JAYAPRAKASH'), findsWidgets);
    expect(find.text('Hi, I am Jayaprakash H'), findsOneWidget);
    expect(find.text('Flutter & Java Backend Developer'), findsOneWidget);
    expect(find.text('Featured Projects'), findsOneWidget);
  });

  testWidgets('Portfolio renders on mobile screen without overflow',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
    expect(find.text('Hi, I am Jayaprakash H'), findsOneWidget);
  });

  testWidgets('Portfolio renders on tablet screen without overflow',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Hi, I am Jayaprakash H'), findsOneWidget);
  });

  testWidgets('AboutPage renders correctly with blue theme',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: const AboutPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Engineering Passion & Focus'), findsOneWidget);
    expect(find.text('What I Bring to the Table'), findsOneWidget);
  });

  testWidgets('ProjectsPage renders and filters projects',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: const ProjectsPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('All Projects'), findsWidgets);
    expect(find.text('DevMirror'), findsOneWidget);
  });

  testWidgets('SkillsPage renders categorized skills',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: const SkillsPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Technical Expertise'), findsOneWidget);
    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('Java'), findsOneWidget);
  });

  testWidgets('ContactPage renders contact info and message form',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: const ContactPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Let\'s Connect & Collaborate'), findsOneWidget);
    expect(find.text('Contact Information'), findsOneWidget);
    expect(find.text('Send a Message'), findsOneWidget);
  });
}
