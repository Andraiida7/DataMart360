-- Database: datamart360

-- DROP DATABASE IF EXISTS datamart360;

CREATE DATABASE datamart360
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Ecuador.1252'
    LC_CTYPE = 'Spanish_Ecuador.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

----------------------------------------------------------------------------------
-------------------------------CREACION DE TABLAS---------------------------------
----------------------------------------------------------------------------------

--TABLA CLIENTES
	CREATE TABLE clientes (
	    id_cliente BIGSERIAL,
	    numero_identificacion VARCHAR(20),
	    nombre_completo VARCHAR(150) NOT NULL,
	    correo_electronico VARCHAR(100),
	    telefono VARCHAR(20),
	    direccion TEXT,
	    
	    -- Campos de Auditoría y Estado
	    activo BOOLEAN DEFAULT TRUE NOT NULL,
	    creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
	    modificado_por VARCHAR(50),
	
	    -- Restricciones (Constraints)
	    CONSTRAINT pk_clientes PRIMARY KEY (id_cliente),
	    CONSTRAINT uq_clientes_identificacion UNIQUE (numero_identificacion)
	);


--TABLA METODOS_PAGO
	CREATE TABLE metodos_pago (
	    id_metodo_pago BIGSERIAL,
	    nombre VARCHAR(50) NOT NULL,
	
	    -- Campos de auditoría y estado
	    activo BOOLEAN DEFAULT TRUE NOT NULL,
	    creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
	    modificado_por VARCHAR(50),
	
	    -- Restricciones (Constraints)
	    CONSTRAINT pk_metodos_pago PRIMARY KEY (id_metodo_pago),
	    CONSTRAINT uq_metodos_pago_nombre UNIQUE (nombre)
	);


--TABLA SUCURSALES
	CREATE TABLE sucursales(
		id_sucursal BIGSERIAL,
		nombre VARCHAR(100) NOT NULL,
		direccion TEXT NOT NULL,
	
		--Campos de auditoria y estado
		activo BOOLEAN DEFAULT TRUE NOT NULL,
		creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
		modificado_por VARCHAR(50),
	
		--Restriccion
		CONSTRAINT pk_sucursales PRIMARY KEY (id_sucursal)
	);

--TABLA CATEGORIAS
	CREATE TABLE categorias(
		id_categoria BIGSERIAL,
		nombre VARCHAR(100) NOT NULL,
		descripcion TEXT,
	
		--Campos de auditoria y estado
		activo BOOLEAN DEFAULT TRUE NOT NULL,
		creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
		modificado_por VARCHAR(50),
	
		--Restricciones
		CONSTRAINT pk_categorias PRIMARY KEY (id_categoria),
		CONSTRAINT uq_nombre_categorias UNIQUE (nombre)
	);

--TABLA PROVEEDORES
	CREATE TABLE proveedores(
		id_proveedor BIGSERIAL,
		identificacion_fiscal VARCHAR(20) NOT NULL,
		razon_social VARCHAR(150) NOT NULL,
		nombre_contacto VARCHAR(100),
		telefono VARCHAR(20),
		correo VARCHAR(100),
		direccion TEXT,
	
		--Campos de auditoria y estado
		activo BOOLEAN DEFAULT TRUE NOT NULL,
		creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
		modificado_por VARCHAR(50),
	
		--Restricciones
		CONSTRAINT pk_proveedores PRIMARY KEY (id_proveedor),
		CONSTRAINT uq_proveedores_fiscal UNIQUE (identificacion_fiscal)
	);

--TABLA PROMOCIONES
	CREATE TABLE promociones (
	    id_promocion BIGSERIAL,
	    nombre_campana VARCHAR(100) NOT NULL, 
	    descripcion TEXT,
	    porcentaje_descuento NUMERIC(5,2) DEFAULT 0.00,
	    monto_descuento_fijo NUMERIC(12,2) DEFAULT 0.00,
	    fecha_inicio TIMESTAMPTZ NOT NULL,
	    fecha_fin TIMESTAMPTZ NOT NULL,
	
	    -- Campos de auditoría y estado
	    activo BOOLEAN DEFAULT TRUE NOT NULL,
	    creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
	    modificado_por VARCHAR(50),
	
	    -- Restricciones (Constraints)
	    CONSTRAINT pk_promociones PRIMARY KEY (id_promocion),
	    CONSTRAINT ck_promo_porcentaje CHECK (porcentaje_descuento BETWEEN 0.00 AND 100.00),
	    CONSTRAINT ck_promo_fechas CHECK (fecha_fin > fecha_inicio)
	);

