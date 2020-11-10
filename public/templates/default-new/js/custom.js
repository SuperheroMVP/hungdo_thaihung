$(document).ready(function () {
    $('.select2').select2({
        dropdownParent: $('#modalPickLocation')
    });
    $('#modalPickLocation').modal('show')
    // $.getJSON('{{asset(\'hcvn/xa_phuong.json\')}}', function (json) {
    //
    // })
});