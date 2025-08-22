<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Produto; // Importe o Model Produto

class ProdutoController extends Controller
{
    /**
     * Exibe o formulário para criar um novo produto.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('produtos.create');
    }

    /**
     * Armazena um novo produto no banco de dados.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        // 1. Definição das regras de validação
        $regras = [
            'nome' => 'required|string|min:3|max:255',
            'preco' => 'required|numeric|min:0.01',
            'quantidade_estoque' => 'required|integer|min:0',
            'descricao' => 'nullable|string|max:1000',
        ];

        // 2. Mensagens de erro customizadas (opcional, mas recomendado para UX)
        $mensagens = [
            'nome.required' => 'O nome do produto é obrigatório.',
            'nome.min' => 'O nome deve ter pelo menos :min caracteres.',
            'nome.max' => 'O nome não pode exceder :max caracteres.',
            'preco.required' => 'O preço é obrigatório.',
            'preco.numeric' => 'O preço deve ser um valor numérico.',
            'preco.min' => 'O preço deve ser no mínimo :min.',
            'quantidade_estoque.required' => 'A quantidade em estoque é obrigatória.',
            'quantidade_estoque.integer' => 'A quantidade em estoque deve ser um número inteiro.',
            'quantidade_estoque.min' => 'A quantidade em estoque não pode ser negativa.',
            'descricao.max' => 'A descrição não pode exceder :max caracteres.',
        ];

        // 3. Execução da validação
        // Se a validação falhar, o Laravel automaticamente redireciona de volta
        // para a página anterior com os erros e os dados preenchidos (old input).
        $request->validate($regras, $mensagens);

        // 4. Se a validação passar, o código continua aqui para salvar os dados
        Produto::create([
            'nome' => $request->nome,
            'descricao' => $request->descricao,
            'preco' => $request->preco,
            'quantidade_estoque' => $request->quantidade_estoque,
            // 'user_id' => auth()->id(), // Exemplo se tiver autenticação e relacionamento
        ]);

        return redirect()->route('produtos.index');

    }

    /**
     * Exibe a lista de produtos.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        // Supondo que você tenha um model Produto
        $produtos = \App\Models\Produto::all();
        return view('produtos.index', compact('produtos'));
    }

    // Você também pode adicionar um método 'edit' e 'update' com validação similar
}
