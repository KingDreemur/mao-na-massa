import 'package:flutter/material.dart';
import 'package:meu_projeto_integrador/shared/widgets/atoms/app_text.dart';
import 'package:meu_projeto_integrador/shared/widgets/organisms/product_list_card_organism.dart';
import 'package:meu_projeto_integrador/models/item_model.dart';
import 'package:meu_projeto_integrador/shared/constants/app_spacings.dart';

class MainLayoutTemplate extends StatelessWidget {
  final String title;

  const MainLayoutTemplate({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    // Mock de produtos
  final produtos = [
    Item(
      id: 1,
      nome: "Notebook",
      descricao: "Notebook Gamer",
      preco: 4500.00,
      imageUrl: "https://via.placeholder.com/150",
    ),
    Item(
      id: 2,
      nome: "Mouse",
      descricao: "Mouse sem fio",
      preco: 120.00,
      imageUrl: "https://via.placeholder.com/150",
    ),
  ];


    return Scaffold(
      appBar: AppBar(
        title: AppText(
          title,
          style: AppTextStyle.titleLarge,
          color: Colors.white,
          isBold: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacings.medium),
        child: ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            return ProductListCardOrganism(
              item: produtos[index],
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}