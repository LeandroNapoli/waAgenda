function Teste() {
    alert("Batata");
}

//$(document).ready(function () { //Chamada de função anônima, mesma coisa de criar e chamar a função. .ready quer dizer que vai fazer isso quando a pagina toda (document) carregar.
//    $("#lkbEditarUsuario").on("click", function () { //Função de exemplo para quando carregar a pagina o botão editar chamaráa a função que escreve batata.
//        alert("Batata");
//    });
//});


$(document).ready(function () {

    $("#button").click(function () { //Função de exemplo para quando carregar a pagina o botão editar chamará a função que escreve batata.
        
        $('#exampleModalCenter').modal();
    });
});