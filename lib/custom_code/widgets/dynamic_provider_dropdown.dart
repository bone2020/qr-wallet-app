// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart' as actions; // ✅ alias
import '/flutter_flow/custom_functions.dart';

class DynamicProviderDropdown extends StatefulWidget {
  const DynamicProviderDropdown({
    super.key,
    this.width = 200,
    this.height = 40,
    required this.accountType,
    required this.onProviderSelected,
  });

  final double width;
  final double height;
  final String accountType; // "nuban" or "mobile_money"
  final Future Function(String providerCode) onProviderSelected;

  @override
  State<DynamicProviderDropdown> createState() =>
      _DynamicProviderDropdownState();
}

class _DynamicProviderDropdownState extends State<DynamicProviderDropdown> {
  ProviderStructStruct? _selectedProvider; // ✅ fixed type
  List<ProviderStructStruct> _allProviders = [];
  List<ProviderStructStruct> _currentProviders = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProviders();
  }

  Future<void> _fetchProviders() async {
    try {
      _allProviders = await actions.getPaystackProviders(); // ✅ works now
      _updateCurrentProviderList();
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _updateCurrentProviderList() {
    _currentProviders =
        _allProviders.where((p) => p.type == widget.accountType).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return DropdownButtonFormField<ProviderStructStruct>(
      value: _selectedProvider,
      isExpanded: true,
      decoration: const InputDecoration(
        labelText: 'Select Provider',
        border: OutlineInputBorder(),
      ),
      hint: const Text('Choose a provider'),
      items: _currentProviders.map((provider) {
        return DropdownMenuItem<ProviderStructStruct>(
          value: provider,
          child: Text(provider.name),
        );
      }).toList(),
      onChanged: (ProviderStructStruct? newValue) async {
        setState(() {
          _selectedProvider = newValue;
        });
        if (newValue != null) {
          await widget.onProviderSelected(newValue.code); // ✅ async safe
        }
      },
      validator: (value) => value == null ? 'Please select a provider' : null,
    );
  }
}
