CREATE OR REPLACE FUNCTION fn_calcular_descuento(
    p_precio_original DECIMAL(10, 2),
    p_porcentaje DECIMAL(5, 2)
)
RETURNS DECIMAL(10, 2) AS $$
BEGIN
    RETURN p_precio_original * (1 - (p_porcentaje / 100));
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_validar_email(
    p_texto TEXT
)
RETURNS BOOLEAN AS $$
BEGIN
    RETURN p_texto LIKE '%@%';
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_buscar_stock_bajo(
    p_cantidad_minima INT
)
RETURNS SETOF productos AS $$
BEGIN
    RETURN QUERY
    SELECT *
    FROM productos
    WHERE stock < p_cantidad_minima
    ORDER BY stock;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_dia_de_la_semana(
    p_fecha DATE
)
RETURNS TEXT AS $$
BEGIN
    RETURN TRIM(to_char(p_fecha, 'Day'));
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_contar_empleados_depto(
    p_depto_id INT
)
RETURNS INT AS $$
DECLARE
    v_conteo INT;
BEGIN
    SELECT COUNT(*)
    INTO v_conteo
    FROM empleados
    WHERE departamento_id = p_depto_id;
    
    RETURN v_conteo;
END;
$$ LANGUAGE plpgsql;
