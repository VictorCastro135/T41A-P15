CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0
);

CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nombre_depto VARCHAR(100) NOT NULL
);

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre_empleado VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    fecha_contratacion DATE NOT NULL,
    departamento_id INT REFERENCES departamentos(id)
);
