import 'package:flutter/material.dart';
import 'package:qr_wallet_app_y4cu3z/flutter_flow/custom_functions.dart'; // Correct import for FlutterFlow
import '/backend/schema/structs/index.dart'; // Import for ProviderStruct

class AddBankAccountScreen extends StatefulWidget {
  const AddBankAccountScreen({super.key});

  @override
  State<AddBankAccountScreen> createState() => _AddBankAccountScreenState();
}

class _AddBankAccountScreenState extends State<AddBankAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _accountNumberController = TextEditingController();

  String _selectedAccountType =
      'ghipss'; // 'ghipss' for bank, 'mobile_money' for MoMo

  ProviderStruct? _selectedProvider;
  List<ProviderStruct> _allProviders = [];
  List<ProviderStruct> _currentProviders = [];

  bool _saveAccount = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchProviders();
  }

  Future<void> _fetchProviders() async {
    setState(() => _isLoading = true);
    try {
      _allProviders = await actions.getPaystackProviders();
      _updateCurrentProviderList();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _updateCurrentProviderList() {
    setState(() {
      _currentProviders = _allProviders
          .where((p) => p.type == _selectedAccountType)
          .toList();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  Future<void> _addRecipient() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Call the updated FlutterFlow Custom Action
      final recipientCode = await actions.createTransferRecipient(
        name: _nameController.text,
        accountNumber: _accountNumberController.text,
        providerCode: _selectedProvider!.code,
        accountType: _selectedAccountType,
        saveAccount: _saveAccount,
      );

      if (recipientCode != null) {
        // --- SUCCESS ---
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Account added successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.of(context).pop();
      } else {
        // The Action returned null, indicating an error handled inside the action.
        // Show a generic error message.
        throw Exception(
          'Failed to add account. Please check details and try again.',
        );
      }
    } catch (e) {
      // --- ERROR ---
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            // Remove the "Exception: " prefix for a cleaner user-facing message.
            e.toString().replaceFirst('Exception: ', ''),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Payout Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Account Holder Name',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the account name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: _selectedAccountType == 'ghipss'
                      ? 'Account Number'
                      : 'Phone Number',
                ),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the account number' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedAccountType,
                decoration: const InputDecoration(labelText: 'Account Type'),
                items: const [
                  DropdownMenuItem(
                    value: 'ghipss',
                    child: Text('Bank Account'),
                  ),
                  DropdownMenuItem(
                    value: 'mobile_money',
                    child: Text('Mobile Money'),
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedAccountType = newValue!;
                    _selectedProvider = null;
                    _updateCurrentProviderList();
                  });
                },
              ),
              const SizedBox(height: 16),
              if (_isLoading && _currentProviders.isEmpty)
                const Center(child: CircularProgressIndicator())
              else
                DropdownButtonFormField<ProviderStruct>(
                  value: _selectedProvider,
                  decoration: const InputDecoration(
                    labelText: 'Select Provider',
                  ),
                  hint: const Text('Choose a provider'),
                  items: _currentProviders.map((ProviderStruct provider) {
                    return DropdownMenuItem<ProviderStruct>(
                      value: provider,
                      child: Text(provider.name),
                    );
                  }).toList(),
                  onChanged: (ProviderStruct? newValue) {
                    setState(() {
                      _selectedProvider = newValue;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select a provider' : null,
                ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Save account for future withdrawals'),
                value: _saveAccount,
                onChanged: (bool value) {
                  setState(() {
                    _saveAccount = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: _addRecipient,
                      child: const Text('Add Account'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
