use SQL2;

-- 1
DELIMITER //

CREATE PROCEDURE ListaPrimerApellido()
BEGIN
    SELECT apellido1 FROM empleado;
END //

DELIMITER ;
-- 2
DELIMITER //

CREATE PROCEDURE ListaPrimerApellidoUnico()
BEGIN
    SELECT DISTINCT apellido1 FROM empleado;
END //

DELIMITER ;
-- 3

DELIMITER //

CREATE PROCEDURE ListaTodosLosEmpleados()
BEGIN
    SELECT * FROM empleado;
END //

DELIMITER ;
-- 4
DELIMITER //

CREATE PROCEDURE ListaNombreYApellidos()
BEGIN
    SELECT nombre, apellido1, apellido2 FROM empleado;
END //

DELIMITER ;
-- 5 
DELIMITER //

CREATE PROCEDURE ListaIdDepartamentos()
BEGIN
    SELECT id_departamento FROM empleado;
END //

DELIMITER ;
 
-- 6
DELIMITER //

CREATE PROCEDURE ListaIdDepartamentosUnicos()
BEGIN
    SELECT DISTINCT id_departamento FROM empleado;
END //

DELIMITER ;
-- 7
DELIMITER //

CREATE PROCEDURE ListaNombreCompleto()
BEGIN
    SELECT CONCAT(nombre, ' ', apellido1, ' ', apellido2) AS nombre_completo FROM empleado;
END //

DELIMITER ;
-- 8
DELIMITER //

CREATE PROCEDURE ListaNombreCompletoMayusculas()
BEGIN
    SELECT UPPER(CONCAT(nombre, ' ', apellido1, ' ', apellido2)) AS nombre_completo FROM empleado;
END //

DELIMITER ;

-- 9
DELIMITER //

CREATE PROCEDURE ListaNombreCompletoMinusculas()
BEGIN
    SELECT LOWER(CONCAT(nombre, ' ', apellido1, ' ', apellido2)) AS nombre_completo FROM empleado;
END //

DELIMITER 

-- 10 

DELIMITER //

CREATE PROCEDURE ListaIdYNif()
BEGIN
    SELECT id, 
           SUBSTRING(nif, 1, CHAR_LENGTH(nif) - 1) AS nif_digitos, 
           RIGHT(nif, 1) AS nif_letra
    FROM empleado;
END //

DELIMITER ;

CALL ListaPrimerApellido();
CALL ListaPrimerApellidoUnico();
CALL ListaTodosLosEmpleados();
CALL ListaNombreYApellidos();
CALL ListaIdDepartamentos();
CALL ListaIdDepartamentosUnicos();
CALL ListaNombreCompleto();
CALL ListaNombreCompletoMayusculas();
CALL ListaNombreCompletoMinusculas();
CALL ListaIdYNif();


DELIMITER //

-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual.
CREATE PROCEDURE ListaPresupuestoActual()
BEGIN
    SELECT nombre, (presupuesto - gastos) AS presupuesto_actual
    FROM departamento;
END //

-- 12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
CREATE PROCEDURE ListaPresupuestoActualOrdenado()
BEGIN
    SELECT nombre, (presupuesto - gastos) AS presupuesto_actual
    FROM departamento
    ORDER BY presupuesto_actual ASC;
END //

-- 13. Lista el nombre de todos los departamentos ordenados de forma ascendente.
CREATE PROCEDURE ListaDepartamentosAscendente()
BEGIN
    SELECT nombre
    FROM departamento
    ORDER BY nombre ASC;
END //

-- 14. Lista el nombre de todos los departamentos ordenados de forma descendente.
CREATE PROCEDURE ListaDepartamentosDescendente()
BEGIN
    SELECT nombre
    FROM departamento
    ORDER BY nombre DESC;
END //

-- 15. Lista los apellidos y el nombre de todos los empleados, ordenados alfabéticamente.
CREATE PROCEDURE ListaEmpleadosOrdenados()
BEGIN
    SELECT apellido1, apellido2, nombre
    FROM empleado
    ORDER BY apellido1, apellido2, nombre ASC;
END //

