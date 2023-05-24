import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_fin/data/services/google_auth_service.dart';
// import 'package:money_fin/data/services/firestore_user_service.dart';
// import 'package:money_fin/data/services/google_auth_service.dart';
import 'package:money_fin/presentation/pages/category_add.dart';
import 'package:money_fin/presentation/pages/category_default.dart';
import 'package:money_fin/presentation/pages/setting_page.dart';

import '../../domain/entities/pengguna.dart';

// import '../../domain/entities/pengguna.dart';

class MainPage extends StatelessWidget {
  final String title;
  const MainPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.power_settings_new))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Setting"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()));
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // FutureBuilder<Pengguna?>(
            //   future: Pengguna.getPengguna('jerryhalim@gmail.com'),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       Pengguna? pengguna = snapshot.data;
            //       return Text(pengguna!.tabungan);
            //     } else if (snapshot.hasError) {
            //       return const Text("error get tabungan");
            //     } else {
            //       return Container();
            //     }
            //   },
            // ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategoryDefaultPage()));
                },
                child: const Text("Category"))
          ],
        ),
      ),
    );
  }
}