--TABLA EMPLEADOS
	CREATE TABLE empleados(
		id_empleado BIGSERIAL,
		numero_identificacion VARCHAR(20) NOT NULL,
		nombre_completo VARCHAR(150) NOT NULL,
		cargo VARCHAR(50) NOT NULL,
		telefono VARCHAR(20),
		correo VARCHAR(100), 
		fecha_contratacion DATE NOT NULL,

		--Campos de auditoria y estado
		activo BOOLEAN DEFAULT TRUE NOT NULL,
		creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
		modificado_por VARCHAR(50),

		--Restricciones
		CONSTRAINT pk_empleados PRIMARY KEY (id_empleado),
		CONSTRAINT uq_empleados_identificacion UNIQUE (numero_identificacion)
	);

--TABLA PRODUCTOS
	CREATE TABLE productos (
	    id_producto BIGSERIAL,
	    codigo_barras VARCHAR(50) NOT NULL,
	    nombre VARCHAR(150) NOT NULL,
	    descripcion TEXT,
	    id_categoria BIGINT NOT NULL, -- <--- Esta columna guardará el ID de la categoría
	    precio_venta_actual NUMERIC(12,2) NOT NULL,
	    stock_minimo_alerta NUMERIC(10,3) DEFAULT 0.000,
	
	    -- Campos de auditoría y estado
	    activo BOOLEAN DEFAULT TRUE NOT NULL,
	    creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
	    modificado_por VARCHAR(50),
	
	    -- Restricciones (Constraints)
	    CONSTRAINT pk_productos PRIMARY KEY (id_producto),
	    CONSTRAINT uq_productos_codigo_barras UNIQUE (codigo_barras),
	    
	    -- ¡La regla de oro del precio positivo!
	    CONSTRAINT ck_productos_precio_positivo CHECK (precio_venta_actual > 0),
	    
	    -- ¡Aquí hacemos la magia de la conexión física!
	    CONSTRAINT fk_productos_categorias FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
	);

--TABLA USUARIOS_SISTEMA
	CREATE TABLE usuarios_sistema (
	    id_usuario_sistema BIGSERIAL,
	    id_empleado BIGINT NOT NULL,
	    username VARCHAR(50) NOT NULL,
	    password_hash VARCHAR(255) NOT NULL,
	    rol VARCHAR(30) NOT NULL,
	
	    -- Campos de auditoría y estado
	    activo BOOLEAN DEFAULT TRUE NOT NULL,
	    creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
	    modificado_por VARCHAR(50),
	
	    -- Restricciones (Constraints)
	    CONSTRAINT pk_usuarios_sistema PRIMARY KEY (id_usuario_sistema),
	    CONSTRAINT uq_usuario_empleado UNIQUE (id_empleado), -- Garantiza relación 1 a 1 (un empleado, un usuario)
	    CONSTRAINT fk_usuarios_empleados FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado), -- Conecta con empleados
	    CONSTRAINT uq_usuarios_username UNIQUE (username) -- Evita nombres de usuario duplicados
	);

