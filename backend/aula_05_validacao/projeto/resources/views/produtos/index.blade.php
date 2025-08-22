<!DOCTYPE html>
<html>
<head>
    <title>Lista de Produtos</title>
</head>
<body>
    <h1>Produtos</h1>
        <a href="{{ route('produtos.create') }}">Cadastrar novo produto</a>
    <ul>
        @foreach ($produtos as $produto)
            <li>{{ $produto->nome }} - R$ {{ number_format($produto->preco, 2, ',', '.') }}</li>
        @endforeach
    </ul>
</body>
</html>