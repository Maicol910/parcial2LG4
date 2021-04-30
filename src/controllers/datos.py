from flask import render_template, request, redirect, url_for, session
from src import app
from src.models.productos import DatosModel

@app.route('/', methods=['GET', 'POST'])
def materia():
    if request.method =='GET':
        return render_template('materia.html')

    nombre = request.form.get('nombre')
    semestre = request.form.get('semestre')

    datosModel = DatosModel()
    datosModel.crearMateria(nombre, semestre)

    return render_template('materia.html')

@app.route('/estudiante', methods=['GET', 'POST'])
def estudiante(): 
    if request.method =='GET':
        return render_template('estudiante.html')

    identificacion = request.form.get('identificacion')
    nombre = request.form.get('nombres')
    apellido =request.form.get('apellido')
    celular =request.form.get('celular')
    correo =request.form.get('correo')
    semestre = request.form.get('semestre')
    
    datosModel = DatosModel()
    datosModel.crearEstudiantes(identificacion, nombre, apellido, celular, correo, semestre)
    
    return render_template('estudiante.html')

@app.route('/sesion', methods=['GET', 'POST'])
def sesiones(): 
    datosModel = DatosModel()

    if request.method =='GET':
        datos = datosModel.traerMaterias()
        return render_template('sessiones.html', datos = datos)

    materia_id = request.form.get('materia_id')
    fecha = request.form.get('fecha')
    hora_inicio =request.form.get('hora_inicio')
    hora_final =request.form.get('hora_final')

    datosModel.crearSesion(materia_id, fecha, hora_inicio, hora_final)

    return render_template('materia.html')

@app.route('/materias')
def datos():
    datosModel = DatosModel()
    datos = datosModel.traerMaterias()
    return render_template('verMaterias.html',datos = datos)

@app.route('/estudiante/estudiantes')
def verEstudiantes():
    datosModel = DatosModel()
    estu = datosModel.traerEstudiantes()
    return render_template('verEstudiantes.html', estu = estu)

@app.route('/asistencia', methods=['GET', 'POST'])
def asistencia(): 
    datosModel = DatosModel()

    if request.method =='GET':
        estu = datosModel.traerEstudiantes()
        sesi = datosModel.traerSesiones()
        return render_template('asistencia.html', estu = estu, sesi=sesi)

    sesion_id = request.form.get('sesion_id')
    estudiante_id = request.form.get('estudiante_id')
    asistencia = request.form.get('asistencia')

    datosModel.llenarAsistencia(sesion_id, estudiante_id, asistencia)

    return render_template('asistencia.html')

@app.route('/asignar', methods=['GET', 'POST'])
def asiganar_mat(): 
    datosModel = DatosModel()

    if request.method =='GET':
        estu = datosModel.traerEstudiantes()
        datos = datosModel.traerMaterias()
        return render_template('asignar_mat.html', datos = datos, estu=estu)

    materia_id = request.form.get('materia_id')
    estudiante_id = request.form.get('estudiante_id')

    datosModel.llenarEstu_mat(materia_id, estudiante_id)

    return render_template('materia.html')

@app.route('/Verasistencia')
def Verasistencia2(): 
    datosModel = DatosModel()
    
    asis = datosModel.traerAsistencia()

    return render_template('verAsistencias.html', asis = asis)