--TABLA TARJETAS_FIDELIZACION
	CREATE TABLE tarjetas_fidelizacion(
		id_tarjeta BIGSERIAL,
		id_cliente BIGINT NOT NULL,
		codigo_tarjeta VARCHAR(50) NOT NULL,
		puntos_acumulados INT NOT NULL DEFAULT 0,
		fecha_afiliacion TIMESTAMPTZ NOT NULL,

		--Campos de auditoria y estado
		activo BOOLEAN DEFAULT TRUE NOT NULL,
		creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
		modificado_por VARCHAR(50),

		--Restricciones
		CONSTRAINT pk_tarjetas_fidelizacion PRIMARY KEY (id_tarjeta),
		CONSTRAINT fk_tarjetas_fidelizacion_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
		CONSTRAINT uq_tarjeta_cliente UNIQUE (id_cliente),
		CONSTRAINT uq_codigo_tarjeta UNIQUE (codigo_tarjeta),
		CONSTRAINT ck_puntos_no_negativos CHECK (puntos_acumulados >=0)
		
	);

--TABLA FACTURAS cabecera
	CREATE TABLE facturas(
		id_factura BIGSERIAL,
		numero_factura VARCHAR(20) NOT NULL,
		fecha_emision TIMESTAMPTZ NOT NULL,
		id_cliente BIGINT,
		id_metodo_pago BIGINT,
		id_sucursal BIGINT,

		--Totales base
		subtotal_neto NUMERIC(12,2) NOT NULL,
		total_descuento NUMERIC(12,2) NOT NULL,
		total_impuesto NUMERIC(12,2) NOT NULL,
		total_pagar NUMERIC(12,2) NOT NULL,

		--Campos de auditoria y estado
		creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
		modificado_por VARCHAR(50),

		--Restricciones
		CONSTRAINT pk_facturas PRIMARY KEY (id_factura),
		CONSTRAINT uq_facturas_numero UNIQUE (numero_factura),
		CONSTRAINT fk_facturas_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
		CONSTRAINT fk_facturas_metodos_pago FOREIGN KEY (id_metodo_pago) REFERENCES metodos_pago (id_metodo_pago),
		CONSTRAINT fk_facturas_sucursal FOREIGN KEY (id_sucursal)  REFERENCES sucursales(id_sucursal),
		
		-- Validaciones de seguridad (Evitamos montos negativos y números de factura vacíos)
	    CONSTRAINT ck_factura_valores_positivos CHECK (subtotal_neto >= 0 AND total_descuento >= 0 AND total_impuesto >= 0 AND total_pagar >= 0),
	    CONSTRAINT ck_numero_factura_no_vacio CHECK (LENGTH(TRIM(numero_factura)) > 0)
	);

--TABLA COMPRAS
	CREATE TABLE compras(
		id_compra BIGSERIAL,
		id_proveedor BIGINT NOT NULL,
		id_sucursal BIGINT NOT NULL,
		numero_factura_proveedor VARCHAR(50) NOT NULL,
		fecha_compra TIMESTAMPTZ NOT NULL,

		--Totales base
		subtotal NUMERIC(12,2) NOT NULL,
		impuesto NUMERIC(12,2) NOT NULL,
		total_pagado NUMERIC(12,2) NOT NULL,

		--Campos de auditoria y estado
		creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
		modificado_por VARCHAR(50),

		--Restricciones
		CONSTRAINT pk_compras PRIMARY KEY (id_compra),
		CONSTRAINT fk_compras_proveedores FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
		CONSTRAINT fk_compras_sucursales FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),

		-- Validaciones lógicas (Checks)
  	 	CONSTRAINT ck_compras_valores_positivos CHECK (subtotal >= 0 AND impuesto >= 0 AND total_pagado >= 0),
  	  	CONSTRAINT ck_num_factura_prov_no_vacio CHECK (LENGTH(TRIM(numero_factura_proveedor)) > 0),
    
    -- Evita registrar la misma factura del mismo proveedor dos veces (control de duplicados)
 	   CONSTRAINT uq_proveedor_factura UNIQUE (id_proveedor, numero_factura_proveedor)
	);

