function guardar() {
    let user = document.getElementById("usuario").value;
    let pass = document.getElementById("contraseña").value;
    if (user === "admin" && pass === "1212") {
        window.location.href = '/inicio/u_servicios';
    } else if (user === "maria" && pass === "1212") {
        window.location.href = '/home/usuario/';
    } else {
        swal("Error", "Ingrese sus datos correctamente", "error");
    }
}