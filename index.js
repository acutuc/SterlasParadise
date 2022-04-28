var textFile = null;
function leer_contenido(){

    var textbox = document.getElementById('textbox');

    var contenido=textbox.value;

    document.getElementById('respuesta').innerHTML=contenido;
}
