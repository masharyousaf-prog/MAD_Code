import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD Operations"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => context.read<UserController>().fetchUsers(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        label: const Text("Add Data"),
        icon: const Icon(Icons.add),
        onPressed: () {
          context.read<UserController>().clearControllers();
          _showForm(context, null);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: controller.users.isEmpty
            ? const Center(
                child: Text(
                  "No Data is Stored",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              )
            : ListView.builder(
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final user = controller.users[index];
                  return Card(
                    child: ListTile(
                      title: Text("Name : ${user.name}"),
                      subtitle: Text("Email : ${user.email}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.read<UserController>().populateControllers(user);
                              _showForm(context, user.key);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () => context.read<UserController>().deleteUser(user.key),
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _showForm(BuildContext context, int? itemKey) {
    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (sheetcontext) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(sheetcontext).viewInsets.bottom,
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                itemKey == null ? 'Create New' : 'Update',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            TextField(
              controller: context.read<UserController>().nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: context.read<UserController>().emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                await context.read<UserController>().saveUser(itemKey);
                Navigator.of(context).pop(); 
              },
              child: Text(itemKey == null ? 'Create New' : 'Update'),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}