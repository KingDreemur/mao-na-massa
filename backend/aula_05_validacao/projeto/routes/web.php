<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProdutoController; // Importe o ProdutoController

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Rota para exibir o formulário de criação de produto
Route::get('/produtos/criar', [ProdutoController::class, 'create'])->name('produtos.create');

// Rota para processar o formulário de criação de produto
Route::post('/produtos', [ProdutoController::class, 'store'])->name('produtos.store');

// Rota para listar produtos (GET)
Route::get('/produtos', [ProdutoController::class, 'index'])->name('produtos.index');

// Exemplo de rota para update (para usar em edit.blade.php)
// Route::get('/produtos/{id}/editar', [ProdutoController::class, 'edit'])->name('produtos.edit');
// Route::put('/produtos/{id}', [ProdutoController::class, 'update'])->name('produtos.update');

