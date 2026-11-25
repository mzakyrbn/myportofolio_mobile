import 'package:flutter/material.dart';
import 'package:myportfolio_mobile/screens/education_form.dart';
import 'package:myportfolio_mobile/screens/menu.dart';
import 'package:myportfolio_mobile/screens/project_form.dart';
import 'package:myportfolio_mobile/screens/login_screen.dart';
import 'package:myportfolio_mobile/services/auth_state.dart';
import 'package:myportfolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthState>().isLoggedIn;

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Portfolio',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore personal projects and experiences!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Home
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),

          // Add Project (requires authentication)
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add Project'),
            onTap: () async {
              final loggedIn = await ensureLoggedIn(context);

              if (!context.mounted || !loggedIn) return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectFormPage(),
                ),
              );
            },
          ),

          // Add Education (requires authentication)
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add Education'),
            onTap: () async {
              final loggedIn = await ensureLoggedIn(context);

              if (!context.mounted || !loggedIn) return;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => EducationFormPage(),
                ),
              );
            },
          ),

          // Login (only visible when logged out)
          if (!isLoggedIn)
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () async {
                final loggedIn = await Navigator.push<bool>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );

                if (!context.mounted) return;

                if (loggedIn == true) {
                  Navigator.pop(context);
                }
              },
            ),

          // Logout (only visible when logged in)
          if (isLoggedIn)
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await context.read<AuthState>().logout();
              },
            ),
        ],
      ),
    );
  }
}