--TABLA DESPACHO_SUCURSALES
	CREATE TABLE despachos_sucursales (
	    id_despacho_sucursal BIGSERIAL,
	    id_sucursal_origen BIGINT NOT NULL,
	    id_sucursal_destino BIGINT NOT NULL,
	    fecha_despacho TIMESTAMPTZ NOT NULL,
	    documento_remision VARCHAR(50),
	    estado VARCHAR(20) NOT NULL, -- Lo hacemos obligatorio para controlar el flujo
	
	    -- Campos de auditoría y estado
	    creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
	    modificado_por VARCHAR(50),
	
	    -- Restricciones (Constraints)
	    CONSTRAINT pk_despachos_sucursales PRIMARY KEY (id_despacho_sucursal), -- Sintaxis corregida
	    
	    -- Ambas llaves foráneas apuntan correctamente a la misma tabla sucursales. ¡Brillante!
	    CONSTRAINT fk_despachos_origen FOREIGN KEY (id_sucursal_origen) REFERENCES sucursales(id_sucursal),
	    CONSTRAINT fk_despachos_destino FOREIGN KEY (id_sucursal_destino) REFERENCES sucursales(id_sucursal), -- Corregido el punto por coma
	    
	    CONSTRAINT uq_despachos_remision UNIQUE (documento_remision),
	    
	    -- ¡Regla de oro de la logística! Evita despacharse a la misma sucursal
	    CONSTRAINT ck_despachos_origen_destino_distintos CHECK (id_sucursal_origen <> id_sucursal_destino),
	    
	    -- Controlamos que el estado solo sea uno de los permitidos por tu negocio
	    CONSTRAINT ck_despachos_estado_valido CHECK (estado IN ('Borrador', 'En Transito', 'Entregado', 'Anulado'))
	);

--TABLA DETALLES_FACTURAS
	CREATE TABLE detalles_facturas(
		id_detalle_factura BIGSERIAL,
		id_factura BIGINT NOT NULL,
		id_producto BIGINT NOT NULL,
		cantidad NUMERIC(10,3) NOT NULL,
		precio_unitario_historico NUMERIC(12,2) NOT NULL,
		descuento_aplicado NUMERIC(12,2) DEFAULT 0.00,
		impuesto_aplicado NUMERIC(12,2) NOT NULL,

		-- Campos de auditoría y estado
	    creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
	    modificado_por VARCHAR(50),

		--Restricciones
		CONSTRAINT pk_detalles_facturas PRIMARY KEY (id_detalle_factura),
		CONSTRAINT fk_detalles_facturas_facturas FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
		CONSTRAINT fk_detalles_facturas_productos FOREIGN KEY (id_producto) REFERENCES productos(id_producto),

		-- Validaciones de seguridad para evitar errores de digitación o bugs
		CONSTRAINT ck_detalles_facturas_valores_positivos CHECK (cantidad > 0 AND precio_unitario_historico >= 0 AND descuento_aplicado >= 0 AND impuesto_aplicado >= 0)
	);

--TABLA INVENTARIOS
	CREATE TABLE inventarios(
		id_inventario BIGSERIAL,
		id_sucursal BIGINT NOT NULL,
		id_producto BIGINT NOT NULL,
		stock_actual NUMERIC(10,3) DEFAULT 0.000 NOT NULL,

		--Campos de auditoria y estado
		creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
		creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
		modificado_por VARCHAR (50),

		--Restricciones
		CONSTRAINT pk_inventarios PRIMARY KEY (id_inventario),
		CONSTRAINT fk_inventarios_sucursales FOREIGN KEY (id_sucursal) REFERENCES sucursales (id_sucursal),
		CONSTRAINT fk_inventarios_productos FOREIGN KEY (id_producto) REFERENCES productos (id_producto),
		CONSTRAINT uq_sucursal_productos UNIQUE (id_sucursal, id_producto),
		CONSTRAINT ck_inventarios_stock_no_negativo CHECK (stock_actual >=0)
		
	);