-- 16. Devuelve una lista con el nombre y el presupuesto de los 3 departamentos con mayor presupuesto.
CREATE PROCEDURE Top3DepartamentosMayorPresupuesto()
BEGIN
    SELECT nombre, presupuesto
    FROM departamento
    ORDER BY presupuesto DESC
    LIMIT 3;
END //

-- 17. Devuelve una lista con el nombre y el presupuesto de los 3 departamentos con menor presupuesto.
CREATE PROCEDURE Top3DepartamentosMenorPresupuesto()
BEGIN
    SELECT nombre, presupuesto
    FROM departamento
    ORDER BY presupuesto ASC
    LIMIT 3;
END //

-- 18. Devuelve una lista con el nombre y el gasto de los 2 departamentos con mayor gasto.
CREATE PROCEDURE Top2DepartamentosMayorGasto()
BEGIN
    SELECT nombre, gastos
    FROM departamento
    ORDER BY gastos DESC
    LIMIT 2;
END //

-- 19. Devuelve una lista con el nombre y el gasto de los 2 departamentos con menor gasto.
CREATE PROCEDURE Top2DepartamentosMenorGasto()
BEGIN
    SELECT nombre, gastos
    FROM departamento
    ORDER BY gastos ASC
    LIMIT 2;
END //

-- 20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado.
CREATE PROCEDURE Lista5EmpleadosDesdeTerceraFila()
BEGIN
    SELECT *
    FROM empleado
    LIMIT 2, 5;
END //

-- 21. Devuelve una lista con el nombre de los departamentos y el presupuesto mayor o igual a 150000 euros.
CREATE PROCEDURE DepartamentosPresupuestoMayor150000()
BEGIN
    SELECT nombre, presupuesto
    FROM departamento
    WHERE presupuesto >= 150000;
END //

-- 22. Devuelve una lista con el nombre de los departamentos y el gasto menor a 5000 euros.
CREATE PROCEDURE DepartamentosGastosMenor5000()
BEGIN
    SELECT nombre, gastos
    FROM departamento
    WHERE gastos < 5000;
END //

-- 23. Devuelve una lista con el nombre de los departamentos y el presupuesto entre 100000 y 200000 euros.
CREATE PROCEDURE DepartamentosPresupuestoEntre100kY200kSinBetween()
BEGIN
    SELECT nombre, presupuesto
    FROM departamento
    WHERE presupuesto >= 100000 AND presupuesto <= 200000;
END //

-- 24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
CREATE PROCEDURE DepartamentosPresupuestoNoEntre100kY200kSinBetween()
BEGIN
    SELECT nombre, presupuesto
    FROM departamento
    WHERE presupuesto < 100000 OR presupuesto > 200000;
END //

-- 25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros.
CREATE PROCEDURE DepartamentosPresupuestoEntre100kY200kConBetween()
BEGIN
    SELECT nombre
    FROM departamento
    WHERE presupuesto BETWEEN 100000 AND 200000;
END //

-- 26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
CREATE PROCEDURE DepartamentosPresupuestoNoEntre100kY200kConBetween()
BEGIN
    SELECT nombre
    FROM departamento
    WHERE presupuesto NOT BETWEEN 100000 AND 200000;
END //

-- 27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, donde los gastos son mayores que el presupuesto.
CREATE PROCEDURE DepartamentosGastosMayoresQuePresupuesto()
BEGIN
    SELECT nombre, gastos, presupuesto
    FROM departamento
    WHERE gastos > presupuesto;
END //

-- 28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, donde los gastos son menores que el presupuesto.
CREATE PROCEDURE DepartamentosGastosMenoresQuePresupuesto()
BEGIN
    SELECT nombre, gastos, presupuesto
    FROM departamento
    WHERE gastos < presupuesto;
END //

-- 29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, donde los gastos son iguales al presupuesto.
CREATE PROCEDURE DepartamentosGastosIgualesQuePresupuesto()
BEGIN
    SELECT nombre, gastos, presupuesto
    FROM departamento
    WHERE gastos = presupuesto;
END //

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
CREATE PROCEDURE EmpleadosConSegundoApellidoNull()
BEGIN
    SELECT *
    FROM empleado
    WHERE apellido2 IS NULL;
END //

-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
CREATE PROCEDURE EmpleadosConSegundoApellidoNoNull()
BEGIN
    SELECT *
    FROM empleado
    WHERE apellido2 IS NOT NULL;
