// Hecho por yohan 

document.addEventListener('DOMContentLoaded', function() {
    // Espera a que se cargue completamente el DOM antes de ejecutar el código
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    const totalElementos = document.getElementById('totalPrecio');
    let totalPrecios = 0;
    
    // .forEach para operaciones repetitivas
    checkboxes.forEach(function(checkbox) {
        // Para cada checkbox encontrado en el documento
        checkbox.addEventListener('change', function() {
            // Añade un event listener para el evento 'change' (cambio)
            const precio = parseInt(this.value); // Obtiene el valor numérico del checkbox
            
            if (this.checked) { // checked para comprobar si esta marcado o desmarcado 

                // Si el checkbox está marcado
                totalPrecios += precio; // Añade el precio al precio total
            } else {
                // Si el checkbox está desmarcado
                totalPrecios -= precio; // Resta el precio del precio total
            }
            totalElementos.textContent = totalPrecios; // Actualiza el elemento  con el precio total
        });

    });
});


