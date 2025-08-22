<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProdutoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('produtos')->insert([
            'nome' => 'Teclado Mecânico',
            'descricao' => 'Teclado RGB com switches azuis.',
            'preco' => 350.00,
            'quantidade_estoque' => 50,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        DB::table('produtos')->insert([
            'nome' => 'Mouse Gamer',
            'descricao' => 'Mouse com alta precisão e botões programáveis.',
            'preco' => 120.00,
            'quantidade_estoque' => 120,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }
}
