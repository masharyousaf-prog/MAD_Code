import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'sqfprovider.dart';

class Sqfliteclass extends StatelessWidget {
  const Sqfliteclass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQFLite prac")),
      body: Consumer<Sqfprovider>(
              builder: (context, provider, child) {
                if(provider.isLoading){
                  return CircularProgressIndicator();
                }
                if(provider.errorMessage != null){
                  final e = provider.errorMessage;
                  return Text("Error $e");
                }
                if(provider.users.isEmpty){
                  return Text("No data found!");
                }
                return ListView.builder(
                  itemCount: provider.users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(10),
                      elevation: 5,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text(provider.users[index].name),
                        subtitle: Text(provider.users[index].email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                provider.setupFormForEdit(provider.users[index]);
                                Navigator.pushNamed(context, '/add-edit');
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                provider.deleteUser(provider.users[index].id!);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          
        
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Sqfprovider>(context, listen: false).setupFormForAdd();
          Navigator.pushNamed(context, '/add-edit');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddEditPage extends StatelessWidget {
  const AddEditPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add/Edit page")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Consumer<Sqfprovider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                      TextField(
                        controller: provider.nameController,
                        decoration: InputDecoration(hintText: 'Enter Name', border: OutlineInputBorder()),
                        
                      ),
                    TextField(
                      controller: provider.emailController,
                      decoration: InputDecoration(hintText: 'Enter Email', border: OutlineInputBorder()),
                      
                    ),
                    ElevatedButton(
                      onPressed: () {
                        provider.submitForm();
                        if(context.mounted){
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        provider.editingID == null ? 'Add data' : 'Edit data',
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
