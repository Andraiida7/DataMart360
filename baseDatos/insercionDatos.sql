-------------------------------------------------------------
--------------------INSERCIÓN DE DATOS-----------------------
-------------------------------------------------------------
TRUNCATE TABLE empleados RESTART IDENTITY CASCADE; 

TRUNCATE TABLE 
    auditoria_sistema,
    productos_promociones,
    detalles_compras,
    detalles_despachos,
    inventarios,
    detalles_facturas,
    despachos_sucursales,
    compras,
    facturas,
    tarjetas_fidelizacion,
    usuarios_sistema,
    productos,
    empleados,
    promociones,
    proveedores,
    categorias,
    sucursales,
    metodos_pago,
    clientes
RESTART IDENTITY CASCADE;

-------------CATEGORIAS-----------------
----------------------------------------
INSERT INTO categorias (nombre, descripcion) VALUES
('Lácteos', 'Leche, quesos, yogures y derivados lácteos.'),
('Carnes', 'Cortes de carne vacuna, porcina, aves y otras carnes frescas.'),
('Embutidos', 'Jamones, salchichas, chorizos y carnes frías.'),
('Bebidas', 'Jugos, refrescos, aguas y bebidas con o sin alcohol.'),
('Panadería', 'Pan fresco, pasteles, galletas y productos de repostería.'),
('Frutas', 'Frutas frescas y de temporada.'),
('Verduras', 'Vegetales, hortalizas y legumbres frescas.'),
('Limpieza', 'Detergentes, desinfectantes y utensilios para el aseo del hogar.'),
('Aseo Personal', 'Champús, jabones, desodorantes y productos de higiene corporal.'),
('Mascotas', 'Alimento, juguetes y accesorios para animales de compañía.'),
('Congelados', 'Alimentos listos, helados y productos que requieren congelación.'),
('Electrónica', 'Dispositivos, cables, accesorios y tecnología en general.'),
('Hogar', 'Decoración, utensilios de cocina y organización para el hogar.'),
('Papelería', 'Cuadernos, lápices, repuestos y útiles de oficina o escolares.'),
('Bebés', 'Pañales, fórmulas, papillas y cuidado para los más pequeños.');

-- Agregar categoría Abarrotes si no existe
INSERT INTO categorias (nombre, descripcion) VALUES
('Abarrotes y Despensa', 'Arroz, aceites, enlatados, salsas y granos');


--------------------METODOS DE PAGO---------------------------
--------------------------------------------------------------
INSERT INTO metodos_pago (nombre) VALUES
('Efectivo'),
('Tarjeta de Débito'),
('Tarjeta de Crédito'),
('Transferencia'),
('Billetera Digital');


------------------------SUCURSALES-----------------------------
---------------------------------------------------------------
INSERT INTO sucursales (nombre, direccion) VALUES
-- 1. La Bodega Principal de Despacho (Centralizada en Quito para logística)
('Bodega Principal de Despachos', 'Av. Galo Plaza Lasso N56-12 y Cap. Ramón Borja, Sector Industrial, Quito'),

-- 2. Sucursales en Quito
('Sucursal Quito Norte', 'Av. Amazonas N34-102 y Av. Atahualpa, Sector Iñaquito, Quito'),
('Sucursal Quito Centro', 'Calle Guayaquil N6-45 y Espejo, Centro Histórico, Quito'),
('Sucursal Quito Sur', 'Av. Teniente Hugo Ortiz S23-89 y Av. Mariscal Sucre, Sector El Recreo, Quito'),

-- 3. Sucursales en Guayaquil
('Sucursal Guayaquil Urdesa', 'Av. Víctor Emilio Estrada 402 y Las Monjas, Guayaquil'),
('Sucursal Guayaquil Samborondón', 'Av. Samborondón Km 2.5, Centro Comercial Plaza Lagos, Guayaquil'),
('Sucursal Guayaquil Centro', 'Av. 9 de Octubre 1205 y Pedro Carbo, Guayaquil'),

-- 4. Sucursales en Cuenca
('Sucursal Cuenca El Sagrario', 'Calle Bolívar 7-23 y Borrero, Sector Parque Calderón, Cuenca'),
('Sucursal Cuenca Yanuncay', 'Av. Primero de Mayo y Av. De las Américas, Cuenca'),

-- 5. Sucursales en Riobamba
('Sucursal Riobamba Centro', 'Av. Daniel León Borja y Calle Carabobo, Riobamba'),
('Sucursal Riobamba Norte', 'Av. Lizarzaburu Km 1.5, Sector La Politécnica, Riobamba'),

-- 6. Sucursales en Latacunga
('Sucursal Latacunga Centro', 'Calle Guayaquil 5-12 y Sánchez de Orellana, Latacunga'),
('Sucursal Latacunga San Felipe', 'Av. Eloy Alfaro y Calle Cotopaxi, Sector San Felipe, Latacunga');


--------------------------------PROVEEDORES--------------------------
---------------------------------------------------------------------

INSERT INTO proveedores (identificacion_fiscal, razon_social, nombre_contacto, telefono, correo, direccion) VALUES
-- Los 10 ejemplos principales
('1790051833001', 'PROCESADORA NACIONAL DE ALIMENTOS C.A. PRONACA', 'Carlos Proaño', '023974500', 'contacto@pronaca.com', 'Av. Los Granados E12-70 y Av. 6 de Diciembre, Quito'),
('1790011521001', 'NESTLE ECUADOR S.A.', 'María Fernanda Gómez', '023963100', 'servicio.cliente@ec.nestle.com', 'Av. Simón Bolívar, Complejo Ekopark, Torre 2, Quito'),
('1390013254001', 'LA FABRIL S.A.', 'Santiago Cevallos', '052622200', 'ventas@lafabril.com.ec', 'Av. Interbarrial, Km 5.5, Manta'),
('0990015945001', 'UNILEVER ANDINA ECUADOR S.A.', 'Lorena Andrade', '042594000', 'compras@unilever.com.ec', 'Av. Las Doblas Km 10.5 Vía a Daule, Guayaquil'),
('1790017414001', 'COLGATE-PALMOLIVE DEL ECUADOR S.A.', 'Jorge Espinoza', '022986400', 'proveedores@colgate.com', 'Av. de los Shyris N35-174 y Suecia, Edificio Renazzo, Quito'),
('0990005729001', 'ARCA CONTINENTAL ECUADOR (ACBEVERAGES)', 'Paulina Jácome', '043712000', 'abastecimiento@arcacontal.com', 'Vía a Daule Km 11.5, Guayaquil'),
('1790022418001', 'INDUSTRIAS ALES C.A. / DANEC S.A.', 'Andrés Valenzuela', '023991200', 'danec@danec.com', 'Av. Río Coca E11-63 y De los Granados, Quito'),
('1790025735001', 'MODERNA ALIMENTOS S.A.', 'Gabriela Terán', '023826000', 'info@moderna.com.ec', 'Av. General Enríquez 2854, Sangolquí'),
('0990861110001', 'INDUSTRIAS LACTEAS TONI S.A.', 'Diego Palacios', '042590200', 'tonidec@toni.com.ec', 'Vía a Daule Km 7.5, Guayaquil'),
('1290038514001', 'ORIENTAL INDUSTRIA ALIMENTICIA OIALSA S.A.', 'Wilson León', '052760220', 'ventas@oriental.com.ec', 'Km 2.5 Vía a Valencia, Quevedo'),

-- Proveedores de Alimentos y Bebidas (Consumo Masivo)
('1790012234001', 'COMPAÑIA DE CERVECERIAS NACIONALES C.N. S.A.', 'Sebastián Noboa', '023966000', 'proveedores@cervecerianacional.ec', 'Av. de los Shyris y Naciones Unidas, Quito'),
('0990021317001', 'SOCIEDAD INDUSTRIAL GANADERA EL ORDEÑO S.A.', 'Patricia Ortiz', '023947800', 'contacto@elordeno.com.ec', 'Av. Amazonas N21-147 y Roca, Quito'),
('0190011425001', 'PASTEURIZADORA QUITO S.A.', 'Fernando Rosero', '022652100', 'abasto@pquito.com.ec', 'Av. Maldonado S34-110, Sector Guajaló, Quito'),
('1790456123001', 'PULPA DE FRUTAS ECUATORIANAS FRUTAL S.A.', 'Ana Belén Ruiz', '022415120', 'compras@frutal.com', 'Panamericana Norte Km 11.5, Carapungo, Quito'),
('0992314567001', 'CONSERVAS ISABEL ECUADOR S.A.', 'Manuel Delgado', '052621450', 'isabel@isabel.com.ec', 'Vía Rocafuerte Km 4.5, Manta'),
('1391746251001', 'TEALDO & CO. S.A. (FACUNDO)', 'Ricardo Falconí', '042512100', 'proveedores@facundo.com.ec', 'Av. Juan Tanca Marengo Km 4.5, Guayaquil'),
('1791245789001', 'ILLESCASEM SEMILLAS Y CEREALES', 'Mónica Illescas', '072834510', 'ventas@illescasem.com', 'Av. de las Américas y Primero de Mayo, Cuenca'),
('0190001247001', 'CONSORCIO ALIMENTICIO CUENCANO CONALCA S.A.', 'Esteban Jara', '074135200', 'contacto@conalca.com', 'Parque Industrial, Calle de la Plata, Cuenca'),
('0991345678001', 'IMPORTADORA EL ROSADO S.A. (PROVEEDOR)', 'Christian Gómez', '042564000', 'compras@elrosado.com', 'Av. 9 de Octubre y Boyacá, Guayaquil'),
('1790076543001', 'JARRIN HERRERA & ASOCIADOS (CAFÉ MINERVA)', 'Valeria Jarrín', '022401800', 'minerva@minerva.com.ec', 'Av. Galo Plaza Lasso N66-11 y De los Eucaliptos, Quito'),

-- Proveedores de Cuidado Personal, Limpieza y Químicos
('1790035412001', 'KIMBERLY-CLARK ECUADOR S.A.', 'Diana Larrea', '023992500', 'ventas.kcc@kcc.com', 'Av. República del Salvador N35-82, Quito'),
('0990087452001', 'PROCTER & GAMBLE ECUADOR P&G', 'Javier Mendoza', '042598800', 'pg.proveedores@pg.com', 'Av. Joaquín Orrantia, Edificio Trade Building, Guayaquil'),
('1791823456001', 'JABONERIA NACIONAL S.A.', 'Raúl Espín', '042800300', 'compras@jaboneria.com.ec', 'Vía a Daule Km 5.5, Guayaquil'),
('1790021432001', 'RECKITT BENCKISER ECUADOR S.A.', 'Katherine Vaca', '022987100', 'reckitt@reckitt.com.ec', 'Av. 12 de Octubre N24-528 y Lincoln, Quito'),
('0991212456001', 'LACOSMETICA S.A. (PRODUCTOS DE BELLEZA)', 'Sofía Montenegro', '042883344', 'smontenegro@lacosmetica.ec', 'Parque Industrial Sauces, Guayaquil'),
('1792345123001', 'QUIMICA SUIZA INDUSTRIAL (QSI) ECUADOR S.A.', 'Roberto Ortiz', '023961900', 'qsi@qsi.com.ec', 'Av. De los Eucaliptos N3-14 y Av. Galo Plaza, Quito'),
('0992384756001', 'DISTRIBUIDORA DEL PACIFICO DIPAC S.A.', 'Silvia Carrión', '042204560', 'contacto@dipac.com', 'Av. Juan Tanca Marengo y Rodrigo de Chávez, Guayaquil'),
('1891726354001', 'PRODU QUIMICOS Ambato S.A.', 'Guillermo Zurita', '032410220', 'ventas@produquimicos.com', 'Av. Víctor Hugo y Los Chasquis, Ambato'),
('0691723541001', 'QUIMICOS DEL CENTRO QUIMICEN C.A.', 'Martha Guamán', '032960410', 'mguaman@quimicen.ec', 'Av. Unidad Nacional y Carabobo, Riobamba'),
('0591243152001', 'INDUSTRIAS QUIMICAS COTOPAXI IQC', 'Gonzalo Jácome', '032801452', 'gjacome@iqc.com.ec', 'Sector Industrial San Felipe, Latacunga'),

-- Proveedores de Hogar, Papelería y Plásticos
('1790014523001', 'PLASTICOS ECUATORIANOS S.A.', 'Felipe Cordero', '042251400', 'ventas@plasticosecuatorianos.com', 'Km 4.5 Vía a Daule, Guayaquil'),
('0990054123001', 'PRODUCTOS FAMILIA SANCELA DEL ECUADOR S.A.', 'Elena Cevallos', '023996200', 'abastecimiento@familia.com.ec', 'Av. 6 de Diciembre y Whymper, Quito'),
('1791238475001', 'PAPELERA NACIONAL S.A.', 'Alejandro Cárdenas', '042597300', 'compras@panasa.com.ec', 'Vía a Daule Km 26, Nobol'),
('1792451368001', 'DISTRIBUIDORA DILIPA S.A.', 'Paulina Freire', '022806200', 'contacto@dilipa.com.ec', 'Av. de la Prensa N56-110 y Zamora, Quito'),
('1790412536001', 'FIBRASEG S.A. (PRODUCTOS DE PAPEL)', 'Daniela Noboa', '022690321', 'ventas@fibraseg.com', 'Panamericana Sur Km 14.5, Cutuglahua'),
('0991245781001', 'PLASTIGLAS S.A.', 'Arturo Noboa', '042801900', 'compras@plastiglas.com.ec', 'Km 8.5 Vía a Daule, Guayaquil'),
('0190035124001', 'CARTOPEL - CARTONES NACIONALES S.A.', 'Santiago Muñoz', '072862300', 'contacto@cartopel.com', 'Av. de las Américas y Huayna Cápac, Cuenca'),
('1790041285001', 'BOREALIS S.A. (UTENSILIOS Y PLASTICOS)', 'Carla Espinoza', '022451360', 'cespinoza@borealis.ec', 'Av. 10 de Agosto N45-12 y El Inca, Quito'),
('0591247851001', 'DISTRIBUIDORA TOBAR PAPELERIA', 'Mauricio Tobar', '032812400', 'mtobar@tobar.ec', 'Calle Belisario Quevedo y Guayaquil, Latacunga'),

