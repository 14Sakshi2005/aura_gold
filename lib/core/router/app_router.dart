import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Placeholder imports for feature views (to be created next)
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/asset_registry/presentation/views/asset_registry_view.dart';
import '../../features/heavy_pipeline/presentation/views/heavy_pipeline_view.dart';
import '../../features/lightweight_pipeline/presentation/views/lightweight_pipeline_view.dart';
import '../../features/camera/presentation/views/camera_view.dart';
import '../../features/audio/presentation/views/audio_view.dart';
import '../../features/feature_fusion/presentation/views/feature_fusion_view.dart';
import '../../features/risk_engine/presentation/views/risk_engine_view.dart';
import '../../features/audit_log/presentation/views/audit_log_view.dart';
import '../../features/settings/presentation/views/settings_view.dart';

/// Routes constants names
class AppRoutes {
  static const String onboarding = '/onboarding';
  static const String home = '/';
  static const String assetRegistry = '/assets';
  static const String heavyPipeline = '/heavy-pipeline';
  static const String lightweightPipeline = '/lightweight-pipeline';
  static const String camera = '/camera';
  static const String audio = '/audio';
  static const String featureFusion = '/feature-fusion';
  static const String riskEngine = '/risk-engine';
  static const String auditLog = '/audit-log';
  static const String settings = '/settings';
}

/// Provider for GoRouter to enable dependency injection and reactive routing
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        name: 'onboarding',
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AppRoutes.assetRegistry,
        name: 'asset_registry',
        builder: (context, state) => const AssetRegistryView(),
      ),
      GoRoute(
        path: AppRoutes.heavyPipeline,
        name: 'heavy_pipeline',
        builder: (context, state) => const HeavyPipelineView(),
      ),
      GoRoute(
        path: AppRoutes.lightweightPipeline,
        name: 'lightweight_pipeline',
        builder: (context, state) => const LightweightPipelineView(),
      ),
      GoRoute(
        path: AppRoutes.camera,
        name: 'camera',
        builder: (context, state) {
          final assetId = state.extra as String? ?? "demo_asset";
          return CameraView(assetId: assetId);
        },
      ),
      GoRoute(
        path: AppRoutes.audio,
        name: 'audio',
        builder: (context, state) => const AudioView(),
      ),
      GoRoute(
        path: AppRoutes.featureFusion,
        name: 'feature_fusion',
        builder: (context, state) => const FeatureFusionView(),
      ),
      GoRoute(
        path: AppRoutes.riskEngine,
        name: 'risk_engine',
        builder: (context, state) => const RiskEngineView(),
      ),
      GoRoute(
        path: AppRoutes.auditLog,
        name: 'audit_log',
        builder: (context, state) => const AuditLogView(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        name: 'settings',
        builder: (context, state) => const SettingsView(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Route not found: ${state.error}'),
      ),
    ),
  );
});
