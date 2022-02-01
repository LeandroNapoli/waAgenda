function abreModalReativa(idUser) {
    $('#hdnIdUser').val(idUser);
}


$(document).ready(function () {

    $("[data-toggle=popover]").popover(); //O SALVADOR POPOVER PRA MOSTRAR O MODAL

    //ESSE BOTÃO ABAIXO É O DO REATIVAR
    $('.abrir-modal-reativar').on('click', function () { //Função que carrega o evento click no botão com a classe .abrir-modal-reativar

        $('#modalReativar').modal('show'); //REFERÊNCIA DE MODAL QUE DEVE SER ABERTO
    });

});