-- Proveedores de Electrónica, Tecnología y Logística
('1791723548001', 'ALMACENES JUAN ELJURI C.A.', 'Juan Pablo Eljuri', '072862111', 'compras@eljuri.com', 'Av. Gil Ramírez Dávalos 1-102, Cuenca'),
('1790054129001', 'SAMSUNG ELECTRONICS ECUADOR S.A.', 'Eduardo Castro', '023945000', 'e.castro@samsung.com', 'Av. 12 de Octubre y Patria, Edif. Plaza Sole, Quito'),
('0992345128001', 'SONY ECUADOR S.A.', 'Verónica Santos', '042634100', 'vsantos@sony.com.ec', 'Centro Comercial Mall del Sol, Guayaquil'),
('1792415263001', 'COMPUEQUIP DOS MIL C.A.', 'Cristian Ramos', '022269100', 'cramos@compuequip.com.ec', 'Av. Eloy Alfaro N34-151 y Portugal, Quito'),
('1791854632001', 'INTCOMEX DEL ECUADOR S.A.', 'Mireya Cadena', '023963400', 'mcadena@intcomex.com', 'Av. Galo Plaza Lasso N52-12 y Manuel Espinoza, Quito'),
('0991425368001', 'MABE DEL ECUADOR S.A.', 'Héctor Delgado', '042885400', 'hdelgado@mabe.com.ec', 'Km 14.5 Vía a la Costa, Guayaquil'),
('1791245124001', 'SONELCO S.A. (MATERIALES ELECTRICOS)', 'Xavier Endara', '022564100', 'xendara@sonelco.com.ec', 'Calle Esmeraldas 412 y Rondón, Quito'),

-- Mascotas, Bebés y Congelados
('1792345129001', 'ALIMENTOS BALNCEADOS ABA S.A. (K-NINA / GATI)', 'Luis Bastidas', '022375120', 'compras@aba.com.ec', 'Km 1.5 Vía Sangolquí-Amaguaña, Sangolquí'),
('0992451236001', 'PROVEEDORA INFANTIL BABYCENTER C.A.', 'Gabriela Chiriboga', '042398410', 'gchiriboga@babycenter.ec', 'Av. Joaquín Orrantia, Sector Plaza del Sol, Guayaquil'),
('1790081245001', 'CONGELADOS DEL PACIFICO CONGELPAC S.A.', 'Arturo Viteri', '052622540', 'contacto@congelpac.com.ec', 'Puerto Pesquero Artesanal, San Mateo, Manta');

--------------------------------------PRODUCTOS------------------------------------
-----------------------------------------------------------------------------------
INSERT INTO productos (codigo_barras, nombre, descripcion, id_categoria, precio_venta_actual, stock_minimo_alerta) VALUES
-- Categoría 1: Lácteos
('7861000100019', 'Leche Toni Entera 1L', 'Leche fluida entera ultrapasteurizada', 1, 1.10, 50.000),
('7861000100026', 'Leche Toni Deslactosada 1L', 'Leche fluida semidescremada deslactosada', 1, 1.25, 40.000),
('7861000100033', 'Yogurt Toni Fresa 1L', 'Yogurt entero con dulce sabor a fresa', 1, 2.45, 20.000),
('7861000100040', 'Yogurt Toni Durazno 1L', 'Yogurt entero sabor durazno', 1, 2.45, 20.000),
('7861000100057', 'Mantequilla Girasol con sal 250g', 'Mantequilla pasteurizada de mesa', 1, 1.85, 30.000),
('7861000100064', 'Queso Mozzarella Kiosko 500g', 'Queso semiduro para derretir', 1, 4.20, 15.000),
('7861000100071', 'Queso Crema Kiosko 220g', 'Queso crema para untar', 1, 2.10, 25.000),
('7861000100088', 'Leche Condensada La Lechera 395g', 'Leche condensada azucarada tradicional', 1, 1.95, 15.000),
('7861000100095', 'Crema de Leche La Lechera 290g', 'Crema de leche pasteurizada para cocina', 1, 1.60, 25.000),
('7861000100118', 'Queso Fresco Reyqueso 500g', 'Queso fresco de mesa', 1, 2.90, 20.000),
('7861000100125', 'Yogurt Regeneris Ciruela 1L', 'Bebida láctea con fibra', 1, 2.60, 15.000),
('7861000100132', 'Helado de Vainilla Pingüino 1L', 'Helado cremoso sabor a vainilla', 1, 3.50, 10.000),
('7861000100149', 'Leche Semidescremada Vita 1L', 'Leche fluida pasteurizada semidescremada', 1, 1.05, 50.000),
('7861000100156', 'Manjar de Leche Toni 250g', 'Dulce de leche tradicional', 1, 1.50, 20.000),
('7861000100163', 'Leche de Almendras Nature s Heart 1L', 'Bebida vegetal de almendras', 1, 3.20, 12.000),
('7861000100170', 'Yogurt Nutri Entero Mora 1L', 'Yogurt bebible sabor mora', 1, 1.90, 30.000),
('7861000100194', 'Bebida de Avena Polaca Alimentos 1L', 'Avena de leche con canela lista', 1, 1.40, 25.000),
('7861000100200', 'Flan de Vainilla Royal pack x4', 'Postre de flan listo para preparar', 1, 1.20, 30.000),
('7861000100217', 'Gelatina Royal Fresa 80g', 'Polvo para preparar gelatina de fresa', 1, 0.75, 40.000),
('7861000100224', 'Chispas de Chocolate Nestle 150g', 'Gotas de chocolate para repostería', 1, 2.80, 15.000),
('7861000100248', 'Crema Chantilly Puratos 500ml', 'Crema para batir y decorar repostería', 1, 2.95, 10.000),
('7861000100255', 'Bebida Lactea Chocoleche 200ml', 'Leche saborizada con chocolate', 1, 0.55, 60.000),

-- Categoría 4: Bebidas
('7861000400010', 'Coca-Cola 2L', 'Bebida gaseosa sabor original', 4, 2.10, 80.000),
('7861000400027', 'Sprite 1L', 'Bebida gaseosa sabor lima-limón', 4, 1.15, 40.000),
('7861000400041', 'Agua Mineral Güitig 1.5L', 'Agua mineral con gas natural', 4, 0.95, 50.000),
('7861000400058', 'Agua Purificada Dasani 1.5L', 'Agua de mesa sin gas', 4, 0.75, 60.000),
('7861000400065', 'Té Helado Sun Tea Limón 1.5L', 'Bebida de té con limón', 4, 1.50, 30.000),
('7861000400072', 'Jugo de Naranja Tampico 1L', 'Bebida sabor cítrico con naranja', 4, 1.20, 40.000),
('7861000400089', 'Gatorade Blue Bolt 750ml', 'Bebida hidratante para deportistas', 4, 1.45, 50.000),
('7861000400096', 'Cerveza Club Verde Botella 330ml', 'Cerveza premium tipo pilsener', 4, 1.35, 120.000),
('7861000400119', 'Néctar de Durazno Del Valle 1L', 'Bebida de fruta pasteurizada', 4, 1.40, 40.000),
('7861000400126', 'Agua Tónica Fioravanti 1L', 'Agua tónica para coctelería', 4, 1.10, 20.000),
('7861000400133', 'Red Bull Energy Drink 250ml', 'Bebida energizante estimulante', 4, 2.50, 35.000),
('7861000400157', 'Bebida de Coco Silk 1L', 'Bebida vegetal de coco libre de lácteos', 4, 3.40, 12.000),
('7861000400164', 'Tónica Canada Dry 355ml', 'Bebida carbonatada de agua tónica', 4, 0.85, 40.000),
('7861000400171', 'Refresco Ponche Tropical Petit 200ml', 'Jugo de frutas infantil', 4, 0.45, 100.000),
('7861000400188', 'Cerveza Stella Artois Botella 330ml', 'Cerveza lager premium importada', 4, 2.10, 48.000),
('7861000400195', 'Bebida Aloe Vera OKF 500ml', 'Bebida refrescante con pulpa de aloe', 4, 1.65, 25.000),
('7861000400201', 'Monster Energy Green 473ml', 'Bebida energizante lata grande', 4, 2.75, 40.000),
('7861000400218', 'Agua con Gas San Felipe 1L', 'Agua mineral gasificada de fuente', 4, 0.80, 50.000),
('7861000400225', 'Whisky Johnnie Walker Red Label 750ml', 'Whisky escocés mezclado', 4, 24.50, 10.000),
('7861000400249', 'Vino Tinto Gato Negro Cabernet 750ml', 'Vino tinto joven de mesa', 4, 8.90, 20.000),
('7861000400256', 'Aguardiente Zhumir Seco 750ml', 'Licor destilado tradicional', 4, 6.50, 15.000),

-- Categoría 5: Panadería
('7861000500017', 'Pan de Molde Bimbo Blanco Grande 550g', 'Pan de sándwich blanco enriquecido', 5, 2.65, 30.000),
('7861000500024', 'Pan Integral Bimbo 550g', 'Pan de molde con fibra integral', 5, 2.85, 25.000),
('7861000500031', 'Pan de Hamburguesa Bimbo x4', 'Pan suave con ajonjolí', 5, 1.90, 20.000),
('7861000500048', 'Tostadas Integrales Supan 200g', 'Tostadas crujientes de trigo integral', 5, 1.45, 30.000),
('7861000500055', 'Bizcochos de Cayambe 200g', 'Bizcochos tradicionales crocantes', 5, 1.80, 15.000),
('7861000500062', 'Tortillas de Trigo Rapiditas Bimbo x10', 'Tortillas para fajitas o wraps', 5, 2.30, 25.000),
('7861000500079', 'Croissants de Mantequilla pack x6', 'Panes de hojaldre horneados', 5, 2.50, 15.000),
('7861000500109', 'Orejas de Hojaldre Dulces x6', 'Masas dulces horneadas crujientes', 5, 1.95, 12.000),
('7861000500116', 'Pan de Yuca Horneado Congelado x10', 'Panaes de yuca con queso listos', 5, 3.20, 15.000),
('7861000500123', 'Muffin de Chocolate Unidad', 'Panecillo dulce con gotas de chocolate', 5, 0.95, 35.000),
('7861000500130', 'Pan de Molde Multigrano Supan 550g', 'Pan con semillas de lino y chía', 5, 2.95, 20.000),
('7861000500147', 'Base para Pizza Prepizzas x2', 'Bases de pizza listas para armar', 5, 2.10, 15.000),
('7861000500154', 'Empanadas de Viento de Queso x6', 'Empanadas de harina con queso', 5, 1.85, 20.000),
('7861000500161', 'Cake de Chocolate con Fudge', 'Pastel húmedo de chocolate entero', 5, 6.90, 5.000),
('7861000500178', 'Pan Pita Blanco Sanissimo x6', 'Pan plano tipo árabe', 5, 1.70, 15.000),
('7861000500185', 'Galletas Ducales Taco 294g', 'Galletas semi-dulces toque secreto', 5, 1.80, 30.000),
('7861000500192', 'Galletas Club Social pack x9', 'Galletas saladas empacadas de viaje', 5, 1.99, 40.000),
('7861000500222', 'Grissinis de Orégano 150g', 'Palitos de pan crujientes', 5, 1.30, 15.000),
('7861000500239', 'Pan de Dulce con Manjar x6', 'Masa dulce rellena de dulce de leche', 5, 1.50, 20.000),
('7861000500253', 'Alfajores de Maicena pack x4', 'Postres suaves rellenos de manjar', 5, 1.80, 15.000);


