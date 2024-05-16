import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ucommerce_apps/bloc/login/bloc/login_bloc.dart';
import 'package:ucommerce_apps/bloc/product/bloc/product_bloc.dart';
import 'package:ucommerce_apps/bloc/register/bloc/register_bloc.dart';
import 'package:ucommerce_apps/bloc/users/bloc/users_bloc.dart';
import 'package:ucommerce_apps/data/repository/repositories.dart';
import 'package:ucommerce_apps/data/service/data_repository.dart';
import 'package:ucommerce_apps/data/repository/api_repository.dart';
import 'package:ucommerce_apps/presentation/screen/login_screen.dart';
import 'package:ucommerce_apps/presentation/screen/register_screen.dart';
import 'package:ucommerce_apps/presentation/screen/splash_screen.dart';
import 'package:ucommerce_apps/presentation/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserRepository()),
        RepositoryProvider(create: (context) => ApiRepository(dataService: DataService())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => UserBloc(
              RepositoryProvider.of<UserRepository>(context),
            ),
          ),
          BlocProvider(
            create: (BuildContext context) => LoginBloc(
              RepositoryProvider.of<UserRepository>(context),
            ),
          ),
          BlocProvider(
            create: (BuildContext context) => ProductBloc(
              apiRepository: RepositoryProvider.of<ApiRepository>(context),
            )..add(LoadProductEvent()),
          ),
          BlocProvider(
            create: (BuildContext context) => RegisterBloc(
              userRepository: RepositoryProvider.of<UserRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ucommerce Apps',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen(),
          routes: {
            '/login': (context) => const LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/home': (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}




// class MyApp extends StatelessWidget {
//   final DataService dataService;
//   const MyApp({super.key, required this.dataService}) : super();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Bloc Api',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//           useMaterial3: true,
//         ),
//         home: BlocProvider(
//           create: (context) => ProductBloc(
//             apiRepository: ApiRepository(dataService: dataService),
//           )..add(LoadProductEvent()),
//           child: LoginScreen(),
//         ));
//   }
// }



class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
}

Widget buildHeader(BuildContext context) => Material(
      color: Colors.blue.shade700,
      child: InkWell(
        onTap: () {
          // Close Navigation drawer before
          Navigator.pop(context);

          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => const UserPage(),
          // ));
        },
        child: Container(
          color: Colors.blue.shade700,
          padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
          child: const Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                    "https://media.licdn.com/dms/image/D5603AQF6DiSoELIvUw/profile-displayphoto-shrink_800_800/0/1682754123265?e=1719446400&v=beta&t=f8YWFSDw94rRuUAUg_iLhlHZduxvJXMcMexTpYN2104"),
              ),
              SizedBox(height: 12),
              Text(
                'Idham',
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              Text(
                'idhamtamvanz123@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );

Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            // onTap: () =>
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (context) => const HomePage(),
            // )),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: const Text('Product'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const StudentPage(),
              // ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.category_outlined),
            title: const Text('Category'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const ClassPage(),
              // ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits_outlined),
            title: const Text('Cart'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const FavouritesPage(),
              // ));
            },
          ),
          const Divider(color: Colors.black),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
                 // close navigation drawer before
              Navigator.pop(context);

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const SettingsPage(),
              // ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notification'),
            onTap: () {
              // close navigation drawer before
              Navigator.pop(context);

              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => const NotificationPage(),
              // ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );

