import 'package:flutter/material.dart';

class GridViewLearning extends StatelessWidget {
  const GridViewLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Grid View Example',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(30.0),
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => const GridViewCard(),
      ),
    );
  }
}

class GridViewCard extends StatelessWidget {
  const GridViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