INSERT INTO productos (codigo_barras, nombre, descripcion, id_categoria, precio_venta_actual, stock_minimo_alerta) VALUES
-- Categoría 2: Carnes
('7861000200016', 'Pechuga de Pollo Entera Mr. Pollo 1kg', 'Pechuga fresca con hueso y piel', 2, 5.20, 20.000),
('7861000200023', 'Muslos de Pollo Mr. Pollo 1kg', 'Porciones de muslo de pollo fresco', 2, 4.10, 20.000),
('7861000200030', 'Lomo de Res Premium 1kg', 'Corte fino de carne de res tierna', 2, 11.50, 10.000),
('7861000200047', 'Carne Molida Especial Res 1kg', 'Carne magra molida de primera', 2, 6.80, 15.000),
('7861000200054', 'Chuleta de Cerdo Mr. Chancho 1kg', 'Chuletas de lomo de cerdo con hueso', 2, 5.90, 15.000),
('7861000200061', 'Costilla de Cerdo BBQ Mr. Chancho 1kg', 'Costillas de cerdo ideales para asar', 2, 7.80, 10.000),
('7861000200078', 'Filete de Corvina Fresco 1kg', 'Pescado blanco fileteado limpio', 2, 9.50, 8.000),
('7861000200085', 'Camarón Pelado y Desvenado 500g', 'Camarón ecuatoriano listo para cocinar', 2, 5.40, 15.000),
('7861000200092', 'Carne para Estofado de Res 1kg', 'Cortes de res picados listos', 2, 6.20, 20.000),
('7861000200108', 'Alitas de Pollo Mr. Pollo 1kg', 'Alitas frescas de pollo para freír', 2, 4.50, 20.000),
('7861000200115', 'Milanesas de Res Empanadas x4', 'Filetes de carne de res listos', 2, 5.10, 15.000),
('7861000200122', 'Lomo Fino de Cerdo Mr. Chancho 1kg', 'Corte de cerdo tierno y sin grasa', 2, 8.20, 10.000),
('7861000200139', 'Filete de Salmón Importado 500g', 'Filete de salmón premium fresco', 2, 14.50, 6.000),
('7861000200146', 'Carne de Cordero en chuleta 1kg', 'Corte selecto de cordero nacional', 2, 12.90, 5.000),
('7861000200153', 'Patas de Pollo Limpias 1kg', 'Patitas de pollo para caldos', 2, 2.10, 15.000),
('7861000200177', 'Tripa de Res para Asar 1kg', 'Chinchulines preparados para parrillada', 2, 4.20, 10.000),
('7861000200184', 'Carne de Pavo Troceada Soprano 1kg', 'Carne de pavo congelada magra', 2, 6.90, 12.000),
('7861000200191', 'Lengua de Res Fresca Unidad', 'Pieza entera de lengua de res limpia', 2, 8.50, 5.000),
('7861000200207', 'Codillo de Cerdo Ahumado 1kg', 'Pernil de cerdo ahumado para sopas', 2, 5.50, 10.000),
('7861000200214', 'Gizzard de Pollo (Mollejas) 1kg', 'Mollejas de pollo frescas', 2, 2.80, 15.000),
('7861000200221', 'Filete de Tilapia Fresca 1kg', 'Pescado de cultivo fileteado', 2, 6.10, 15.000),
('7861000200238', 'Hígado de Res Fresco 1kg', 'Hígado de res rico en hierro', 2, 3.40, 10.000),
('7861000200245', 'Corazón de Res Troceado 1kg', 'Ideal para anticuchos o guisados', 2, 3.20, 10.000),
('7861000200252', 'Pulpa de Cangrejo Real 250g', 'Carne de cangrejo seleccionada lista', 2, 8.90, 8.000),

-- Categoría 3: Embutidos
('7861000300013', 'Mortadela Plumrose Tempe 250g', 'Mortadela tradicional rebanada', 3, 1.45, 30.000),
('7861000300020', 'Jamón de Cerdo Especial Juris 250g', 'Jamón cocido de pierna selecta', 3, 2.80, 30.000),
('7861000300037', 'Salchicha de Pollo Plumrose 400g', 'Salchichas suaves de pollo', 3, 1.90, 40.000),
('7861000300044', 'Tocino Ahumado Rebanado Juris 200g', 'Láminas de tocino crujiente', 3, 3.10, 25.000),
('7861000300051', 'Chorizo Cuencano La Europea 400g', 'Chorizo criollo estilo cuencano', 3, 3.80, 20.000),
('7861000300068', 'Salami Ahumado La Europea 150g', 'Salami rebanado para tablas o pizza', 3, 2.95, 20.000),
('7861000300075', 'Jamón de Pavo Premium Juris 250g', 'Jamón de pechuga de pavo bajo en grasa', 3, 3.40, 25.000),
('7861000300082', 'Salchicha Frankfurt La Europea 350g', 'Salchichas premium para hot dog', 3, 2.90, 30.000),
('7861000300099', 'Chorizo Parrillero Plumrose 400g', 'Chorizos gruesos para asar', 3, 3.99, 20.000),
('7861000300105', 'Pate de Hígado de Cerdo Juris 150g', 'Pasta untable de hígado sazonado', 3, 1.25, 15.000),
('7861000300112', 'Cabano Picante La Europea 120g', 'Snack de embutido seco picante', 3, 1.90, 15.000),
('7861000300129', 'Queso de Chancho Tradicional Juris 250g', 'Embutido gelatinoso de cabeza de cerdo', 3, 1.60, 20.000),
('7861000300136', 'Jamón Serrano Rebanado Importado 100g', 'Jamón curado maduro', 3, 4.50, 12.000),
('7861000300143', 'Chorizo Español Sarta 200g', 'Chorizo curado con pimentón', 3, 3.20, 15.000),
('7861000300150', 'Pastrami de Res Rebanado 150g', 'Pecho de res curado y sazonado', 3, 3.60, 10.000),
('7861000300167', 'Salchicha Alemana Juris 350g', 'Salchichas blancas sazonadas', 3, 3.15, 20.000),
('7861000300174', 'Chistorra Vasca La Europea 200g', 'Embutido delgado para freír o asar', 3, 2.70, 15.000),
('7861000300181', 'Jamón con Queso Rebanado Plumrose 200g', 'Jamón cocido con centro de queso', 3, 2.45, 25.000),
('7861000300198', 'Pepperoni Rebanado para Pizza 150g', 'Embutido curado picante', 3, 2.80, 20.000),
('7861000300204', 'Morcilla con Arroz Cuencana 350g', 'Embutido de sangre con arroz y especias', 3, 2.50, 15.000),
('7861000300211', 'Mortadela con Pistacho La Europea 250g', 'Mortadela fina con frutos secos', 3, 2.20, 15.000),
('7861000300228', 'Longaniza de Cerdo Tradicional 400g', 'Embutido embutido en tripa natural', 3, 3.10, 15.000),
('7861000300235', 'Jamón de Pollo Rebanado Juris 250g', 'Alternativa magra al jamón de cerdo', 3, 2.65, 25.000),
('7861000300242', 'Salchicha de Pavo Plumrose 400g', 'Salchichas de carne de pavo ligera', 3, 2.15, 30.000),
('7861000300259', 'Chorizo Argentino para Choripán x4', 'Chorizo parrillero criollo', 3, 4.20, 15.000),

-- Categoría 11: Congelados
('7861001100018', 'Papas Fritas Corte Recto McCains 1kg', 'Papas prefritas congeladas listas', 11, 3.60, 30.000),
('7861001100025', 'Nuggets de Pollo Fritz 500g', 'Bocaditos de pollo empanados listos', 11, 4.10, 20.000),
('7861001100032', 'Hamburguesas de Res Fritz x4', 'Carne moldeada lista para asar', 11, 2.99, 25.000),
('7861001100049', 'Pizza Congelada Personal Americana Dr. Oetker', 'Pizza con jamón y queso para horno', 11, 3.85, 15.000),
('7861001100056', 'Mezcla de Vegetales Congelados Hortana 500g', 'Brócoli, coliflor y zanahoria', 11, 1.90, 25.000),
('7861001100063', 'Pulpa de Guanábana Congelada 500g', 'Pulpa de fruta natural pasteurizada', 11, 2.40, 20.000),
('7861001100070', 'Lasaña de Carne lista El Gourmet 400g', 'Lasaña horneable congelada', 11, 4.50, 12.000),
('7861001100087', 'Waffles Congelados Eggo x6', 'Waffles listos para tostadora', 11, 3.10, 15.000),
('7861001100094', 'Fresas Congeladas Hortana 500g', 'Fresas enteras seleccionadas congeladas', 11, 2.60, 20.000),
('7861001100100', 'Aros de Cebolla Rebozados McCains 400g', 'Aros de cebolla listos para freír', 11, 2.95, 15.000),
('7861001100117', 'Dedos de Queso Mozzarella Fritz 350g', 'Bastones de queso empanados', 11, 4.20, 15.000),
('7861001100124', 'Pulpa de Maracuyá Congelada 500g', 'Pulpa natural ideal para jugos', 11, 2.10, 20.000),
('7861001100131', 'Pescado Apanado Filetes Congelados x4', 'Filetes de pescado blanco listos', 11, 4.99, 15.000),
('7861001100148', 'Yuca Troceada Congelada Hortana 1kg', 'Yuca lista para hervir o freír', 11, 1.80, 20.000),
('7861001100162', 'Empanadas de Verde Congeladas x6', 'Masa de plátano verde con queso', 11, 2.80, 20.000),
('7861001100179', 'Tequeños de Queso Congelados x12', 'Rollitos de masa de harina con queso', 11, 3.90, 15.000),
('7861001100186', 'Helado Magnum Almendras Unidad', 'Paleta helada de vainilla con chocolate', 11, 1.60, 40.000),
('7861001100193', 'Pastel de Choclo Congelado 500g', 'Tarta tradicional de maíz tierno', 11, 3.10, 10.000),
('7861001100209', 'Maíz Dulce desgranado Hortana 500g', 'Granos de maíz dulce congelados', 11, 1.75, 25.000),
('7861001100216', 'Pechuguitas de Pollo Apanadas Nuggetón 500g', 'Piezas de pechuga moldeadas crujientes', 11, 4.60, 15.000),
('7861001100223', 'Pulpa de Mora Congelada 500g', 'Mora seleccionada licuada y congelada', 11, 2.15, 20.000),
('7861001100230', 'Hambuguesas de Pollo Fritz x4', 'Carne de pollo moldeada sazonada', 11, 2.80, 25.000),
('7861001100247', 'Papas Rústicas en Gajos McCains 750g', 'Gajos de papa sazonados con cáscara', 11, 3.40, 20.000),
('7861001100254', 'Tarta de Manzana Congelada Sara Lee', 'Tarta dulce de manzana para calentar', 11, 6.50, 8.000);


INSERT INTO productos (codigo_barras, nombre, descripcion, id_categoria, precio_venta_actual, stock_minimo_alerta) VALUES
-- Categoría 6: Frutas
('7861000600014', 'Plátano Cavendish (Seda) de Exportación 1kg', 'Plátano amarillo seleccionado dulce', 6, 0.90, 40.000),
('7861000600021', 'Manzana Roja Importada de Chile 1kg', 'Manzana roja crujiente fresca', 6, 1.85, 30.000),
('7861000600038', 'Frutillas Seleccionadas Domésticas 500g', 'Frutilla fresca empacada en bandeja', 6, 1.60, 20.000),
('7861000600045', 'Piña Golden Dulce Mediana Unidad', 'Piña fresca pelada o entera', 6, 1.50, 25.000),
('7861000600052', 'Papaya Hawayana Mediana Unidad', 'Papaya fresca entera', 6, 1.20, 20.000),
('7861000600069', 'Melón Escrito Dulce Unidad', 'Melón jugoso fresco', 6, 1.60, 15.000),
('7861000600076', 'Naranjas de Mesa Dulces x12', 'Naranjas ideales para jugo o comer', 6, 1.80, 40.000),
('7861000600083', 'Limón Sutil Verde 1kg', 'Limón ácido para sazonar o bebidas', 6, 1.10, 30.000),
('7861000600090', 'Uva Roja sin semilla Importada 500g', 'Uva globo roja dulce fresca', 6, 2.45, 15.000),
('7861000600106', 'Mango Tomy Grande Unidad', 'Mango de mesa maduro dulce', 6, 0.75, 25.000),
('7861000600113', 'Sandía de Manabí Entera Unidad', 'Sandía roja dulce grande', 6, 3.50, 10.000),
('7861000600120', 'Maracuyá Premium 1kg', 'Fruta de la pasión para jugos', 6, 1.30, 20.000),
('7861000600137', 'Aguacate Hass Ecuatoriano 1kg', 'Aguacate cremoso seleccionado', 6, 2.80, 15.000),
('7861000600144', 'Guanábana Entera Dulce 1kg', 'Fruta fresca blanca muy dulce', 6, 2.10, 8.000),
('7861000600151', 'Naranjilla de Pastaza 1kg', 'Naranjilla fresca para coladas o jugos', 6, 1.25, 20.000),
('7861000600168', 'Kiwi Verde Importado 500g', 'Kiwi rico en vitamina C fresco', 6, 2.20, 15.000),
('7861000600175', 'Tamarindo Seco con Cáscara 500g', 'Tamarindo natural para refrescos', 6, 1.40, 12.000),
('7861000600182', 'Ciruela de Fraile Sierra 500g', 'Fruta de temporada andina', 6, 1.15, 10.000),
('7861000600199', 'Durazno de Ambato 1kg', 'Duraznos de piel vellosa fragantes', 6, 2.30, 15.000),
('7861000600205', 'Mora de Castilla Fresca 500g', 'Mora fresca seleccionada en tarrina', 6, 1.50, 20.000),
('7861000600212', 'Manzana Verde Granny Smith 1kg', 'Manzana verde ácida para ensaladas', 6, 1.99, 20.000),
('7861000600229', 'Babaco Grande de la Sierra Unidad', 'Fruto andino fragante para dulce', 6, 1.80, 10.000),
('7861000600236', 'Taxo Dulce de la Sierra 1kg', 'Fruto andino para sorbetes o jugos', 6, 1.45, 15.000),
('7861000600243', 'Pera de Agua Nacional 1kg', 'Pera verde suave y jugosa', 6, 1.70, 20.000),
('7861000600250', 'Granadilla de la Sierra pack x6', 'Fruto dulce de cáscara dura', 6, 1.95, 18.000),

