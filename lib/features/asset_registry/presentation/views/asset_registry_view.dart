import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/responsive/responsive_layout.dart';
import '../../../../core/constants/app_constants.dart';
import '../controllers/asset_registry_controller.dart';

/// Screen form to register a new gold asset
class AssetRegistryView extends ConsumerStatefulWidget {
  const AssetRegistryView({super.key});

  @override
  ConsumerState<AssetRegistryView> createState() => _AssetRegistryViewState();
}

class _AssetRegistryViewState extends ConsumerState<AssetRegistryView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  final _notesController = TextEditingController();

  final List<String> _categories = 
  ['Ring',
  'Necklace',
  'Earrings',
  'Bracelet',
  'Coin',
  'Pendant',
  'Chain',
  'Bangle',
  'Mangalsutra',
  'Other',];
  final List<String> _karats = ['9K', '10K', '12K', '14K', '15K', '18K', '20K', '22K','23K', '24K'];

  @override
  void dispose() {
    _nameController.dispose();
    _weightController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final notifier = ref.read(assetFormControllerProvider.notifier);
      
      // Update form values into controller state
      notifier.updateName(_nameController.text);
      notifier.updateWeight(double.tryParse(_weightController.text) ?? 0.0);
      notifier.updateNotes(_notesController.text);

      final decisionResult = await notifier.submitForm();
      if (decisionResult != null && mounted) {
        // Show success Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Asset Registered! Routing to ${decisionResult.status}'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
        // Clean form and route to the determined pipeline
        notifier.reset();
        context.pushReplacement(decisionResult.route);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(assetFormControllerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register New Asset'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: ResponsiveLayout(
        mobile: _buildForm(context, state, theme, isMobile: true),
        desktop: _buildForm(context, state, theme, isMobile: false),
      ),
    );
  }

  Widget _buildForm(
    BuildContext context,
    AssetFormState state,
    ThemeData theme, {
    required bool isMobile,
  }) {
    if (state.isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Processing asset and evaluating routing pipeline...'),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 600),
          child: Card(
            elevation: isMobile ? 0 : 4,
            color: isMobile ? Colors.transparent : theme.colorScheme.surface,
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 0 : AppConstants.paddingLarge),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.errorMessage != null) ...[
                      Container(
                        padding: const EdgeInsets.all(AppConstants.paddingMedium),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                        ),
                        child: Text(
                          state.errorMessage!,
                          style: TextStyle(color: theme.colorScheme.onErrorContainer),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Name
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Asset Name',
                        prefixIcon: Icon(Icons.badge),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter asset name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Category Dropdown
                    DropdownButtonFormField<String>(
                      value: state.category,
                      decoration: const InputDecoration(
                        labelText: 'Asset Category',
                        prefixIcon: Icon(Icons.category),
                        border: OutlineInputBorder(),
                      ),
                      items: _categories.map((cat) {
                        return DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          ref.read(assetFormControllerProvider.notifier).updateCategory(value);
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Weight Input
                    TextFormField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        labelText: 'Declared Weight (grams)',
                        prefixIcon: Icon(Icons.scale),
                        border: OutlineInputBorder(),
                        suffixText: 'g',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter asset weight';
                        }
                        final weight = double.tryParse(value);
                        if (weight == null || weight <= 0) {
                          return 'Please enter a valid positive weight';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Karat Dropdown
                    DropdownButtonFormField<String>(
                      value: state.karat,
                      decoration: const InputDecoration(
                        labelText: 'Declared Karat',
                        prefixIcon: Icon(Icons.workspace_premium),
                        border: OutlineInputBorder(),
                      ),
                      items: _karats.map((k) {
                        return DropdownMenuItem(
                          value: k,
                          child: Text(k),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          ref.read(assetFormControllerProvider.notifier).updateKarat(value);
                        }
                      },
                    ),
                    const SizedBox(height: 16),

                    // Optional Notes
                    TextFormField(
                      controller: _notesController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Optional Notes',
                        prefixIcon: Icon(Icons.notes),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Submit Button
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Continue to Pipeline'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
