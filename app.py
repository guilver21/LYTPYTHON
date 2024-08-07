import os
from flask import Flask, render_template, request, redirect, session, url_for, flash
import MySQLdb.cursors
from datetime import datetime
from flask_mysqldb import MySQL

# Crear la aplicación
app = Flask(__name__)

# Crear una llave secreta
app.secret_key = 'lytpython'

# Configurar la base de datos MySQL
app.config['MYSQL_CHARSET'] = 'utf8mb4'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'petvet'

# Inicializar MySQL
mysql = MySQL(app)

# Inicio de sesión y registro
@app.route('/')
def Index():
    return render_template('index.html')

# Ruta principal (login)
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST' and 'correo-sesion' in request.form and 'pass-sesion' in request.form:
        correo = request.form['correo-sesion']
        password = request.form['pass-sesion']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM usuario WHERE correo = %s AND contraseña = %s', (correo, password))
        account = cursor.fetchone()
        if account:
            session['loggedin'] = True
            session['id'] = account['id_usuario']
            session['correo'] = account['correo']
            session['nombre'] = account['nombre']
            session['apellido'] = account['apellido']
            session['telefono'] = account['telefono']
            session['id_mascota'] = account['id_mascota']
            flash('¡Inicio de sesión exitoso!', 'success')
            return redirect(url_for('u_servicios'))
        else:
            flash('¡Correo o contraseña incorrectos!', 'danger')
    return render_template('index.html')

# Ruta de registro de usuario
@app.route('/index/registro_usuario/', methods=['GET', 'POST'])
def u_registrousuario():
    if request.method == 'POST' and all(k in request.form for k in ['nombre', 'apellido', 'fecha_nacimiento', 'telefono', 'sexo', 'mascota', 'correo', 'contraseña', 'verificar_contraseña']):
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        fecha_nacimiento = request.form['fecha_nacimiento']
        telefono = request.form['telefono']
        sexo = request.form['sexo']
        mascota = request.form['mascota']
        correo = request.form['correo']
        contraseña = request.form['contraseña']
        verificar_contraseña = request.form['verificar_contraseña']
        
        if contraseña != verificar_contraseña:
            flash('¡Las contraseñas no coinciden!', 'danger')
            return redirect(url_for('u_registrousuario'))
        
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM usuario WHERE correo = %s', (correo,))
        account = cursor.fetchone()
        
        if account:
            flash('¡El correo ya está registrado!', 'danger')
        else:
            cursor.execute('INSERT INTO mascota (tipoMascota) VALUES (%s)', (mascota,))
            id_mascota = cursor.lastrowid
            mysql.connection.commit()
            
            cursor.execute('INSERT INTO usuario (nombre, apellido, `fecha-nacimiento`, telefono, sexo, id_mascota, correo, contraseña, verificar_contraseña) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)', (nombre, apellido, fecha_nacimiento, telefono, sexo, id_mascota, correo, contraseña, verificar_contraseña))
            mysql.connection.commit()
            flash('¡Te has registrado exitosamente!', 'success')
            return redirect(url_for('Index'))
    return render_template('usuario/u_registrousuario.html')

@app.route('/home/usuario/')
def u_servicios():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT tipoMascota FROM mascota WHERE id_mascota = %s', [session['id_mascota']])
        mascota = cursor.fetchone()
        return render_template('usuario/u_servicios.html', nombre=session['nombre'], apellido=session['apellido'], telefono=session['telefono'], correo=session['correo'], mascota=mascota['tipoMascota'])
    else:
        return redirect(url_for('Index'))
    

@app.route('/citas/agendadas/usuario/')
def u_citasAgendadas():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT tipoMascota FROM mascota WHERE id_mascota = %s', [session['id_mascota']])
        mascota = cursor.fetchone()
        return render_template('usuario/u_citasAgendadas.html', nombre=session['nombre'], apellido=session['apellido'], telefono=session['telefono'], correo=session['correo'], mascota=mascota['tipoMascota'])
    else:
        return redirect(url_for('Index'))

@app.route('/agendarcitas/usuario/')
def u_agendarCita():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT tipoMascota FROM mascota WHERE id_mascota = %s', [session['id_mascota']])
        mascota = cursor.fetchone()
        return render_template('usuario/u_agendarCita.html', nombre=session['nombre'], apellido=session['apellido'], telefono=session['telefono'], correo=session['correo'], mascota=mascota['tipoMascota'])
    else:
        return redirect(url_for('Index'))

@app.route('/agendar_cita', methods=['POST'])
def agendar_cita():
    if 'loggedin' in session:
        id_usuario = session['id']  
        fecha = request.form['fecha']
        tanda = request.form['tanda']
        id_mascota = request.form['mascota']  
        id_servicio = request.form.get('servicio', 'valor_por_defecto')
        descripcion = request.form.get('descripcion', 'Valor por defecto')


        cursor = mysql.connection.cursor()
        sql = """
        INSERT INTO citas (id_usuario, fecha, tanda, id_mascota, id_servicio, descripcion)
        VALUES (%s, %s, %s, %s, %s, %s)
        """
        cursor.execute(sql, (id_usuario, fecha, tanda, id_mascota, id_servicio, descripcion))
        mysql.connection.commit()
        cursor.close()

        return redirect(url_for('u_citasAgendadas'))
    else:
        return redirect(url_for('Index'))


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
