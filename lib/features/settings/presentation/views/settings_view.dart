import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../controllers/settings_controller.dart';

/// View for Settings feature.
class SettingsView extends ConsumerWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: ResponsiveLayout(
        mobile: _buildContent(context, ref, state, theme, isMobile: true),
        desktop: _buildContent(context, ref, state, theme, isMobile: false),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    SettingsState state,
    ThemeData theme, {
    required bool isMobile,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.offline_pin,
              size: isMobile ? 64 : 128,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: 24),
            Text(
              'Settings Module Scaffold',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Completely offline • clean architecture scaffold',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => ref.read(settingsProvider.notifier).loadData(),
              child: const Text('Simulate Load Offline Data'),
            ),
            if (state.isLoading) ...[
              const SizedBox(height: 24),
              const CircularProgressIndicator(),
            ] else if (state.data != null) ...[
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Loaded offline record: ${state.data!.id}'),
                ),
              ),
            ],
            const SizedBox(height: 24),
            TextButton(
              onPressed: () => context.push('/'),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
