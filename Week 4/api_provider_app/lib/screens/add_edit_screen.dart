import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';

class AddEditScreen extends StatelessWidget {
  const AddEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ItemProvider>();
    final isEditing = provider.titleController.text.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Item' : 'Add New Item'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: provider.titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: provider.subtitleController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Subtitle / Body',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () async {
                  await context.read<ItemProvider>().submitForm();
                  if (context.mounted) Navigator.pop(context);
                },
                child: Text(isEditing ? 'Update Item' : 'Save Item'),
              ),
            )
          ],
        ),
      ),
    );
  }
}