-- Categoría 7: Verduras
('7861000700011', 'Tomate Riñón de Invernadero 1kg', 'Tomate rojo firme seleccionado', 7, 1.10, 40.000),
('7861000700028', 'Cebolla Colorada (Paiteña) 1kg', 'Cebolla morada para ensaladas o aderezos', 7, 0.95, 50.000),
('7861000700035', 'Cebolla Perla Importada 1kg', 'Cebolla blanca dulce de cocina', 7, 1.20, 40.000),
('7861000700042', 'Pimiento Verde de Mesa 1kg', 'Pimiento verde fresco grande', 7, 0.85, 30.000),
('7861000700059', 'Zanahoria Amarilla de la Sierra 1kg', 'Zanahoria fresca rica en caroteno', 7, 0.70, 40.000),
('7861000700066', 'Papa Chola Andina Seleccionada 1kg', 'Papa arenosa ideal para locros o puré', 7, 0.80, 60.000),
('7861000700073', 'Brócoli de la Sierra Unidad', 'Arbolitos de brócoli verde oscuro', 7, 0.90, 25.000),
('7861000700080', 'Lechuga Crespa Hidropónica Unidad', 'Lechuga verde fresca lista para comer', 7, 0.85, 30.000),
('7861000700097', 'Espinaca Fresca Atado Grande', 'Hojas de espinaca lavada tierna', 7, 0.75, 20.000),
('7861000700103', 'Ajo Macho Entero Cabeza x3', 'Ajo concentrado para aderezos', 7, 1.15, 25.000),
('7861000700110', 'Coliflor Blanca Grande Unidad', 'Cabeza de coliflor fresca', 7, 0.95, 20.000),
('7861000700127', 'Zucchini Verde tierno 1kg', 'Calabacín tierno de mesa', 7, 1.10, 15.000),
('7861000700134', 'Vainita Verde tierna 500g', 'Legumbre verde fresca en bandeja', 7, 0.90, 20.000),
('7861000700141', 'Choclo Blanco Desgranado 500g', 'Maíz blanco andino desgranado', 7, 1.30, 25.000),
('7861000700158', 'Mellocos Blancos Lavados 500g', 'Tubérculo andino lavado listo', 7, 1.10, 20.000),
('7861000700165', 'Hierbas de Sopa (Cilantro/Perejil) Atado', 'Atado de hierbas aromáticas mixtas', 7, 0.35, 50.000),
('7861000700172', 'Remolacha Dulce 1kg', 'Betabel fresco para ensalada o jugos', 7, 0.90, 25.000),
('7861000700189', 'Rábano Rojo pack x6', 'Rábanos crujientes lavados', 7, 0.65, 15.000),
('7861000700196', 'Cebolla de Verdeo (Blanca) Atado', 'Cebolla larga para refritos', 7, 0.50, 40.000),
('7861000700202', 'Apio Fresco Atado Grande', 'Tallos crujientes de apio lavado', 7, 0.80, 20.000),
('7861000700219', 'Pimiento Rojo de Mesa 1kg', 'Pimiento rojo maduro dulce', 7, 1.60, 20.000),
('7861000700226', 'Yuca Amarilla de Oriente 1kg', 'Yuca suave de fácil cocción', 7, 0.85, 30.000),
('7861000700233', 'Camote Dulce Morado 1kg', 'Tubérculo dulce morado fresco', 7, 0.99, 20.000),
('7861000700240', 'Berenjena Morada de Invernadero 1kg', 'Berenjena fresca para guisar', 7, 1.40, 15.000),
('7861000700257', 'Champiñón Blanco Entero Hortana 250g', 'Hongos comestibles frescos en bandeja', 7, 1.95, 15.000),

-- Categoría 1 (Derivados de Granos y Abarrotes que se asocian a despensa base)
('7861000111015', 'Arroz Súper Extra Real 5kg', 'Arroz de grano largo seleccionado', 1, 6.50, 40.000),
('7861000111022', 'Azúcar Blanco Valdez 1kg', 'Azúcar refinada de caña', 1, 1.15, 50.000),
('7861000111039', 'Aceite Vegetal La Favorita 900ml', 'Aceite comestible de palma y soya', 1, 2.10, 45.000),
('7861000111046', 'Atún Real en Agua Lata 140g', 'Lomo de atún en agua bajo en sodio', 1, 1.45, 60.000),
('7861000111053', 'Atún Real en Aceite de Girasol 140g', 'Lomo de atún en conserva de aceite', 1, 1.55, 60.000),
('7861000111060', 'Sal Refinada Cris-Sal 1kg', 'Sal de mesa yodada y fluorada', 1, 0.45, 50.000),
('7861000111077', 'Tallarín de Trigo Don Vittorio 400g', 'Fideo largo de sémola de trigo', 1, 0.95, 40.000),
('7861000111084', 'Harina de Trigo Ya Premium 1kg', 'Harina refinada especial multiusos', 1, 1.25, 35.000),
('7861000111091', 'Salsa de Tomate Maggi Doypack 400g', 'Salsa de tomate condimentada', 1, 1.60, 30.000),
('7861000111107', 'Mayonesa Alacena Tradicional 380g', 'Salsa mayonesa cremosa receta casera', 1, 2.20, 30.000),
('7861000111114', 'Café Instantáneo Nescafé Tradición 200g', 'Café soluble puro soluble', 1, 5.40, 25.000),
('7861000111121', 'Avena Polaca Ya Instantánea 500g', 'Hojuelas finas de avena precocida', 1, 1.30, 30.000),
('7861000111138', 'Lenteja Seca Importada El Sabor 500g', 'Lenteja seca seleccionada premium', 1, 1.10, 30.000),
('7861000111145', 'Fréjol Rojo Seco El Sabor 500g', 'Grano de fréjol seco para menestras', 1, 1.40, 25.000),
('7861000111152', 'Sardinas en Salsa de Tomate Real 425g', 'Sardinas enteras en lata grande', 1, 1.95, 30.000),
('7861000111169', 'Aceite de Oliva Extra Virgen La Española 500ml', 'Aceite prensado en frío importado', 1, 6.90, 15.000),
('7861000111176', 'Vinagre Blanco Selecto 1L', 'Vinagre de alcohol purificado', 1, 0.95, 20.000),
('7861000111183', 'Chocolate en Polvo Toddy 400g', 'Polvo instantáneo azucarado sabor chocolate', 1, 2.80, 20.000),
('7861000111190', 'Mostaza Americana French s 226g', 'Mostaza preparada tradicional', 1, 1.50, 20.000),
('7861000111206', 'Caldo de Gallina Maggi caja x12 cubos', 'Concentrado deshidratado sabor a gallina', 1, 1.20, 40.000),
('7861000111213', 'Pasta Corta Macarrones Don Vittorio 400g', 'Fideo codo de sémola dura', 1, 0.95, 40.000),
('7861000111220', 'Pimienta Negra Molida El Rey 50g', 'Especias molidas de mesa', 1, 0.90, 30.000),
('7861000111237', 'Ají para Seco en pasta 200g', 'Condimento andino tradicional listo', 1, 1.10, 25.000),
('7861000111244', 'Polvo para Hornear Royal 100g', 'Levadura química en polvo', 1, 1.15, 25.000),
('7861000111251', 'Maicena Americana Natural 400g', 'Fécula de maíz pura purificada', 1, 1.40, 20.000);


INSERT INTO productos (codigo_barras, nombre, descripcion, id_categoria, precio_venta_actual, stock_minimo_alerta) VALUES
-- Categoría 8: Limpieza
('7861000800018', 'Detergente Deja Limón Líquido 3L', 'Jabón de lavar ropa líquido concentrado', 8, 7.90, 20.000),
('7861000800025', 'Papel Higiénico Familia Acolchadito x12', 'Papel higiénico doble hoja extra suave', 8, 4.50, 30.000),
('7861000800032', 'Lavaplatos Líquido Axion Limón 750ml', 'Arrancagrasa concentrado para vajillas', 8, 2.30, 25.000),
('7861000800049', 'Cloro Tradicional Clorox 1L', 'Desinfectante blanqueador fuerte', 8, 1.10, 40.000),
('7861000800056', 'Suavizante de Ropa Downy Brisa Fresca 1.5L', 'Acondicionador de telas concentrado', 8, 4.20, 15.000),
('7861000800063', 'Desinfectante de Pisos Poett Lavanda 1.8L', 'Limpiador aromatizante líquido', 8, 2.10, 25.000),
('7861000800070', 'Limpiavidrios Clin Pistola 500ml', 'Líquido para ventanas y cristales sin rayas', 8, 1.85, 15.000),
('7861000800087', 'Esponja de Cocina Scotch-Brite pack x3', 'Fibras para fregar platos multiusos', 8, 1.40, 30.000),
('7861000800094', 'Bolsas de Basura Fundasol Grande x10', 'Bolsas resistentes negras para residuos', 8, 1.80, 25.000),
('7861000800100', 'Lustramuebles Aerosol Pledge 350ml', 'Limpiador abrillantador para madera', 8, 3.20, 15.000),
('7861000800117', 'Desatorador de Cañerías Drano Líquido 1L', 'Fórmula potente para tuberías obstruidas', 8, 4.80, 10.000),
('7861000800124', 'Insecticida Baygon Aerosol Casa y Jardín', 'Veneno para insectos voladores y rastreros', 8, 3.60, 15.000),
('7861000800131', 'Pastilla Inodoro Pato Purific de Tanque x2', 'Bloque limpiador aromatizante azul', 8, 1.95, 20.000),
('7861000800148', 'Guantes de Goma Multiusos Protex Unidad', 'Guantes amarillos protectores de limpieza', 8, 1.25, 20.000),
('7861000800155', 'Detergente Polvo Deja Flores Silvestres 2kg', 'Detergente multiusos en polvo para ropa', 8, 4.30, 25.000),
('7861000800162', 'Limpiador en Crema Cif Blanco 750ml', 'Crema microabrasiva desengrasante baños', 8, 2.60, 15.000),
('7861000800179', 'Toallas de Papel Cocina Scott pack x2', 'Rollos de papel absorbente multiusos', 8, 1.65, 30.000),
('7861000800186', 'Desodorante Ambiental Glade Aerosol Lavanda', 'Aromatizador de ambientes rápido', 8, 2.10, 20.000),
('7861000800193', 'Lavaplatos Crema Perlita Limón 450g', 'Pasta tradicional para fregar ollas', 8, 1.15, 30.000),
('7861000800209', 'Saca Grasa de Cocina Mr. Músculo Pulverizador', 'Limpiador desengrasante para encimeras', 8, 2.85, 15.000),

-- Categoría 9: Aseo Personal
('7861000900015', 'Colgate Total 12 Crema Dental 150g', 'Pasta de dientes con flúor protección total', 9, 2.45, 35.000),
('7861000900022', 'Shampoo Head & Shoulders Limpieza Renovadora 375ml', 'Champú anticaspa de uso diario', 9, 4.50, 20.000),
('7861000900039', 'Jabón en Barra Palmolive Neutro pack x3', 'Jabón corporal humectante de tocador', 9, 2.10, 30.000),
('7861000900046', 'Desodorante Rexona Clinical Hombre Barra 48g', 'Antitranspirante máxima protección', 9, 5.20, 15.000),
('7861000900053', 'Enjuague Bucal Colgate Plax Mentol 500ml', 'Antiséptico bucal sin alcohol refrescante', 9, 3.80, 15.000),
('7861000900060', 'Crema Corporal Nivea Milk Nutritiva 400ml', 'Loción hidratante para piel extra seca', 9, 5.90, 15.000),
('7861000900077', 'Acondicionador Pantene Restauración 400ml', 'Acondicionador para cabello dañado', 9, 4.80, 15.000),
('7861000900084', 'Protectores Diarios Nosotras pack x40', 'Toallas higiénicas delgadas uso diario', 9, 2.40, 25.000),
('7861000900091', 'Gel de Ducha Palmolive Aloe Vera 250ml', 'Gel corporal líquido humectante', 9, 2.65, 15.000),
('7861000900107', 'Máquina de Afeitar Gillette Prestobarba3 x4', 'Afeitadoras desechables de 3 hojas', 9, 3.50, 20.000),
('7861000900114', 'Toallas Higiénicas Nosotras Invisible x10', 'Toallas femeninas ultrafinas con alas', 9, 1.85, 30.000),
('7861000900121', 'Jabón Líquido para Manos Protex Nutri Protect 220ml', 'Doypack repuesto jabón antibacterial', 9, 1.50, 30.000),
('7861000900138', 'Crema de Peinar Sedal Co-Creations Rizos 300ml', 'Crema para peinar definidora de rizos', 9, 2.90, 20.000),
('7861000900145', 'Hisopos de Algodón Johnson x100', 'Copitos con puntas de algodón puro', 9, 1.10, 25.000),
('7861000900152', 'Talco para Pies Rexona Efficiency Eficaz 150g', 'Desodorante en polvo control de sudor', 9, 3.10, 15.000),
('7861000900169', 'Listerine Cool Mint Antiséptico 500ml', 'Enjuague para control de placa bacteriana', 9, 4.20, 15.000),
('7861000900176', 'Papel Tisú Elite caja x100 pañuelos', 'Pañuelos desechables faciales suaves', 9, 1.20, 25.000),
('7861000900183', 'Bloqueador Solar Nivea Sun FPS 50 125ml', 'Protector solar hidratante contra rayos UV', 9, 12.50, 10.000),
('7861000900190', 'Gel para Cabello Ego Force 200ml', 'Fijador extremo para peinados de hombre', 9, 2.10, 20.000),
('7861000900206', 'Toallitas Desmaquillantes Neutrógena x25', 'Toallitas húmedas para retirar maquillaje', 9, 4.60, 15.000),

