import os
from flask import Flask, render_template, request, redirect, session
from flaskext.mysql import MySQL

# Crear la aplicación
app = Flask(__name__)

# Crear una llave secreta
app.secret_key = 'lytpython'

# Configurar la base de datos MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'petvet'


# Inicializar MySQL
mysql = MySQL(app)

# @app.route('/test_db')
# def test_db():
#     conn = mysql.get_db()
#     cursor = conn.cursor()
#     cursor.execute("SHOW TABLES")
#     tables = cursor.fetchall()
#     return str(tables)

# Inicio de sesión y registro
@app.route('/')
def Index():
    return render_template('index.html')

@app.route('/register', methods=['POST'])
def register():
    if request.method == 'POST' and all(key in request.form for key in ['nombre', 'apellido', 'fecha_nacimiento', 'telefono', 'sexo', 'mascota', 'correo', 'contrasena', 'verificar_contrasena']):
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        fecha_nacimiento = request.form['fecha_nacimiento']
        telefono = request.form['telefono']
        sexo = request.form['sexo']
        mascota = request.form['mascota']
        correo = request.form['correo']
        contrasena = request.form['contrasena']
        verificar_contrasena = request.form['verificar_contrasena']
        
        if contrasena != verificar_contrasena:
            return 'Passwords do not match!'
        
        conn = mysql.get_db()
        cursor = conn.cursor()
        cursor.execute('INSERT INTO usuario (nombre, apellido, fecha_nacimiento, telefono, sexo, id_mascota, correo, contrasena) VALUES (%s, %s, %s, %s, %s, (SELECT id_mascota FROM mascota WHERE tipoMascota=%s), %s, %s)', (nombre, apellido, fecha_nacimiento, telefono, sexo, mascota, correo, contrasena))
        conn.commit()
        cursor.close()
        return redirect('/')
    return 'Please fill out the form!'

@app.route('/login', methods=['POST'])
def login():
    correo = request.form['correo-sesion']
    password = request.form['pass-sesion']
    
    conn = mysql.get_db()
    cursor = conn.cursor()
    
    # Verificación de usuarios
    cursor.execute("SELECT * FROM usuario WHERE correo = %s", (correo,))
    usuario = cursor.fetchone()
    if usuario and usuario['contrasena'] == password:
        session['user_id'] = usuario['id_usuario']
        session['role'] = 'usuario'
        return redirect('/home/usuario/')

    # Verificación de administradores
    cursor.execute("SELECT * FROM admin WHERE correo = %s", (correo,))
    admin = cursor.fetchone()
    if admin and admin['contrasena'] == password:
        session['user_id'] = admin['id_admin']
        session['role'] = 'admin'
        return redirect('/admin/')
    
    cursor.close()
    return redirect('/')

@app.route('/home/usuario/', methods=['GET'])
def home_usuario():
    if 'user_id' not in session or session.get('role') != 'usuario':
        return redirect('/')
    
    usuario_id = session['user_id']

    conn = mysql.get_db()
    cursor = conn.cursor()

    # Obtener información del usuario
    cursor.execute("SELECT * FROM usuario WHERE id_usuario = %s", (usuario_id,))
    usuario = cursor.fetchone()

    # Obtener citas agendadas del usuario
    cursor.execute("SELECT * FROM citas WHERE id_usuario = %s", (usuario_id,))
    citas_agendadas = cursor.fetchall()

    cursor.close()

    return render_template('usuario/u-home.html', usuario=usuario, citas_agendadas=citas_agendadas)

@app.route('/admin/', methods=['GET'])
def home_admin():
    if 'user_id' not in session or session.get('role') != 'admin':
        return redirect('/')
    
    conn = mysql.get_db()
    cursor = conn.cursor()

    # Obtener información de las citas agendadas
    cursor.execute("SELECT * FROM citas WHERE fecha >= CURDATE()")
    citas_agendadas = cursor.fetchall()

    cursor.close()

    return render_template('admin/a-home.html', citas_agendadas=citas_agendadas)

# Rutas para usuarios
@app.route('/index/registro_usuario/')
def u_registrousuario():
    return render_template('usuario/u_registrousuario.html')

@app.route('/home/usuario/')
def u_servicios():
    return render_template('usuario/u_servicios.html')

@app.route('/citas/agendadas/usuario/')
def u_citasAgendadas():
    return render_template('usuario/u_citasAgendadas.html')

@app.route('/agendarcitas/usuario/')
def u_agendarCita():
    return render_template('usuario/u_agendarCita.html')

@app.route('/adopcion/usuario/')
def u_adopcion():
    return render_template('usuario/u_adopcion.html')

@app.route('/guarderia/usuario/')
def u_guarderia():
    return render_template('usuario/u_guarderia.html')

@app.route('/citasAgendadas/guarderia/usuario/')
def u_citasAgendadasGuarderia():
    return render_template('usuario/u_citasAgendadasGuarderia.html')

@app.route('/guarderia/cita/usuario/')
def u_guarderia_cita():
    return render_template('usuario/u_guarderiaCita.html')

@app.route('/servicios/solicitados/usuario/')
def u_servicio_solicitados():
    return render_template('usuario/u_Servicios-solicitud.html')

@app.route('/servicios/adomicilio/usuario/')
def u_servicio_adomicilio():
    return render_template('usuario/u_servicioAdomicialio.html')

# Rutas para administradores
@app.route('/admin/')
def a_administrador():
    return render_template('admin/a_administrador.html')

@app.route('/admin/adopcion/')
def a_adopcion():
    return render_template('admin/a_adopcion.html')

@app.route('/admin/citas/agendada/')
def a_agendada_citas():
    return render_template('admin/a_citas.html')

@app.route('/admin/servicios/')
def a_servicios():
    return render_template('admin/a_sevicio.html')

@app.route('/admin/agenda/citas/')
def a_agenda_citas():
    return render_template('admin/a_AgendadasGuarderia.html')  

@app.route('/admin/despliegue/guarderia/')
def a_despliegueGuarderia():
    return render_template('admin/a_despliegue-Guarderia.html')

@app.route('/admin/despliegue/citas/')
def a_despliegueCitas():
    return render_template('admin/a_despliegue-citas.html')

@app.route('/admin/despliegue/servicios/')
def a_despliegueServicios():
    return render_template('admin/a_despliegue-servicios.html')

if __name__ == '__main__':
    app.run(debug=True)
