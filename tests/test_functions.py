import psycopg2
import pytest
from decimal import Decimal
import datetime

DB_CONFIG = {
    "dbname": "test_db",
    "user": "postgres",
    "password": "postgres",
    "host": "localhost",
    "port": 5432
}

@pytest.fixture
def db_connection():
    conn = psycopg2.connect(**DB_CONFIG)
    yield conn
    conn.rollback()
    conn.close()

def test_fn_calcular_descuento(db_connection):
    with db_connection.cursor() as cur:
        cur.execute("SELECT fn_calcular_descuento(100.00, 20.0);")
        result = cur.fetchone()[0]
        assert result == Decimal('80.00')
        
        cur.execute("SELECT fn_calcular_descuento(1500.00, 10.5);")
        result = cur.fetchone()[0]
        assert result == Decimal('1342.50')

def test_fn_validar_email(db_connection):
    with db_connection.cursor() as cur:
        cur.execute("SELECT fn_validar_email('test@ejemplo.com');")
        assert cur.fetchone()[0] == True
        
        cur.execute("SELECT fn_validar_email('texto.invalido.com');")
        assert cur.fetchone()[0] == False
        
        cur.execute("SELECT email FROM empleados WHERE id = 4;")
        email_invalido = cur.fetchone()[0]
        cur.execute("SELECT fn_validar_email(%s);", (email_invalido,))
        assert cur.fetchone()[0] == False

def test_fn_buscar_stock_bajo(db_connection):
    with db_connection.cursor() as cur:
        cur.execute("SELECT * FROM fn_buscar_stock_bajo(10);")
        results = cur.fetchall()
        
        assert len(results) == 2
        
        nombres = {row[1] for row in results}
        assert nombres == {'Teclado Mecánico', 'Silla Ergonómica'}

def test_fn_dia_de_la_semana(db_connection):
    with db_connection.cursor() as cur:
        fecha_prueba = datetime.date(2025, 11, 5) 
        cur.execute("SELECT fn_dia_de_la_semana(%s);", (fecha_prueba,))
        assert cur.fetchone()[0] == 'Wednesday'

def test_fn_contar_empleados_depto(db_connection):
    with db_connection.cursor() as cur:
        cur.execute("SELECT fn_contar_empleados_depto(1);")
        assert cur.fetchone()[0] == 2
        
        cur.execute("SELECT fn_contar_empleados_depto(2);")
        assert cur.fetchone()[0] == 2
        
        cur.execute("SELECT fn_contar_empleados_depto(3);")
        assert cur.fetchone()[0] == 1