END //

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
CREATE PROCEDURE EmpleadosConSegundoApellidoLopez()
BEGIN
    SELECT *
    FROM empleado
    WHERE apellido2 = 'López';
END //

-- 33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
CREATE PROCEDURE EmpleadosConSegundoApellidoDiazOMorenoSinIN()
BEGIN
    SELECT *
    FROM empleado
    WHERE apellido2 = 'Díaz' OR apellido2 = 'Moreno';
END //

-- 34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
CREATE PROCEDURE EmpleadosConSegundoApellidoDiazOMorenoConIN()
BEGIN
    SELECT *
    FROM empleado
    WHERE apellido2 IN ('Díaz', 'Moreno');
END //

-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
CREATE PROCEDURE EmpleadosEnDepartamento3()
BEGIN
    SELECT nombre, apellido1, apellido2, nif
    FROM empleado
    WHERE id_departamento = 3;
END //

-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
CREATE PROCEDURE EmpleadosEnDepartamentos245()
BEGIN
    SELECT nombre, apellido1, apellido2, nif
    FROM empleado
    WHERE id_departamento IN (2, 4, 5);
END //

DELIMITER ;
-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual.
CALL ListaPresupuestoActual();

-- 12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
CALL ListaPresupuestoActualOrdenado();

-- 13. Lista el nombre de todos los departamentos ordenados de forma ascendente.
CALL ListaDepartamentosAscendente();

-- 14. Lista el nombre de todos los departamentos ordenados de forma descendente.
CALL ListaDepartamentosDescendente();

-- 15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética.
CALL ListaEmpleadosOrdenados();

-- 16. Devuelve una lista con el nombre y el presupuesto de los 3 departamentos con mayor presupuesto.
CALL Top3DepartamentosMayorPresupuesto();

-- 17. Devuelve una lista con el nombre y el presupuesto de los 3 departamentos con menor presupuesto.
CALL Top3DepartamentosMenorPresupuesto();

-- 18. Devuelve una lista con el nombre y el gasto de los 2 departamentos con mayor gasto.
CALL Top2DepartamentosMayorGasto();

-- 19. Devuelve una lista con el nombre y el gasto de los 2 departamentos con menor gasto.
CALL Top2DepartamentosMenorGasto();

-- 20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado.
CALL Lista5EmpleadosDesdeTerceraFila();

-- 21. Devuelve una lista con el nombre de los departamentos y el presupuesto mayor o igual a 150000 euros.
CALL DepartamentosPresupuestoMayor150000();

-- 22. Devuelve una lista con el nombre de los departamentos y el gasto menor a 5000 euros.
CALL DepartamentosGastosMenor5000();

-- 23. Devuelve una lista con el nombre de los departamentos y el presupuesto entre 100000 y 200000 euros. (Sin BETWEEN)
CALL DepartamentosPresupuestoEntre100kY200kSinBetween();

-- 24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. (Sin BETWEEN)
CALL DepartamentosPresupuestoNoEntre100kY200kSinBetween();

-- 25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. (Con BETWEEN)
CALL DepartamentosPresupuestoEntre100kY200kConBetween();

-- 26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. (Con BETWEEN)
CALL DepartamentosPresupuestoNoEntre100kY200kConBetween();

-- 27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, donde los gastos son mayores que el presupuesto.
CALL DepartamentosGastosMayoresQuePresupuesto();

-- 28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, donde los gastos son menores que el presupuesto.
CALL DepartamentosGastosMenoresQuePresupuesto();

-- 29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, donde los gastos son iguales al presupuesto.
CALL DepartamentosGastosIgualesQuePresupuesto();

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
CALL EmpleadosConSegundoApellidoNull();

-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
CALL EmpleadosConSegundoApellidoNoNull();

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
CALL EmpleadosConSegundoApellidoLopez();

-- 33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. (Sin IN)
CALL EmpleadosConSegundoApellidoDiazOMorenoSinIN();

-- 34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. (Con IN)
CALL EmpleadosConSegundoApellidoDiazOMorenoConIN();

-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
CALL EmpleadosEnDepartamento3();

-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
CALL EmpleadosEnDepartamentos245();

