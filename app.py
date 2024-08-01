# incluir el framework flask
import os
from flask import Flask, render_template, request, redirect, session, send_from_directory
from flaskext.mysql import MySQL
from datetime import datetime

# crear la aplicacion 
app = Flask(__name__)

# crear una llave secreta
app.secret_key = "lytpython"


# crear una conexion a la base de datos 
mysql = MySQL()
# Crear una conexión a la base de datos
mysql = MySQL()
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'petvet'

# Agregar el valor para inicializar nuestra aplicación
mysql.init_app(app)

# Código para el inicio de sesión y registro
@app.route('/')
def Index():
    return render_template('index.html')

@app.route('/index/registro_usuario/')
def u_registrousuario():
    return render_template('usuario/u_registrousuario.html')

# Página home (u_servicios)
@app.route('/home/usuario/')
def u_servicios():
    return render_template('usuario/u_servicios.html')

# Página de ver citas agendadas (u_citasAgendadas)
@app.route('/citas/agendadas/usuario/')
def u_citasAgendadas():
    return render_template('usuario/u_citasAgendadas.html')

# Página de agendar citas (u_agendarCita)
@app.route('/agendarcitas/usuario/')
def u_agendarCita():
    return render_template('usuario/u_agendarCita.html')

# Página de adopción (u_adopcion)
@app.route('/adopcion/usuario/')
def u_adopcion():
    return render_template('usuario/u_adopcion.html')

# Página de guardería (u_guarderia)
@app.route('/guarderia/usuario/')
def u_guarderia():
    return render_template('usuario/u_guarderia.html')

@app.route('/citasAgendadas/guarderia/usuario/')
def u_citasAgendadasGuarderia():
    return render_template('usuario/u_citasAgendadasGuarderia')

@app.route('/guarderia/cita/usuario/')
def u_guarderia_cita():
    return render_template('usuario/u_guarderiaCita.html')

@app.route('/servicios/solicitados/usuario/')
def u_servicio_solicitados():
    return render_template('usuario/u_Servicios-solicitud.html')

@app.route('/servicios/adomicilio/usuario/')
def u_servicio_adomicilio():
    return render_template('usuario/u_servicioAdomicialio.html')


# Admin

@app.route('/admin/')
def a_administrador():
    return render_template('admin/a_administrador.html')

# @app.route('/admin/adopcion/')
# def a_adopcion():
#     return render_template('admin/a_adopcion.html')

@app.route('/admin/adopcion/')
def a_adopcion():
    return render_template('admin/a_adopcion.html')

@app.route('/admin/citas/agendada/')
def a_agendada_citas():
    return render_template('admin/a_citas_agendada.html')

@app.route('/admin/servicios/')
def a_servicios():
    return render_template('admin/a_sevicio.html')

@app.route('/admin/agenda/citas/')
def a_agenda_citas():
    return render_template('admin/a_AgendadasGuarderia.html')  
     
if __name__ == '__main__':
    app.run(debug=True)