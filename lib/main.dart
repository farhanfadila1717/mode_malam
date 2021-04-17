import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import './theme_cubit.dart';
import './theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ////Inisialisasi path/lokasi penyimpanan HydratedBloc/Cubit Storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) => MaterialApp(
          title: 'Mode gelap dan terang',
          //// Insialisasi Mode Terang & Gelap yang telah di buat pada file theme.dart
          theme: lightTheme(context),
          darkTheme: darkTheme(context),
          themeMode: themeMode,
          home: MyHomePage(title: 'Mode gelap dan terang'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dark Mode',
              style: Theme.of(context).textTheme.button,
            ),
            const SizedBox(
              width: 30,
            ),
            BlocBuilder<ThemeCubit, ThemeMode>(
              builder: (context, themeMode) => CupertinoSwitch(
                value: themeMode == ThemeMode.dark,
                onChanged: (value) {
                  //// Mengubah mode terang ke gelap atau sebaliknya
                  BlocProvider.of<ThemeCubit>(context).changeThame();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