-- Categoría 10: Mascotas
('7861001000011', 'Alimento Perro Adulto Dog Chow 4kg', 'Croquetas balanceadas para perros medianos', 10, 14.50, 15.000),
('7861001000028', 'Alimento Gato Gati Adulto Salmón 1.5kg', 'Croquetas para gatos adultos con omega 3', 10, 5.90, 15.000),
('7861001000035', 'Lata Alimento Húmedo Perro Pedigree Res 290g', 'Pate de carne de res premium para perro', 10, 1.80, 25.000),
('7861001000042', 'Sobre Alimento Húmedo Gato Whiskas Atún 85g', 'Trocitos de pescado en salsa jugosa', 10, 0.95, 50.000),
('7861001000059', 'Arena Sanitaria Gato Canat 4kg', 'Arena aglomerante neutralizadora de olores', 10, 4.20, 20.000),
('7861001000066', 'Shampoo Antipulgas Canino Puppy 400ml', 'Shampoo medicado para pulgas y garrapatas', 10, 5.50, 10.000),
('7861001000073', 'Hueso de Carnaza Dental Perro x3', 'Huesos masticables removedores de sarro', 10, 2.80, 15.000),
('7861001000080', 'Snacks para Gatos Temptations Pollo 85g', 'Bocaditos crujientes rellenos para gato', 10, 1.95, 20.000),
('7861001000097', 'Alimento Perro Cachorro ProPlan 3kg', 'Nutrición avanzada para cachorros', 10, 24.90, 8.000),
('7861001000103', 'Collar Antipulgas para Perros Seresto', 'Collar protector insecticida 8 meses', 10, 39.00, 5.000),
('7861001000110', 'Cepillo y Cardina para Mascotas Doble Faz', 'Peinilla removedora de pelo muerto', 10, 4.50, 10.000),
('7861001000127', 'Bebedero y Comedero Plástico Mascotas', 'Plato doble de plástico resistente', 10, 2.50, 15.000),
('7861001000134', 'Juguete Pelota de Goma Perros', 'Pelota chillona para morder', 10, 1.80, 20.000),
('7861001000141', 'Rascador Esquinero de Yute para Gatos', 'Rascador para garras con colgador', 10, 9.80, 8.000),
('7861001000158', 'Alimento Aves Mezcla Alpiste 1kg', 'Mezcla de granos para periquitos', 10, 2.10, 15.000),

-- Categoría 15: Bebés
('7861001500016', 'Pañales Huggies Active Sec Talla G x40', 'Pañales autoajustables protección total', 15, 12.80, 20.000),
('7861001500023', 'Toallitas Húmedas Huggies Cuidado Puro x80', 'Toallitas hipoalergénicas sin alcohol', 15, 2.90, 30.000),
('7861001500030', 'Fórmula Infantil Nan Optipro 1 Pro 800g', 'Fórmula de inicio para lactantes', 15, 22.50, 12.000),
('7861001500047', 'Shampoo Johnson s Baby Neutro 400ml', 'Shampoo suave que no produce lágrimas', 15, 4.20, 20.000),
('7861001500054', 'Crema Antipañalitis Desitin Original 113g', 'Crema protectora con óxido de zinc', 15, 7.80, 15.000),
('7861001500061', 'Papilla de Manzana Gerber 113g', 'Colado de fruta natural para bebés', 15, 1.15, 40.000),
('7861001500078', 'Biberón Avent Classic Anti-colic 260ml', 'Biberón ergonómico tetina flujo medio', 15, 8.90, 10.000),
('7861001500085', 'Aceite Johnson s Baby Puro 200ml', 'Aceite mineral suavizante de piel', 15, 3.40, 15.000),
('7861001500092', 'Fórmula de Crecimiento Progress Gold 3 900g', 'Leche en polvo etapa de desarrollo', 15, 24.50, 10.000),
('7861001500108', 'Papilla Nestum Trigo Miel Cereal 350g', 'Cereal infantil instantáneo para preparar', 15, 3.10, 25.000),
('7861001500115', 'Chupón de Silicona Ortodóntico Chicco x2', 'Chupón fisiológico para calmar', 15, 5.60, 15.000),
('7861001500122', 'Jabón Líquido Baby Dove Humectación 200ml', 'Jabón líquido de baño neutro bebé', 15, 2.95, 20.000),
('7861001500139', 'Talco Johnson s Baby Protección Pura 200g', 'Fórmula libre de asbesto extra suave', 15, 2.80, 15.000),
('7861001500146', 'Aspirador Nasal de Goma Infantil', 'Perilla extractora de mucosidad infantil', 15, 1.95, 10.000),
('7861001500153', 'Mordedor de Agua Fría Avent Unidad', 'Mordedor calmante de encías inflamadas', 15, 3.80, 12.000);


INSERT INTO productos (codigo_barras, nombre, descripcion, id_categoria, precio_venta_actual, stock_minimo_alerta) VALUES
-- Categoría 12: Electrónica
('7861001200015', 'Pila Alcalina Duracell AA pack x4', 'Pilas de larga duración 1.5v', 12, 4.10, 35.000),
('7861001200022', 'Cargador de Pared USB Tipo C Samsung 25W', 'Cargador rápido original de pared', 12, 18.50, 15.000),
('7861001200039', 'Cable USB C a USB C Baseus 1m', 'Cable trenzado de datos y carga rápida', 12, 6.90, 20.000),
('7861001200046', 'Audífonos In-Ear Sony MDR-EX15AP con Micrófono', 'Auriculares de cable con manos libres', 12, 12.90, 15.000),
('7861001200053', 'Memoria Flash USB 3.0 Kingston 64GB', 'Pendrive metálico de alta velocidad', 12, 7.80, 25.000),
('7861001200060', 'Foco LED Inteligente Xiaomi Smart Bulb', 'Luz LED multicolor Wifi compatible con Alexa', 12, 14.50, 12.000),
('7861001200077', 'Extensión Eléctrica Multiprim 3 Metros', 'Regleta multitoma de 4 entradas', 12, 4.90, 20.000),
('7861001200084', 'Mouse Inalámbrico Logitech M185 Gris', 'Mouse inalámbrico óptico USB nanoreceptor', 12, 11.50, 15.000),
('7861001200091', 'Tarjeta MicroSD Kingston Canvas 128GB Clase 10', 'Tarjeta de memoria con adaptador SD', 12, 13.90, 15.000),
('7861001200107', 'Adaptador Bluetooth 5.0 USB para PC', 'Dongle transmisor inalámbrico para laptop', 12, 5.50, 10.000),
('7861001200114', 'Teclado Alámbrico USB Logitech K120', 'Teclado tradicional resistente a derrames', 12, 9.99, 12.000),
('7861001200121', 'Soporte Metálico de Pared para TV 32-55"', 'Soporte fijo de alta resistencia', 12, 14.90, 10.000),
('7861001200138', 'Repetidor de Señal Wifi TP-Link Extender', 'Amplificador de cobertura inalámbrica', 12, 22.00, 8.000),
('7861001200145', 'Batería Portátil Powerbank Adata 10000mAh', 'Cargador portátil con doble puerto USB', 12, 15.90, 10.000),
('7861001200152', 'Audífonos Bluetooth Inalámbricos JBL Tune', 'Auriculares de diadema con graves puros', 12, 38.00, 5.000),
('7861001200169', 'Calculadora Científica Casio FX-82LAX', 'Calculadora escolar avanzada en español', 12, 16.50, 15.000),
('7861001200176', 'Cable HDMI 2.0 de Alta Velocidad 1.8m', 'Cable para resolución 4K y Full HD', 12, 3.80, 20.000),
('7861001200183', 'Base Refrigeradora para Laptop con Ventilador', 'Soporte ergonómico con extractor de calor', 12, 12.50, 10.000),
('7861001200190', 'Router inalámbrico Smart TP-Link Archer', 'Router dual band alta cobertura', 12, 34.00, 6.000),
('7861001200206', 'Adaptador OTG USB a Tipo C Metálico', 'Convertidor rápido para celular', 12, 2.10, 30.000),
('7861001200213', 'Lector de Memorias SD y MicroSD USB', 'Lector de tarjetas compacto', 12, 3.50, 15.000),
('7861001200220', 'Cámara Web USB HD con Micrófono', 'Cámara para videoconferencias y streaming', 12, 18.00, 8.000),
('7861001200237', 'Cargador de Auto Carga Rápida Dual USB', 'Adaptador encendedor de auto', 12, 5.90, 15.000),
('7861001200244', 'Smartwatch Deportivo Digital Band 6', 'Pulsera inteligente de ritmo cardíaco', 12, 29.90, 8.000),
('7861001200251', 'Parlante Bluetooth Impermeable Portable', 'Altavoz inalámbrico recargable', 12, 19.50, 10.000),

-- Categoría 13: Hogar
('7861001300012', 'Sartén de Aluminio Antiadherente Umco 24cm', 'Sartén con doble capa de teflón', 13, 8.90, 15.000),
('7861001300029', 'Vaso de Vidrio Templado Crisa pack x6', 'Vasos transparentes de mesa familiares', 13, 4.20, 20.000),
('7861001300036', 'Juego de Cubiertos Tramontina Inox x12', 'Cucharas, tenedores y cuchillos de mesa', 13, 6.50, 15.000),
('7861001300043', 'Toalla de Baño de Algodón Teka 70x130cm', 'Toalla absorbente afelpada gruesa', 13, 7.20, 15.000),
('7861001300050', 'Almohada de Fibra Siliconada Ortopédica Chaide', 'Almohada blanda antialérgica de descanso', 13, 8.50, 20.000),
('7861001300067', 'Olla de Presión de Aluminio Umco 4L', 'Olla clásica con sistema de válvulas', 13, 24.90, 8.000),
('7861001300074', 'Caja de Herramientas Plástica Estándar', 'Caja con compartimentos y asa de transporte', 13, 11.20, 10.000),
('7861001300081', 'Platos Playeros Hondos de Porcelana Corona x6', 'Vajilla tradicional de comedor', 13, 9.80, 12.000),
('7861001300098', 'Organizador de Zapatos Plástico Armable', 'Estante modular de 4 niveles para calzado', 13, 12.50, 10.000),
('7861001300104', 'Linterna LED de Mano Recargable', 'Linterna potente recarga de tomacorriente', 13, 5.10, 15.000),
('7861001300111', 'Colador de Acero Inoxidable de Cocina', 'Colador de malla fina metálica', 13, 3.20, 15.000),
('7861001300128', 'Cuchillo de Cocina Tramontina Profesional 8"', 'Cuchillo de chef de acero inoxidable', 13, 4.80, 20.000),
('7861001300135', 'Cafetera de Filtro Eléctrica Oster 12 Tazas', 'Cafetera tradicional programable de goteo', 13, 34.90, 5.000),
('7861001300142', 'Jarra de Vidrio para Agua con Tapa Plástica 1.5L', 'Jarra resistente para refrigeradora', 13, 3.90, 15.000),
('7861001300159', 'Tabla de Picar de Plástico Higiénica 30x40', 'Tabla libre de BPA antideslizante', 13, 3.10, 20.000),
('7861001300166', 'Sanduchera Eléctrica Antiadherente Oster', 'Placas calientes de cierre sellado', 13, 22.50, 8.000),
('7861001300173', 'Licuadora de Vaso de Vidrio Oster 1.5L', 'Licuadora clásica de 2 velocidades', 13, 48.00, 6.000),
('7861001300180', 'Ganchos de Ropa Plásticos pack x12', 'Ganchos organizadores de armario negros', 13, 1.80, 30.000),
('7861001300197', 'Perchero de Madera para Pared 4 Ganchos', 'Perchero esquinero barnizado resistente', 13, 5.90, 10.000),
('7861001300203', 'Balde de Agua de Plástico con Asa 12L', 'Balde de limpieza de gran capacidad', 13, 2.30, 25.000),
('7861001300210', 'Termo de Acero Inoxidable Lumilagro 1L', 'Termo de conservación caliente 12 horas', 13, 14.20, 10.000),
('7861001300227', 'Contenedor de Alimentos Hermético Lock & Lock 1L', 'Taper hermético de alta seguridad', 13, 4.10, 20.000),
('7861001300234', 'Cortina de Baño de Poliéster Impermeable', 'Cortina lavable de ducha con argollas', 13, 6.90, 15.000),
('7861001300241', 'Escoba de Cerdas Suaves para Interiores', 'Escoba barredora de pisos delicados', 13, 1.95, 25.000),
('7861001300258', 'Basurero de Pedal Plástico 15L Estella', 'Tacho de basura higiénico de cocina', 13, 7.80, 12.000),

