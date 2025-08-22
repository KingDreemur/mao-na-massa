<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Produto extends Model
{
    use HasFactory;

    // Define os campos que podem ser preenchidos via "Mass Assignment" (Produto::create)
    protected $fillable = [
        'nome',
        'descricao',
        'preco',
        'quantidade_estoque',
        'user_id' // Adicione se você implementou o relacionamento com User
    ];

    // Se a tabela não for 'produtos', você pode especificar:
    // protected $table = 'meus_produtos';

    // Exemplo de relacionamento "belongsTo" (Um produto pertence a um usuário)
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Exemplo de cast de atributos (opcional, para tipagem)
    // protected $casts = [
    //     'preco' => 'float',
    //     'quantidade_estoque' => 'integer',
    // ];
}
