import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("AURA-Gold"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.workspace_premium_rounded,
              size: 80,
              color: theme.colorScheme.primary,
            ),

            const SizedBox(height: 20),

            Text(
              "AURA-Gold",
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Gold Authentication Suite",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),

            const SizedBox(height: 40),

            _DashboardCard(
              icon: Icons.add_circle_outline,
              title: "Register Asset",
              subtitle: "Register a new ornament for verification",
              onTap: () => context.push("/assets"),
            ),

            const SizedBox(height: 16),

            _DashboardCard(
              icon: Icons.history,
              title: "Audit Log",
              subtitle: "View previous verification history",
              onTap: () => context.push("/audit-log"),
            ),

            const SizedBox(height: 16),

            _DashboardCard(
              icon: Icons.settings,
              title: "Settings",
              subtitle: "Application configuration",
              onTap: () => context.push("/settings"),
            ),

            const Spacer(),

            Center(
              child: Text(
                "Ready",
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}