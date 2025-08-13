import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/models/item_model.dart';

class ItemListCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemListCard({super.key,
  required this.item,
  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.imageUrl,
                  width: 90,
                  height: 90,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Text(item.nome),
                    Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                    Text(item.descricao),
                  ],
                ),
              )

            ]
          ), 
        ),
      ),
    );
  }
}