-- Categoría 14: Papelería
('7861001400019', 'Cuaderno Universitario Estilo Espiral Líneas 100 Hojas', 'Cuaderno escolar espirado básico', 14, 1.45, 50.000),
('7861001400026', 'Bolígrafo Bic Cristal Azul pack x4', 'Plumas de tinta seca punto medio', 14, 1.20, 60.000),
('7861001400033', 'Lápiz de Grafito Faber-Castell HB pack x4', 'Lápices clásicos escolares de madera', 14, 1.10, 60.000),
('7861001400040', 'Caja de Lápices de Colores Faber-Castell x12', 'Colores vivos y minas de alta resistencia', 14, 3.40, 30.000),
('7861001400057', 'Resma de Papel Bond A4 Report 500 Hojas', 'Papel blanco de impresión fotocopiadora', 14, 4.60, 40.000),
('7861001400064', 'Goma Blanca Escolar Elmer s 118ml', 'Pegamento escolar lavable no tóxico', 14, 1.15, 35.000),
('7861001400071', 'Marcadores Permanentes Sharpie Negro pack x2', 'Marcadores punta fina de tinta indeleble', 14, 2.50, 30.000),
('7861001400088', 'Carpeta Plástica con Vincha A4 pack x5', 'Carpetas de oficina archiveras', 14, 1.80, 40.000),
('7861001400095', 'Tijera Escolar punta roma Mundial 13cm', 'Tijera de seguridad para niños', 14, 0.95, 30.000),
('7861001400101', 'Juego Geométrico Plástico Flexible 4 Piezas', 'Regla, escuadras y transportador irrompibles', 14, 1.60, 25.000),
('7861001400118', 'Cinta Adhesiva Transparente Scotch 18mx12mm x3', 'Rollos de cinta scotch escolares', 14, 1.25, 40.000),
('7861001400125', 'Borrador de Queso Faber-Castell pack x2', 'Borradores blancos suaves para papel', 14, 0.60, 50.000),
('7861001400132', 'Sacapuntas con Depósito Plástico x2', 'Sacapuntas de doble orificio para lápices', 14, 0.90, 45.000),
('7861001400149', 'Resaltadores de Texto Stabilo Boss pack x4', 'Marcadores fluorescentes pastel', 14, 4.20, 20.000),
('7861001400156', 'Plastilina Escolar de barra Pelikan x10 colores', 'Masas moldeadoras suaves de colores', 14, 1.85, 30.000),
('7861001400163', 'Notas Adhesivas Post-it Amarillas 76x76mm', 'Taco de notas removibles amarillas', 14, 1.40, 30.000),
('7861001400170', 'Engrapadora de Oficina Metálica Petrus', 'Engrapadora estándar para grapas 26/6', 14, 5.90, 15.000),
('7861001400187', 'Grapas Metálicas Petrus 26/6 caja x5000', 'Consumibles de oficina estándar', 14, 1.20, 25.000),
('7861001400194', 'Clips de Oficina Metálicos Standard caja x100', 'Clips niquelados de tamaño mediano', 14, 0.75, 40.000),
('7861001400200', 'Corrector Líquido tipo Lápiz Liquid Paper', 'Lapicero corrector de secado rápido', 14, 1.10, 35.000),
('7861001400217', 'Marcadores de Pizarra Recargables Pilot pack x4', 'Marcadores de borrado seco para acrílico', 14, 4.80, 20.000),
('7861001400224', 'Fomi de Colores formato A4 pack x10', 'Láminas de espuma EVA de manualidades', 14, 1.50, 25.000),
('7861001400231', 'Cartulina Escolar de Colores A4 pack x20', 'Cartulinas de colores variados ligeras', 14, 1.70, 30.000),
('7861001400248', 'Papel Crepé Escolar Pliego pack x5 colores', 'Papel para manualidades y decoración', 14, 1.10, 25.000),
('7861001400255', 'Agenda Diaria Ejecutiva Pasta Dura', 'Libreta de planificación ejecutiva', 14, 6.50, 12.000);

-- ============================================================================
-- PRODUCTOS (Corregido id_categoria y formato de stock)
-- ============================================================================
INSERT INTO productos (codigo_barras, nombre, descripcion, id_categoria, precio_venta_actual, stock_minimo_alerta) VALUES
-- Lácteos (id_categoria = 1)
('7861000111008', 'Leche Entera Vita 1L', 'Leche ultra pasteurizada UHT', 1, 1.05, 50),
('7861000111209', 'Yogurt Batido Tony Fresa 1kg', 'Yogurt entero con sabor a fresa', 1, 2.85, 25),
('7861900111213', 'Queso Mozzarella Kiosko 500g', 'Queso semiduro para fundir', 1, 4.50, 15),
('7861005111220', 'Mantequilla con Sal Girasol 200g', 'Mantequilla de crema de leche', 1, 1.90, 30),

-- Abarrotes y Despensa (id_categoria = 6 en lugar de 1)
('7861080111015', 'Arroz Súper Extra Real 5kg', 'Arroz de grano largo seleccionado', 6, 6.50, 40),
('7861090111039', 'Aceite Vegetal La Favorita 900ml', 'Aceite comestible de palma y soya', 6, 2.10, 45),
('7861070111046', 'Atún en Aceite Real 160g', 'Lomitos de atún en aceite vegetal', 6, 1.45, 60),
('7861001111053', 'Salsa de Tomate Maggi 400g', 'Salsa de tomate lista para consumir', 6, 1.20, 35),
('7861200111084', 'Fideos Tallarín Sumesa 400g', 'Pasta de sémola de trigo fortificada', 6, 0.85, 50),
('7861300111091', 'Lenteja Criolla Facundo 500g', 'Lenteja seleccionada en grano seco', 6, 1.10, 30),
('7861400111114', 'Azúcar Blanco Valdez 2kg', 'Azúcar de caña refinada', 6, 2.20, 40),
('7861600111121', 'Sal Yodada Cris-Sal 1kg', 'Sal fina de mesa y cocina', 6, 0.45, 50);

---------------------------PROMOCIONES--------------------------------
----------------------------------------------------------------------
INSERT INTO promociones (nombre_campana, descripcion, porcentaje_descuento, monto_descuento_fijo, fecha_inicio, fecha_fin, creado_por) VALUES
('Regreso a Clases', 'Descuentos en útiles escolares, mochilas y tecnología de estudio.', 15.00, 0.50, '2026-08-15 00:00:00-05', '2026-09-15 23:59:59-05', 'admin'),
('Black Friday', 'La locura de precios bajos en toda la tienda por tiempo limitado.', 30.00, 0.00, '2026-11-27 00:00:00-05', '2026-11-30 23:59:59-05', 'admin'),
('Navidad', 'Regalos especiales y ofertas navideñas para toda la familia.', 25.00, 1.00, '2026-12-01 00:00:00-05', '2026-12-26 23:59:59-05', 'admin'),
('Semana Santa', 'Promociones de temporada de viaje y productos de Pascua.', 10.00, 0.00, '2026-03-29 00:00:00-05', '2026-04-05 23:59:59-05', 'admin'),
('Aniversario DataMart', 'Celebrando un año más contigo con descuentos masivos.', 20.00, 0.35, '2026-10-01 00:00:00-05', '2026-10-07 23:59:59-05', 'admin'),
('2x1 Bebidas', 'Lleva dos y paga uno en marcas seleccionadas de bebidas.', 50.00, 1.10, '2026-07-17 00:00:00-05', '2026-07-20 23:59:59-05', 'admin');

--------------------------EMPLEADOS------------------------------------
-----------------------------------------------------------------------

-- ============================================================================
-- EMPLEADOS (Con columna fecha_contratacion)
-- ============================================================================
INSERT INTO empleados (numero_identificacion, nombre_completo, cargo, telefono, correo, fecha_contratacion) VALUES
-- Lote 1
('0912345678', 'Carlos Alberto Mendoza Vera', 'Gerente de Sucursal', '+593991234567', 'carlos.mendoza@email.com', '2021-01-15'),
('0923456789', 'María Fernanda Gómez Ortiz', 'Administrador', '+593992345678', 'maria.gomez@email.com', '2021-03-01'),
('0934567890', 'Juan José Paredes Silva', 'Jefe de Inventario', '+593993456789', 'juan.paredes@email.com', '2021-06-10'),
('0945678901', 'Ana Lucía Torres Benítez', 'Supervisora de Caja', '+593994567890', 'ana.torres@email.com', '2022-02-01'),
('0956789012', 'Luis Eduardo Morales Castro', 'Cajero', '+593995678901', 'luis.morales@email.com', '2022-04-15'),
('0967890123', 'Diana Patricia Ramos Cevallos', 'Cajero', '+593996789012', 'diana.ramos@email.com', '2022-05-20'),
('0978901234', 'Jorge Luis Intriago Andrade', 'Cajero', '+593997890123', 'jorge.intriago@email.com', '2022-08-01'),
('0989012345', 'Sofía Isabel Delgado Freire', 'Perchero / Reponedor', '+593998901234', 'sofia.delgado@email.com', '2022-09-15'),
('0990123456', 'Pedro Pablo Salazar Zambrano', 'Perchero / Reponedor', '+593999012345', 'pedro.salazar@email.com', '2022-11-01'),
('0911223344', 'Gabriela Elizabeth Vera Espinoza', 'Atención al Cliente', '+593991122334', 'gabriela.vera@email.com', '2023-01-10'),
('0922334455', 'Roberto Carlos Mendoza Moreira', 'Encargado de Bodega', '+593992233445', 'roberto.mendoza@email.com', '2023-02-15'),
('0933445566', 'Andrea Valeria Solórzano Vega', 'Cajero', '+593993344556', 'andrea.solorzano@email.com', '2023-03-20'),
('0944556677', 'Fernando José Holguín Bravo', 'Seguridad', '+593994455667', 'fernando.holguin@email.com', '2023-05-01'),
('0955667788', 'Patricia Elena Cedeño Loor', 'Perchero / Reponedor', '+593995566778', 'patricia.cedeno@email.com', '2023-06-12'),
('0966778899', 'Ricardo Xavier Andrade Viteri', 'Auxiliar de Limpieza', '+593996677889', 'ricardo.andrade@email.com', '2023-07-01'),
('0977889900', 'Verónica Alexandra Castro Franco', 'Cajero', '+59399788990', 'veronica.castro@email.com', '2023-08-15'),
('0988990011', 'Miguel Ángel Barrezueta Navarrete', 'Perchero / Reponedor', '+593998899001', 'miguel.barrezueta@email.com', '2023-09-01'),
('0999001122', 'Valeria Beatriz Montero Alarcón', 'Asistente Administrativo', '+593999900112', 'valeria.montero@email.com', '2023-10-10'),
('0910928374', 'Diego Armando Sucre Ronquillo', 'Técnico de Mantenimiento', '+593991092837', 'diego.sucre@email.com', '2023-11-05'),
('0921827364', 'Camila Andrea Cevallos Álava', 'Cajero', '+593992817364', 'camila.cevallos@email.com', '2023-12-01'),

-- Lote 2 (Nuevos registros)
('0912131415', 'Christian Xavier Villacís Romero', 'Cajero', '+593991213141', 'christian.villacis@email.com', '2024-01-15'),
('0923242526', 'Mónica Alexandra Guamanquishpe Vaca', 'Atención al Cliente', '+593992324252', 'monica.guaman@email.com', '2024-02-01'),
('0934353637', 'Gabriel Esteban Narváez Jácome', 'Perchero / Reponedor', '+593993435363', 'gabriel.narvaez@email.com', '2024-02-15'),
('0945464748', 'Katherine Dayana Chiriboga Mieles', 'Cajero', '+593994546474', 'katherine.chiriboga@email.com', '2024-03-01'),
('0956575859', 'Marlo Fabricio Barahona Soria', 'Encargado de Bodega', '+593995657585', 'marlo.barahona@email.com', '2024-03-20'),
('0967686970', 'Lissette Stephania Alarcón Parra', 'Supervisora de Caja', '+593996768697', 'lissette.alarcon@email.com', '2024-04-10'),
('0978798081', 'Álvaro Mauricio Cárdenas Tinoco', 'Perchero / Reponedor', '+593997879808', 'alvaro.cardenas@email.com', '2024-05-01'),
('0989909192', 'Evelyn Nathaly Quizhpe Sarango', 'Cajero', '+593998990919', 'evelyn.quizhpe@email.com', '2024-05-15'),
('0990010203', 'Felipe Andres Santamaría Lucio', 'Técnico de Mantenimiento', '+593999001020', 'felipe.santamaria@email.com', '2024-06-01'),
('0911020304', 'Paola Fernanda Benavides Yepez', 'Asistente Administrativo', '+593991102030', 'paola.benavides@email.com', '2024-06-15');



--------------------------------CLIENTES--------------------------------
------------------------------------------------------------------------
INSERT INTO clientes (
    numero_identificacion, nombre_completo, correo_electronico, telefono, direccion, creado_por )
SELECT 
    -- 1. Identificación única simulando cédulas/DNI (ej: 1750000001 al 1750000500)
    (1750000000 + i)::VARCHAR AS numero_identificacion,
    
    -- 2. Nombre completo combinando nombres (alternando masculino/femenino) y dos apellidos
    CASE 
        WHEN mod(i, 2) = 0 THEN 
            nombres_masculinos[mod(i, 20) + 1]
        ELSE 
            nombres_femeninos[mod(i, 20) + 1]
    END 
    || ' ' || apellidos[mod(i * 3, 25) + 1] 
    || ' ' || apellidos[mod(i * 7, 25) + 1] AS nombre_completo,
    
    -- 3. Correo electrónico basado en sus nombres y el ID para asegurar unicidad
    LOWER(
        CASE 
            WHEN mod(i, 2) = 0 THEN nombres_masculinos[mod(i, 20) + 1]
            ELSE nombres_femeninos[mod(i, 20) + 1]
        END
    ) || '.' || LOWER(apellidos[mod(i * 3, 25) + 1]) || i || '@gmail.com' AS correo_electronico,
    
    -- 4. Teléfono móvil de 10 dígitos (ej: +59398XXXXXXX)
    '+5939' || LPAD((8000000 + i * 23)::TEXT, 8, '0') AS telefono,
    
    -- 5. Dirección dinámica combinando calles, números de casa y ciudades comunes
    calles[mod(i, 10) + 1] || ' N' || (mod(i * 4, 90) + 10) || '-' || (mod(i * 9, 80) + 10) 
    || ', ' || ciudades[mod(i * 2, 5) + 1] AS direccion,
    
    'generator_script' AS creado_por

