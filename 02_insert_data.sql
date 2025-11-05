INSERT INTO productos (nombre, precio, stock) VALUES
    ('Laptop Pro', 1500.00, 20),
    ('Mouse Gamer', 80.00, 50),
    ('Teclado Mecánico', 120.00, 5),
    ('Monitor 4K', 450.00, 15),
    ('Silla Ergonómica', 250.00, 8);

INSERT INTO departamentos (nombre_depto) VALUES
    ('Ventas'),
    ('Ingeniería'),
    ('Marketing');

INSERT INTO empleados (nombre_empleado, email, fecha_contratacion, departamento_id) VALUES
    ('Ana Gómez', 'ana.gomez@empresa.com', '2023-01-15', 1),
    ('Luis Torres', 'luis.torres@empresa.com', '2022-05-30', 2),
    ('Carla Díaz', 'carla_diaz@otro.com', '2023-11-05', 1),
    ('Pedro Mora', 'pedro.mora', '2024-02-20', 2),
    ('Sofía Lara', 'sofia.lara@marketing.dev', '2024-07-01', 3);
