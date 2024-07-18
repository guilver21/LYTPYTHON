document.addEventListener('DOMContentLoaded', function() {
    var formulario = document.getElementById('registroForm');
    formulario.addEventListener('submit', function(event) {
        event.preventDefault(); // Evitar que se envíe el formulario automáticamente

        // Obtener los valores de los campos del formulario
        var nombre = document.getElementById('nombre').value;
        var apellido = document.getElementById('apellido').value;
        var fechaNacimiento = document.getElementById('fecha_nacimiento').value;
        var telefono = document.getElementById('telefono').value;
        var sexo = document.getElementById('sexo').value;
        var mascota = document.getElementById('mascota').value;
        var correo = document.getElementById('correo').value;
        var contrasena = document.getElementById('contrasena').value;
        var verificarContrasena = document.getElementById('verificar_contrasena').value;

        // Validación básica: todos los campos deben estar llenos
        if (nombre === '' || apellido === '' || fechaNacimiento === '' || telefono === '' || sexo === '' || mascota === '' || correo === '' || contrasena === '' || verificarContrasena === '') {
            // Mostrar alerta de que debe llenar todo el formulario
            swal("Debe llenar todos los campos para continuar", {
                icon: "error",
                button: "Aceptar"
            });
        } else {
            // Mostrar alerta de cuenta creada exitosamente y redirigir al index
            swal("¡Cuenta creada con éxito!", {
                icon: "success",
                button: "Aceptar"
            }).then(() => {
                // Redirigir al usuario al index (puedes cambiar la URL por la deseada)
                window.location.href = "/";
            });
        }
    });
});
