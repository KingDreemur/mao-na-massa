<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdutosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('produtos', function (Blueprint $table) {
            $table->id(); // id PRIMARY KEY, auto-increment
            $table->string('nome', 100); // VARCHAR(100)
            $table->text('descricao')->nullable(); // TEXT, pode ser nulo
            $table->decimal('preco', 8, 2); // DECIMAL(8,2)
            $table->integer('quantidade_estoque')->default(0); // INT, padrão 0
            $table->timestamps(); // created_at e updated_at
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('produtos');
    }
}
