 function cargarCitas() {
            const citas = JSON.parse(localStorage.getItem('citas')) || [];
            const tbody = document.querySelector('#citasTable tbody');
            tbody.innerHTML = '';

            citas.forEach(cita => {
                const row = tbody.insertRow();
                row.innerHTML = `
                    <td>${cita.fecha}</td>
                    <td>${cita.tanda}</td>
                    <td>${cita.totalPrecio}</td>
                    <td>${cita.direccion}</td>
                    <td>${cita.mascota}</td>

                    <td>
                        <button onclick="eliminarCita(${cita.id})">Eliminar</button>
                    </td>
                `;
            });
        }

        function eliminarCita(id) {
            let citas = JSON.parse(localStorage.getItem('citas')) || [];
            citas = citas.filter(cita => cita.id !== id);
            localStorage.setItem('citas', JSON.stringify(citas));
            cargarCitas();
        }

        function volverAlFormulario() {
            window.location.href = '/servicios/adomicilio/usuario/';
        }

        window.addEventListener('load', cargarCitas);