--TABLA DETALLES_DESPACHOS
	CREATE TABLE detalles_despachos (
	    id_detalle_despacho BIGSERIAL,
	    id_despacho_sucursal BIGINT NOT NULL,
	    id_producto BIGINT NOT NULL,
	    cantidad_enviada NUMERIC(10,3) NOT NULL,
	    cantidad_recibida NUMERIC(10,3),
	
	    -- Campos de auditoría
	    creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    creado_por VARCHAR(50) DEFAULT 'system' NOT NULL, -- Corregido de creador_por
	    modificado_por VARCHAR(50),
	
	    -- Restricciones (Constraints)
	    CONSTRAINT pk_detalles_despachos PRIMARY KEY (id_detalle_despacho),
	    CONSTRAINT fk_detalles_despachos_despachos_sucursales FOREIGN KEY (id_despacho_sucursal) REFERENCES despachos_sucursales(id_despacho_sucursal),
	    CONSTRAINT fk_detalles_despachos_productos FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
	    
	    -- Validaciones de cantidades
	    CONSTRAINT ck_detalles_despachos_envio_positivo CHECK (cantidad_enviada > 0),
	    CONSTRAINT ck_detalles_despachos_recibo_positivo CHECK (cantidad_recibida >= 0.000),
	    
	    -- Regla de oro de la física y la logística: No puedes recibir más de lo que enviaste
	    CONSTRAINT ck_recibido_menor_o_igual_enviado CHECK (cantidad_recibida <= cantidad_enviada)
	);
	
--TABLA DETALLES_COMPRAS
	CREATE TABLE detalles_compras (
	    id_detalle_compra BIGSERIAL,
	    id_compra BIGINT NOT NULL,
	    id_producto BIGINT NOT NULL,
	    cantidad_recibida NUMERIC(10,3) NOT NULL,
	    costo_unitario_compra NUMERIC(12,2) NOT NULL,
	
	    -- Campos de auditoría (Limpiados caracteres de formato invisibles)
	    creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
	    modificado_por VARCHAR(50),
	
	    -- Restricciones (Constraints)
	    CONSTRAINT pk_detalles_compras PRIMARY KEY (id_detalle_compra), -- Ajustado nombre para consistencia
	    CONSTRAINT fk_detalles_compras_compras FOREIGN KEY (id_compra) REFERENCES compras(id_compra),
	    CONSTRAINT fk_detalles_compras_productos FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
	    CONSTRAINT ck_compras_cantidad_positiva CHECK (cantidad_recibida > 0),
	    CONSTRAINT ck_compras_costo_positiva CHECK (costo_unitario_compra > 0)
	);

--TABLA PRODUCTOS_PROMOCIONES
		CREATE TABLE productos_promociones (
	    id_producto_promocion BIGSERIAL,
	    id_producto BIGINT NOT NULL,
	    id_promocion BIGINT NOT NULL,
	
	    -- Campos de auditoría y estado
	    activo BOOLEAN DEFAULT TRUE NOT NULL,
	    creado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    modificado_en TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
	    creado_por VARCHAR(50) DEFAULT 'system' NOT NULL,
	    modificado_por VARCHAR(50),
	
	    -- Restricciones (Constraints)
	    CONSTRAINT pk_productos_promociones PRIMARY KEY (id_producto_promocion),
	    
	    -- Llaves foráneas (Conexión con las tablas maestras)
	    CONSTRAINT fk_prod_promo_productos FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
	    CONSTRAINT fk_prod_promo_promociones FOREIGN KEY (id_promocion) REFERENCES promociones(id_promocion),
	    
	    -- ¡Regla de oro! Evita asignar la misma promoción al mismo producto más de una vez
	    CONSTRAINT uq_producto_promocion UNIQUE (id_producto, id_promocion)
	);

--TABLA AUDITORIA_SISTEMA
	CREATE TABLE auditoria_sistema(
		id_auditoria_sistema BIGSERIAL,
		id_usuario_sistema BIGINT NOT NULL,
		accion_realizada VARCHAR(50) NOT NULL,
		tabla_afectada VARCHAR (50) NOT NULL,
		registro_id BIGINT NOT NULL,
		valores_anteriores JSONB,
		valores_nuevos JSONB,
		fecha_hora TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,

		--Restriccion
		CONSTRAINT pk_auditoria_sistema PRIMARY KEY (id_auditoria_sistema),
		CONSTRAINT fk_auditoria_sistema_usuario_sistema FOREIGN KEY (id_usuario_sistema) REFERENCES usuarios_sistema(id_usuario_sistema)
	);

