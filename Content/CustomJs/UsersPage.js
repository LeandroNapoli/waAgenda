function Teste() {
    alert("Batata");
}

function abreModalDelete(idUser) {
    $('#hdnIdUser').val(idUser);
}

//$(document).ready(function () { //Chamada de função anônima, mesma coisa de criar e chamar a função. .ready quer dizer que vai fazer isso quando a pagina toda (document) carregar.
//    $("#lkbEditarUsuario").on("click", function () { //Função de exemplo para quando carregar a pagina o botão editar chamaráa a função que escreve batata.
//        alert("Batata");
//    });
//});


$(document).ready(function () {

    $("[data-toggle=popover]").popover(); //O SALVADOR POPOVER PRA MOSTRAR O MODAL

    //ESSE BOTÃO ABAIXO É O TESTE
    $('#button').on('click', function () { //Função de exemplo para quando carregar a pagina o botão editar chamará a função que escreve batata.

        $('#exampleModalCenter').modal('show'); //REFERÊNCIA DE MODAL QUE DEVE SER ABERTO
    });
    //ESSE BOTÃO ABAIXO É O DO DELETE
    $('.abrir-modal-delete').on('click', function () { //Função de exemplo para quando carregar a pagina o botão editar chamará a função que escreve batata.

        $('#modalDelete').modal('show'); //REFERÊNCIA DE MODAL QUE DEVE SER ABERTO
    });
});