FROM generate_series(1, 500) AS i
CROSS JOIN (
    SELECT 
        -- Lista extensa de nombres y apellidos
        ARRAY['Juan', 'Carlos', 'Luis', 'Andres', 'Jorge', 'Pedro', 'Jose', 'Santiago', 'David', 'felipe', 'Diego', 'Mateo', 'Daniel', 'Sebastian', 'Mario', 'Francisco', 'Manuel', 'Ricardo', 'Alejandro', 'Gabriel'] AS nombres_masculinos,
        ARRAY['Maria', 'Ana', 'Diana', 'Gabriela', 'Patricia', 'Silvia', 'Natalia', 'Camila', 'Sofia', 'Valeria', 'Paulina', 'Andrea', 'Laura', 'Carla', 'Isabel', 'Veronica', 'Mariana', 'Estefania', 'Ximena', 'Adriana'] AS nombres_femeninos,
        ARRAY['Gomez', 'Lopez', 'Martinez', 'Rodriguez', 'Perez', 'Sanchez', 'Ramirez', 'Torres', 'Flores', 'Diaz', 'Castro', 'Silva', 'Alvear', 'Ortiz', 'Viteri', 'Cardenas', 'Cabrera', 'Morales', 'Espinosa', 'Rivas', 'Delgado', 'Vega', 'Solis', 'Mora', 'Paredes'] AS apellidos,
        
        -- Datos de ubicación para las direcciones
        ARRAY['Av. Amazonas', 'Calle Guayaquil', 'Av. De los Shyris', 'Calle Venezuela', 'Av. 10 de Agosto', 'Calle Flores', 'Av. Republica', 'Calle Bolivar', 'Av. Eloy Alfaro', 'Calle Esmeraldas'] AS calles,
        ARRAY['Quito', 'Guayaquil', 'Cuenca', 'Ambato', 'Manta'] AS ciudades
) AS alias_datos;


-----------------------INVENTARIOS--------------------
------------------------------------------------------

INSERT INTO inventarios
(
    id_sucursal,
    id_producto,
    stock_actual,
    creado_por
)
WITH productos_clasificados AS (
    -- 1. Numeramos todos los productos en un orden consistente
    SELECT 
        p.id_producto,
        p.id_categoria,
        ROW_NUMBER() OVER (ORDER BY p.id_producto) AS num_fila,
        COUNT(*) OVER () AS total_productos
    FROM productos p
),
productos_con_sucursal AS (
    -- 2. Asignamos la sucursal según el porcentaje correspondiente del total de productos
    SELECT 
        id_producto,
        id_categoria,
        CASE 
            -- Grupo 1 (10%): Sucursales 1, 4, 5
            WHEN num_fila <= total_productos * 0.10 THEN 
                CASE 
                    WHEN num_fila % 3 = 1 THEN 1
                    WHEN num_fila % 3 = 2 THEN 4
                    ELSE 5
                END

            -- Grupo 2 (25%): Sucursales 2, 6, 7, 9
            WHEN num_fila <= total_productos * 0.35 THEN 
                CASE 
                    WHEN num_fila % 4 = 1 THEN 2
                    WHEN num_fila % 4 = 2 THEN 6
                    WHEN num_fila % 4 = 3 THEN 7
                    ELSE 9
                END

            -- Grupo 3 (15%): Sucursales 10, 3
            WHEN num_fila <= total_productos * 0.50 THEN 
                CASE 
                    WHEN num_fila % 2 = 1 THEN 10
                    ELSE 3
                END

            -- Grupo 4 (35%): Sucursal 12
            WHEN num_fila <= total_productos * 0.85 THEN 12

            -- Grupo 5 (15%): Sucursales 8, 11
            ELSE 
                CASE 
                    WHEN num_fila % 2 = 1 THEN 8
                    ELSE 11
                END
        END AS id_sucursal
    FROM productos_clasificados
)
SELECT
    ps.id_sucursal,
    ps.id_producto,

    ROUND(
        (
            CASE
                -- Productos con alta rotación
                WHEN c.nombre IN (
                    'Lácteos',
                    'Bebidas',
                    'Panadería',
                    'Frutas',
                    'Verduras'
                )
                THEN random()*400 + 150

                -- Productos normales
                WHEN c.nombre IN (
                    'Aseo Personal',
                    'Limpieza',
                    'Mascotas'
                )
                THEN random()*180 + 60

                -- Productos de baja rotación
                ELSE random()*70 + 10
            END
        )::numeric,
        3
    ) AS stock_actual,

    'script'

FROM productos_con_sucursal ps
INNER JOIN categorias c ON c.id_categoria = ps.id_categoria
ORDER BY ps.id_sucursal, ps.id_producto;

------------OTRA INSERCION DE DATOS PARA INVENTARIOS
INSERT INTO inventarios (
    id_sucursal,
    id_producto,
    stock_actual,
    creado_por
)
WITH candidata_inventario AS (
    SELECT 
        s.id_sucursal,
        p.id_producto,
        p.id_categoria,
        random() AS probabilidad
    FROM sucursales s
    CROSS JOIN productos p
),
nuevas_combinaciones AS (
    SELECT 
        id_sucursal,
        id_producto,
        id_categoria
    FROM candidata_inventario
    WHERE 
        -- Sucursal 12 (35% capacidad): Asigna el 90% de todo el catálogo
        (id_sucursal = 12 AND probabilidad <= 0.90) OR
        
        -- Grupo 2 (25% capacidad: Sucursales 2, 6, 7, 9): Asigna el 70% del catálogo
        (id_sucursal IN (2, 6, 7, 9) AND probabilidad <= 0.70) OR
        
        -- Grupo 3 y 5 (15% capacidad: Sucursales 3, 8, 10, 11): Asigna el 50% del catálogo
        (id_sucursal IN (3, 8, 10, 11) AND probabilidad <= 0.50) OR
        
        -- Grupo 1 (10% capacidad: Sucursales 1, 4, 5): Asigna el 35% del catálogo
        (id_sucursal IN (1, 4, 5) AND probabilidad <= 0.35)
)
SELECT
    nc.id_sucursal,
    nc.id_producto,

    -- Generamos el stock actual de forma aleatoria
    ROUND(
        (
            CASE
                WHEN c.nombre IN ('Lácteos', 'Bebidas', 'Panadería', 'Frutas', 'Verduras')
                    THEN random() * 350 + 5
                WHEN c.nombre IN ('Aseo Personal', 'Limpieza', 'Mascotas')
                    THEN random() * 150 + 5
                ELSE random() * 60 + 2
            END
        )::numeric, 
        3
    ) AS stock_actual,

    'script_expansion' AS creado_por

FROM nuevas_combinaciones nc
INNER JOIN categorias c ON c.id_categoria = nc.id_categoria

-- Omitir duplicados si el producto ya existe en esa sucursal
ON CONFLICT (id_sucursal, id_producto) DO NOTHING;

-----------------------------TARJETAS FIDELIZACION---------------------
-----------------------------------------------------------------------

TRUNCATE TABLE tarjetas_fidelizacion RESTART IDENTITY;

INSERT INTO tarjetas_fidelizacion
(
    id_cliente,
    codigo_tarjeta,
    puntos_acumulados,
    fecha_afiliacion,
    creado_por
)

SELECT

    c.id_cliente,

    'DM360-' || LPAD(c.id_cliente::TEXT,8,'0'),

    FLOOR(random()*5001)::INT,

    CURRENT_DATE - FLOOR(random()*1825)::INT,

    'script'

FROM clientes c

WHERE random() <= 0.75

ORDER BY c.id_cliente;



-------------------------- COMPRAS --------------------------
-------------------------------------------------------------

TRUNCATE TABLE compras RESTART IDENTITY CASCADE;

INSERT INTO compras (
    id_proveedor,
    id_sucursal,
    numero_factura_proveedor,
    fecha_compra,
    subtotal,
    impuesto,
    total_pagado,
    creado_por
)
WITH 
  arr_provs AS (SELECT ARRAY_AGG(id_proveedor) AS ids FROM proveedores),
  arr_sucs  AS (SELECT ARRAY_AGG(id_sucursal) AS ids FROM sucursales)
SELECT 
    p.ids[1 + floor(random() * array_length(p.ids, 1))::INT] AS id_proveedor,
    s.ids[1 + floor(random() * array_length(s.ids, 1))::INT] AS id_sucursal,
    CONCAT('FAC-PROV-', LPAD(gs::TEXT, 6, '0')) AS numero_factura_proveedor,
    CURRENT_TIMESTAMP - (random() * 180 || ' days')::INTERVAL AS fecha_compra,
    0.00 AS subtotal,
    0.00 AS impuesto,
    0.00 AS total_pagado,
    'script_generator' AS creado_por
FROM generate_series(1, 100) gs
CROSS JOIN arr_provs p
CROSS JOIN arr_sucs s;



--------------------- DETALLES_COMPRAS -----------------------
--------------------------------------------------------------

TRUNCATE TABLE detalles_compras RESTART IDENTITY CASCADE;


INSERT INTO detalles_compras (
    id_compra,
    id_producto,
    cantidad_recibida,
    costo_unitario_compra,
    creado_por
)
WITH compras_productos AS (
    SELECT 
        c.id_compra,
        p.id_producto,
        p.precio_venta_actual,
        ROW_NUMBER() OVER (PARTITION BY c.id_compra ORDER BY random()) as rn,
        (3 + floor(random() * 6))::INT as max_prods
    FROM compras c
    CROSS JOIN productos p
)
SELECT 
    cp.id_compra,
    cp.id_producto,
    -- Cantidad recibida (volumen de reabastecimiento razonable: 20 a 120 unidades)
    ROUND((20 + random() * 100)::numeric, 2) AS cantidad_recibida,
    
    -- Costo de compra: entre 55% y 70% del precio de venta (Margen de ganancia de 30% a 45%)
    ROUND((cp.precio_venta_actual * (0.55 + random() * 0.15))::numeric, 2) AS costo_unitario_compra,
    
    'script_generator' AS creado_por
FROM compras_productos cp
WHERE cp.rn <= cp.max_prods;

--ACTUALIZAR 
UPDATE compras c
SET
    subtotal     = ROUND(x.subtotal_compra, 2),
    impuesto     = ROUND(x.subtotal_compra * 0.15, 2), -- 15% IVA
    total_pagado = ROUND(x.subtotal_compra * 1.15, 2)
FROM (
    SELECT
        id_compra,
        SUM(cantidad_recibida * costo_unitario_compra) AS subtotal_compra
    FROM detalles_compras
    GROUP BY id_compra
) x
WHERE c.id_compra = x.id_compra;

------------------------------------------------------------
-- REGENERACIÓN DE FACTURAS Y DETALLES DE FACTURAS
------------------------------------------------------------

BEGIN;

------------------------------------------------------------
-- LIMPIAR DATOS ANTERIORES
------------------------------------------------------------

TRUNCATE TABLE detalles_facturas, facturas RESTART IDENTITY CASCADE;


------------------------------------------------------------
--  GENERAR 15.000 FACTURAS
------------------------------------------------------------

INSERT INTO facturas (
    numero_factura,
    fecha_emision,
    id_cliente,
    id_metodo_pago,
    id_sucursal,
    subtotal_neto,
    total_descuento,
    total_impuesto,
    total_pagar,
    creado_por
)
WITH
arr_clientes AS (
    SELECT ARRAY_AGG(id_cliente) AS ids
    FROM clientes
),
arr_metodos AS (
    SELECT ARRAY_AGG(id_metodo_pago) AS ids
    FROM metodos_pago
),
arr_sucursales AS (
    SELECT ARRAY_AGG(id_sucursal) AS ids
    FROM sucursales
)
SELECT
    CONCAT('FAC-', LPAD(gs::TEXT, 8, '0')) AS numero_factura,

    TIMESTAMPTZ '2024-01-01 08:00:00'
        + random() * (
            CURRENT_TIMESTAMP
            - TIMESTAMPTZ '2024-01-01 08:00:00'
        ) AS fecha_emision,

    c.ids[
        1 + floor(
            random() * array_length(c.ids, 1)
        )::INT
    ] AS id_cliente,

    m.ids[
        1 + floor(
            random() * array_length(m.ids, 1)
        )::INT
    ] AS id_metodo_pago,

    s.ids[
        1 + floor(
            random() * array_length(s.ids, 1)
        )::INT
    ] AS id_sucursal,

    0.00 AS subtotal_neto,
    0.00 AS total_descuento,
    0.00 AS total_impuesto,
    0.00 AS total_pagar,

    'script_generator' AS creado_por

FROM generate_series(1, 15000) gs

CROSS JOIN arr_clientes c
CROSS JOIN arr_metodos m
CROSS JOIN arr_sucursales s;


------------------------------------------------------------
--  GENERAR DETALLES DE LAS FACTURAS
------------------------------------------------------------

INSERT INTO detalles_facturas (
    id_factura,
    id_producto,
    cantidad,
    precio_unitario_historico,
    descuento_aplicado,
    impuesto_aplicado,
    creado_por
)
WITH productos_disponibles AS (
    SELECT
        p.id_producto,
        p.precio_venta_actual
    FROM productos p
    WHERE p.precio_venta_actual IS NOT NULL
      AND p.precio_venta_actual > 0
),

cantidad_productos AS (
    SELECT
        f.id_factura,
        (1 + floor(random() * 5))::INT AS cantidad_productos
    FROM facturas f
),

