import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myportfolio_mobile/screens/menu.dart';
import 'package:myportfolio_mobile/services/auth_state.dart';
import 'package:myportfolio_mobile/widgets/auth_guard.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          // Handle Logout card
          if (item.name == 'Logout') {
            try {
              await context.read<AuthState>().logout();

              if (!context.mounted) return;

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text('Successfully logged out.'),
                  ),
                );
            } catch (e) {
              if (!context.mounted) return;

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('Logout failed: $e'),
                  ),
                );
            }

            return;
          }

          // Handle Add Achievement card
          if (item.name == 'Add Achievement') {
            final loggedIn = await ensureLoggedIn(context);

            if (!context.mounted || !loggedIn) return;
          }

          // Handle normal navigation
          if (item.destination != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => item.destination!,
              ),
            );
          } else {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    'Kamu telah menekan tombol ${item.name}!',
                  ),
                ),
              );
          }
        },

        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(3),
                ),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}