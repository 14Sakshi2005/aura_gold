import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/audit_log_controller.dart';

class AuditLogView extends ConsumerWidget {
  const AuditLogView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(auditLogControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Audit Log"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(auditLogControllerProvider.notifier).loadLogs();
            },
          ),
        ],
      ),
      body: Builder(
        builder: (_) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.errorMessage != null) {
            return Center(
              child: Text(state.errorMessage!),
            );
          }

          if (state.logs.isEmpty) {
            return const Center(
              child: Text(
                "No audit logs available.",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.logs.length,
            itemBuilder: (context, index) {
              final log = state.logs[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.amber.shade100,
                    child: Icon(
                      _iconForAction(log.action),
                      color: Colors.amber.shade900,
                    ),
                  ),
                  title: Text(log.action),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(log.details),
                      const SizedBox(height: 4),
                      Text(
                        DateTime.fromMillisecondsSinceEpoch(
                                log.timestamp)
                            .toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go("/"),
        icon: const Icon(Icons.home),
        label: const Text("Home"),
      ),
    );
  }

  static IconData _iconForAction(String action) {
    switch (action) {
      case 'CREATE_ASSET':
        return Icons.add_circle;

      case 'TRANSITION_STATUS':
        return Icons.sync_alt;

      case 'IMAGE_CAPTURED':
        return Icons.camera_alt;

      case 'AUDIO_RECORDED':
        return Icons.mic;

      case 'FEATURE_FUSION':
        return Icons.analytics;

      case 'RISK_ANALYSIS':
        return Icons.security;

      default:
        return Icons.article;
    }
  }
}