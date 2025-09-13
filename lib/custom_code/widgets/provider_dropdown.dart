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

class ProviderDropdown extends StatefulWidget {
  const ProviderDropdown({
    super.key,
    this.width,
    this.height,
    required this.providers,
  });

  final double? width;
  final double? height;
  final List<ProviderStructStruct> providers;

  @override
  State<ProviderDropdown> createState() => _ProviderDropdownState();
}

class _ProviderDropdownState extends State<ProviderDropdown> {
  ProviderStructStruct? _selected;

  @override
  Widget build(BuildContext context) {
    // Debug: print providers length
    debugPrint(
        "📦 ProviderDropdown received ${widget.providers.length} providers");

    if (widget.providers.isEmpty) {
      return const Text("No providers found ❌");
    }

    return DropdownButtonFormField<ProviderStructStruct>(
      value: _selected,
      isExpanded: true,
      decoration: const InputDecoration(
        labelText: "Select Provider",
        border: OutlineInputBorder(),
      ),
      items: widget.providers.map((p) {
        return DropdownMenuItem<ProviderStructStruct>(
          value: p,
          child: Text(p.name),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selected = value;
        });
      },
    );
  }
}
