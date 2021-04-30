from src.config.db import DB

class DatosModel():
    #------------------------------------------ mostrar materias -----------------------------------
    def traerMaterias(self):
        cursor = DB.cursor()
        cursor.execute('select * from materias')
        datos = cursor.fetchall()
        cursor.close()
        return datos
    #------------------------------------------ mostrar estudiantes -----------------------------------
    def traerEstudiantes(self):
        cursor = DB.cursor()
        cursor.execute('select * from estudiantes')
        estu = cursor.fetchall()
        cursor.close()
        return estu
    #------------------------------------------ mostrar sesion -----------------------------------
    def traerSesiones(self):
        cursor = DB.cursor()
        cursor.execute('select * from sesiones')
        sesi = cursor.fetchall()
        cursor.close()
        return sesi
    #------------------------------------------ mostrar sesion -----------------------------------
    def traerAsistencia(self):
        cursor = DB.cursor()
        cursor.execute('SELECT estudiantes.nombre,sesiones.fecha, sesiones.hora_inicio, sesiones.hora_final, materias.nombre AS Materia, asistencia.asistencia FROM asistencia INNER JOIN sesiones ON asistencia.sesion_id = sesiones.id INNER JOIN estudiantes ON asistencia.estudiante_id = estudiantes.id INNER JOIN materias ON sesiones.materia_id = materias.id')
        asis = cursor.fetchall()
        cursor.close()
        return asis
        print(asis)
    #------------------------------------------ crear materia,estudiantes,sessiones -----------------------------------
    def crearMateria(self, nombre, semestre):
        cursor = DB.cursor()
        cursor.execute('insert into materias(nombre,semestre) values(?,?)', (nombre,semestre,))
        cursor.close()

    def crearEstudiantes(self, identificacion, nombre, apellido, celular, correo, semestre):
        cursor = DB.cursor()
        cursor.execute('insert into estudiantes(identificacion, nombre, apellido, celular, correo, semestre) values(?,?,?,?,?,?)', (identificacion, nombre, apellido, celular, correo, semestre,))
        cursor.close()
    
    def crearSesion(self, materia_id, fecha, hora_inicio, hora_final):
        cursor = DB.cursor()
        cursor.execute('insert into sesiones(materia_id, fecha, hora_inicio, hora_final) values(?,?,?,?)', (materia_id, fecha, hora_inicio, hora_final,))
        cursor.close()
    
    def llenarEstu_mat(self, materia_id, estudiante_id):
        cursor = DB.cursor()
        cursor.execute('insert into estudiate_materia(materia_id, estudiante_id) values(?,?)', (materia_id, estudiante_id,))
        cursor.close()

    def llenarAsistencia(self, sesion_id, estudiante_id, asistencia):
        cursor = DB.cursor()
        cursor.execute('insert into asistencia(sesion_id, estudiante_id, asistencia) values(?,?,?)', (sesion_id, estudiante_id, asistencia,))
        cursor.close()
