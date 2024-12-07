import 'package:flutter/material.dart';

class ListViewLearning extends StatelessWidget {
  const ListViewLearning({super.key});

  @override
  Widget build(BuildContext context) {
    // sample data fot three lists
    List<List<String>> listsData = [
      ['Item 1', 'Item 2', 'Item 3'],
      ['Item A', 'Item B', 'Item C', 'Item D'],
      ['Item X', 'Item Y', 'Item Z'],
      ['Item P', 'Item Q', 'Item R'],
      ['Item M', 'Item N', 'Item O'],
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'List View Example',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: listsData.length,
          itemBuilder: (context, index) {
            return ListViewCard(listData: listsData[index]);
          }),
    );
  }
}

class ListViewCard extends StatelessWidget {
  final List<String> listData;
  const ListViewCard({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text('List ${listData[0]}'),
          ),
          const Divider(),
          ListView.builder(
            itemCount: listData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listData[index]),
              );
            },
          )
        ],
      ),
    );
  }
}
