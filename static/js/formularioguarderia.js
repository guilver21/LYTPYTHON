// Este bloque de código se ejecuta cuando se envía el formulario con la clase 'citaForm'
document.querySelector('.formulario').addEventListener('submit', function(e) {
    // Prevenir el comportamiento por defecto de envío del formulario
    e.preventDefault();
    
    // Obtener los datos del formulario utilizando FormData
    const formData = new FormData(this);
    
    // Convertir los datos de FormData a un objeto JavaScript utilizando Object.fromEntries
    const data = Object.fromEntries(formData);
    
    // Añadir un ID único a los datos utilizando la marca de tiempo actual (Date.now())
    data.id = Date.now();
    
    // Obtener las citas almacenadas en localStorage o inicializar un array vacío si no hay citas
    let citas = JSON.parse(localStorage.getItem('citas')) || [];
    
    // Agregar los nuevos datos de la cita al array de citas
    citas.push(data);
    
    // Guardar el array actualizado de citas en localStorage
    localStorage.setItem('citas', JSON.stringify(citas));
    
    // Mostrar una notificación de éxito utilizando SweetAlert
    swal({
        title: "¡Cita agendada con éxito!",
        icon: "success",
        button: "Aceptar"
    }).then(() => {
        // Reiniciar el formulario después de que el usuario acepte la notificación
        this.reset();
    });
});

// Función para redirigir a la página 'u_citas-agendadas.html' al hacer clic en un botón
function verCitas() {
    window.location.href = '/guarderia/cita/usuario/';
}