productos_factura AS (
    SELECT
        cp.id_factura,
        p.id_producto,
        p.precio_venta_actual,

        ROW_NUMBER() OVER (
            PARTITION BY cp.id_factura
            ORDER BY random()
        ) AS numero_producto,

        cp.cantidad_productos

    FROM cantidad_productos cp
    CROSS JOIN productos_disponibles p
),

detalles_seleccionados AS (
    SELECT
        id_factura,
        id_producto,
        precio_venta_actual
    FROM productos_factura
    WHERE numero_producto <= cantidad_productos
),

valores_base AS (
    SELECT
        id_factura,
        id_producto,

        (1 + floor(random() * 6))::NUMERIC(10,3)
            AS cantidad,

        precio_venta_actual
            AS precio_unitario_historico,

        random()
            AS probabilidad_descuento,

        (0.05 + random() * 0.10)
            AS porcentaje_descuento

    FROM detalles_seleccionados
),

calculos AS (
    SELECT
        id_factura,
        id_producto,
        cantidad,
        precio_unitario_historico,

        cantidad * precio_unitario_historico
            AS subtotal_linea,

        CASE
            WHEN probabilidad_descuento < 0.15
            THEN ROUND(
                (
                    cantidad
                    * precio_unitario_historico
                    * porcentaje_descuento
                )::NUMERIC,
                2
            )
            ELSE 0.00
        END AS descuento_aplicado

    FROM valores_base
)

SELECT
    id_factura,
    id_producto,
    cantidad,
    precio_unitario_historico,
    descuento_aplicado,

    ROUND(
        (
            (
                subtotal_linea
                - descuento_aplicado
            ) * 0.15
        )::NUMERIC,
        2
    ) AS impuesto_aplicado,

    'script_generator' AS creado_por

FROM calculos;


------------------------------------------------------------
-- 4. ACTUALIZAR FACTURAS DESDE SUS DETALLES
------------------------------------------------------------

UPDATE facturas f
SET
    subtotal_neto = ROUND(x.subtotal_neto, 2),

    total_descuento = ROUND(x.total_descuento, 2),

    total_impuesto = ROUND(x.total_impuesto, 2),

    total_pagar = ROUND(
        x.subtotal_neto
        - x.total_descuento
        + x.total_impuesto,
        2
    )

FROM (
    SELECT
        id_factura,

        SUM(
            cantidad * precio_unitario_historico
        ) AS subtotal_bruto,

        SUM(descuento_aplicado)
            AS total_descuento,

        SUM(impuesto_aplicado)
            AS total_impuesto,

        SUM(
            cantidad * precio_unitario_historico
            - descuento_aplicado
        ) AS subtotal_neto

    FROM detalles_facturas

    GROUP BY id_factura

) x

WHERE f.id_factura = x.id_factura;


------------------------------------------------------------
-- 5. CONFIRMAR TRANSACCIÓN
------------------------------------------------------------

COMMIT;

------------------------TPRODUCTOS PROMOCIONES-------------------------
-----------------------------------------------------------------------
INSERT INTO productos_promociones (
    id_producto,
    id_promocion,
    activo,
    creado_por
)
SELECT DISTINCT ON (p.id_producto, pr.id_promocion)
    p.id_producto,
    pr.id_promocion,
    TRUE AS activo,
    'script_generator' AS creado_por
FROM productos p
CROSS JOIN promociones pr
WHERE random() < 0.15  -- Asigna la promoción aproximadamente al 15% de las combinaciones
ON CONFLICT (id_producto, id_promocion) DO NOTHING;

--------------------------USUARIOS SISTEMAS----------------------------
-----------------------------------------------------------------------
INSERT INTO usuarios_sistema (
    id_empleado,
    username,
    password_hash,
    rol,
    creado_por
)
SELECT
    e.id_empleado,
    -- Normaliza el nombre: minúsculas, sin espacios y concatenado con el ID para asegurar unicidad
    LOWER(
        REGEXP_REPLACE(
            TRANSLATE(e.nombre_completo, 'áéíóúÁÉÍÓÚñÑ', 'aeiouAEIOUnN'), 
            '[^a-zA-Z0-9]', '_', 'g'
        )
    ) || '_' || e.id_empleado AS username,
    
    -- Hash simulado seguro (Ej. bcrypt/argon2 format demo)
    '$2a$12$eImiTXuWVxfM37uY4JANjO.GgS1.y1I5S.N0oR7xG8yA1w2z3x4y5' AS password_hash,
    
    -- Mapeo flexible de roles según el cargo
    CASE
        WHEN e.cargo ILIKE '%gerente%' OR e.cargo ILIKE '%administrador%' THEN 'ADMIN'
        WHEN e.cargo ILIKE '%cajero%' OR e.cargo ILIKE '%vendedor%' THEN 'CAJERO'
        WHEN e.cargo ILIKE '%bodega%' OR e.cargo ILIKE '%logistica%' THEN 'BODEGA'
        ELSE 'EMPLEADO'
    END AS rol,
    
    'script_generator' AS creado_por
FROM empleados e
WHERE NOT EXISTS (
    SELECT 1
    FROM usuarios_sistema u
    WHERE u.id_empleado = e.id_empleado
);

-------------------------DESPACHO SUCURSALES------------------------
--------------------------------------------------------------------
TRUNCATE TABLE despachos_sucursales RESTART IDENTITY CASCADE;

INSERT INTO despachos_sucursales (
    id_sucursal_origen,
    id_sucursal_destino,
    fecha_despacho,
    documento_remision,
    estado,
    creado_por
)
WITH 
  -- Guardamos las sucursales en un array para seleccionarlas rápidamente
  arr_sucursales AS (SELECT ARRAY_AGG(id_sucursal) AS ids FROM sucursales),
  
  -- Generamos combinaciones aleatorias de origen y destino
  despachos_base AS (
    SELECT 
        gs AS num,
        -- El 60% de los despachos salen de la Bodega Principal (ID 1), el otro 40% entre sucursales
        CASE 
            WHEN random() < 0.60 THEN 1 
            ELSE s.ids[1 + floor(random() * array_length(s.ids, 1))::INT]
        END AS origen,
        
        s.ids[1 + floor(random() * array_length(s.ids, 1))::INT] AS destino
    FROM generate_series(1, 200) gs -- Cambia 200 por la cantidad de despachos que desees
    CROSS JOIN arr_sucursales s
  )
SELECT 
    -- Si el origen termina siendo igual al destino, forzamos la sucursal 2 para no romper el CHECK
    db.origen AS id_sucursal_origen,
    CASE 
        WHEN db.origen = db.destino THEN 
            CASE WHEN db.origen = 1 THEN 2 ELSE 1 END
        ELSE db.destino
    END AS id_sucursal_destino,
    
    -- Fecha aleatoria dentro de los últimos 90 días
    CURRENT_TIMESTAMP - (random() * 90 || ' days')::INTERVAL AS fecha_despacho,
    
    -- Documento de remisión único con formato REM-00000001
    CONCAT('REM-', LPAD(db.num::TEXT, 8, '0')) AS documento_remision,
    
    -- Estados distribuidos de forma realista
    CASE 
        WHEN random() < 0.70 THEN 'Entregado'
        WHEN random() < 0.85 THEN 'En Transito'
        WHEN random() < 0.95 THEN 'Borrador'
        ELSE 'Anulado'
    END AS estado,
    
    'script_generator' AS creado_por
FROM despachos_base db;

---------------------------DETALLES DESPACHOS-----------------------
--------------------------------------------------------------------
INSERT INTO detalles_despachos (
    id_despacho_sucursal,
    id_producto,
    cantidad_enviada,
    cantidad_recibida,
    creado_por
)
WITH despachos_productos AS (
    SELECT 
        d.id_despacho_sucursal,
        d.estado,
        p.id_producto,
        -- Generamos una sola vez la cantidad enviada para esta fila
        ROUND((5 + random() * 45)::numeric, 3) AS env,
        ROW_NUMBER() OVER (PARTITION BY d.id_despacho_sucursal ORDER BY random()) AS rn,
        (3 + floor(random() * 6))::INT AS max_prods
    FROM despachos_sucursales d
    CROSS JOIN productos p
)
SELECT 
    dp.id_despacho_sucursal,
    dp.id_producto,
    
    -- Usamos el valor fijo generado en la CTE
    dp.env AS cantidad_enviada,
    
    -- Calculamos la cantidad recibida como porcentaje de la enviada
    CASE 
        WHEN dp.estado = 'Entregado' THEN 
            CASE 
                -- 85% de los casos recibe el 100% perfecto
                WHEN random() < 0.85 THEN dp.env
                -- 15% de los casos recibe entre el 80% y 98% (imposible que sea mayor que 'env')
                ELSE ROUND((dp.env * (0.80 + random() * 0.18))::numeric, 3)
            END
        -- Si no está entregado, la recepción es NULL
        ELSE NULL 
    END AS cantidad_recibida,
    
    'script_generator' AS creado_por
FROM despachos_productos dp
WHERE dp.rn <= dp.max_prods;

---------------------AUDITORIA SISTEMA---------------------
-----------------------------------------------------------

TRUNCATE TABLE auditoria_sistema RESTART IDENTITY;

INSERT INTO auditoria_sistema (
    id_usuario_sistema,
    accion_realizada,
    tabla_afectada,
    registro_id,
    valores_anteriores,
    valores_nuevos,
    fecha_hora
)
WITH usuarios_validos AS (
    -- Obtenemos los usuarios elegibles para realizar auditorías
    SELECT id_usuario_sistema, 
           ROW_NUMBER() OVER (ORDER BY random()) as rn
    FROM usuarios_sistema
    WHERE rol IN ('ADMIN', 'EMPLEADO', 'CAJERO', 'BODEGA')
),
eventos AS (
    SELECT 
        ROW_NUMBER() OVER () as id_evento,
        accion,
        tabla,
        registro_id,
        valor_anterior,
        valor_nuevo,
        fecha
    FROM (
        VALUES
        ('INSERT', 'clientes', 1::BIGINT, NULL::JSONB, '{"nombre_completo":"Juan Gomez","correo_electronico":"juan.gomez@gmail.com"}'::JSONB, CURRENT_TIMESTAMP - INTERVAL '120 days'),
        ('INSERT', 'productos', 1::BIGINT, NULL::JSONB, '{"nombre":"Leche Entera 1L","precio_venta_actual":1.25}'::JSONB, CURRENT_TIMESTAMP - INTERVAL '110 days'),
        ('UPDATE', 'inventarios', 25::BIGINT, '{"stock_actual":50}'::JSONB, '{"stock_actual":120}'::JSONB, CURRENT_TIMESTAMP - INTERVAL '90 days'),
        ('INSERT', 'facturas', 100::BIGINT, NULL::JSONB, '{"numero_factura":"FAC-00000100","total_pagar":45.80}'::JSONB, CURRENT_TIMESTAMP - INTERVAL '60 days'),
        ('INSERT', 'compras', 50::BIGINT, NULL::JSONB, '{"numero_factura_proveedor":"FAC-2026-0000050","total_pagado":2500}'::JSONB, CURRENT_TIMESTAMP - INTERVAL '45 days'),
        ('UPDATE', 'clientes', 200::BIGINT, '{"telefono":"+593980000000"}'::JSONB, '{"telefono":"+593999999999"}'::JSONB, CURRENT_TIMESTAMP - INTERVAL '20 days'),
        ('INSERT', 'tarjetas_fidelizacion', 150::BIGINT, NULL::JSONB, '{"codigo_tarjeta":"DM360-00000150","puntos_acumulados":300}'::JSONB, CURRENT_TIMESTAMP - INTERVAL '10 days')
    ) AS x(accion, tabla, registro_id, valor_anterior, valor_nuevo, fecha)
)
SELECT 
    -- Selecciona un usuario aleatorio para cada evento
    (SELECT id_usuario_sistema FROM usuarios_validos ORDER BY random() LIMIT 1) AS id_usuario_sistema,
    e.accion,
    e.tabla,
    e.registro_id,
    e.valor_anterior,
    e.valor_nuevo,
    e.fecha
FROM eventos e;


--------------------------------------------------------------
----------CONSULTA PARA VER CUANTOS REGISTROS TIENE CADA TABLA

SELECT 
    schemaname AS esquema,
    relname AS tabla,
    n_live_tup AS cantidad_registros
FROM pg_stat_user_tables
ORDER BY relname;


-- Estructura interna de las tablas
SELECT 
    t.table_name AS tabla,
    string_agg(c.column_name, ', ' ORDER BY c.ordinal_position) AS columnas
FROM information_schema.tables t
JOIN information_schema.columns c ON t.table_name = c.table_name
WHERE t.table_schema = 'public' 
  AND t.table_type = 'BASE TABLE'
GROUP BY t.table_name
ORDER BY t.table_name;



--- select universal

-- Catálogos principales
SELECT * FROM categorias;
SELECT * FROM proveedores;
SELECT * FROM sucursales;
SELECT * FROM metodos_pago;
SELECT * FROM clientes;
SELECT * FROM empleados;

-- Productos e Inventario
SELECT * FROM productos;
SELECT * FROM inventarios;

-- Promociones y Fidelización
SELECT * FROM promociones;
SELECT * FROM productos_promociones;
SELECT * FROM tarjetas_fidelizacion;

-- Compras
SELECT * FROM compras;
SELECT * FROM detalles_compras;

-- Despachos
SELECT * FROM despachos_sucursales;
SELECT * FROM detalles_despachos;

-- Facturación / Ventas
SELECT * FROM facturas;
SELECT * FROM detalles_facturas;

-- Auditoría y Usuarios
SELECT * FROM auditoria_sistema;
SELECT * FROM usuarios_sistema;


