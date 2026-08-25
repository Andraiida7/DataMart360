# DataMart 360

Sistema de Gestión y Análisis de Datos para una Cadena de Supermercados

Proyecto integral de **bases de datos, Data Analytics y Business Intelligence**, desarrollado desde cero para una empresa ficticia del sector retail.

DataMart 360 integra el diseño e implementación de una base de datos relacional en **PostgreSQL**, el procesamiento y análisis de información con **Excel** y la construcción de un dashboard interactivo en **Power BI**.

El proyecto fue desarrollado individualmente con fines académicos y de demostración profesional. Todos los datos utilizados son simulados.

-- Descripción

DataMart 360 representa una cadena ficticia de supermercados y reúne información de diferentes áreas del negocio, como ventas, clientes, productos, inventario, compras, proveedores y sucursales.

La solución permite transformar datos operativos en información útil para analizar el comportamiento comercial y apoyar la interpretación de indicadores mediante consultas SQL, modelos de datos, métricas y visualizaciones interactivas.

El proyecto abarca todo el proceso, desde el **diseño de la base de datos hasta la construcción de los dashboards**.

-- Objetivo

Diseñar e implementar una solución de datos que permita organizar, consultar y analizar información de una cadena de supermercados, generando indicadores útiles para evaluar aspectos como:

- Ventas y facturación
- Clientes
- Productos y categorías
- Inventario
- Compras y proveedores
- Sucursales
- Operaciones comerciales

El proyecto busca aplicar de forma práctica conocimientos de **bases de datos, SQL, análisis de datos y Business Intelligence** en un escenario empresarial.

-- Contexto del negocio

DataMart 360 representa una cadena ficticia de supermercados ubicada en Ecuador.

Para simular el funcionamiento del negocio se generó un conjunto de datos que representa diferentes procesos comerciales y operativos durante el período **2024–2026**.

### Datos principales

| Elemento | Cantidad |
|---|---:|
| Clientes | 500 |
| Productos | 368 |
| Categorías | 16 |
| Sucursales y bodega | 13 |
| Proveedores | 49 |
| Facturas | 15.000 |
| Detalles de factura | 44.973 |
| Despachos entre sucursales | 200 |

> **Nota:** Los datos utilizados son simulados y fueron creados exclusivamente para fines académicos, de aprendizaje y demostración profesional.

-- Flujo de trabajo

```text
Datos del negocio
       │
       ▼
PostgreSQL
Base de datos relacional
       │
       ▼
SQL
Consultas y procesamiento
       │
       ▼
Power Query
Transformación y limpieza
       │
       ├─────────────────┐
       ▼                 ▼
    Excel             Power BI
 Análisis y          DAX + Modelo
 dashboards           analítico
       │                 │
       └────────┬────────┘
                ▼
        KPIs y visualizaciones


Tecnologías utilizadas
Bases de datos
PostgreSQL
pgAdmin
SQL
Modelo entidad-relación
Modelo relacional
Normalización
Análisis y transformación
Microsoft Excel
Power Query
Power Pivot
Tablas dinámicas
Business Intelligence
Microsoft Power BI
DAX
KPIs
Segmentadores
Visualizaciones interactivas
Diseño y documentación
Draw.io
Documentación técnica
🗄️ Base de datos

La base de datos fue implementada en PostgreSQL y está compuesta por 19 tablas relacionadas que representan diferentes entidades y procesos del negocio.

Entre las áreas modeladas se encuentran clientes, productos, ventas, inventarios, compras, proveedores, sucursales, empleados, despachos, promociones y fidelización.

Durante la implementación se trabajó con:

Claves primarias y foráneas
Restricciones
Relaciones entre tablas
Normalización
Consultas SQL
JOIN
Subconsultas
Vistas
Funciones
Procedimientos almacenados
Triggers
Índices

Los scripts de creación, inserción de datos y consultas se encuentran en:

baseDatos/
📊 Análisis con Excel

Excel se utilizó para realizar procesos de transformación, modelado y análisis de los datos.

El trabajo incluyó:

Importación y transformación mediante Power Query
Limpieza de datos
Construcción del modelo de datos
Relaciones entre tablas
Power Pivot
Tablas dinámicas
Gráficos dinámicos
Segmentadores
Indicadores
Dashboard interactivo

Archivo principal:

excel/DataMart360_Dashboard_2.xlsx
📈 Dashboard en Power BI

Power BI constituye la etapa final de análisis y visualización del proyecto.

El dashboard está compuesto por 7 páginas:

Resumen Ejecutivo — principales KPIs y visión general del negocio.
Análisis de Ventas — evolución y distribución de las ventas.
Clientes y Fidelización — comportamiento y actividad de los clientes.
Productos y Categorías — desempeño de productos y categorías.
Inventario y Stock — niveles de inventario y productos que requieren atención.
Compras y Proveedores — comportamiento de compras y proveedores.
Operaciones y Sucursales — análisis de sucursales y operaciones de distribución.

El modelo utiliza medidas DAX para calcular indicadores como:

Ventas Totales
Número de Facturas
Clientes Activos
Productos Vendidos
Ticket Promedio
Utilidad Estimada
Margen Promedio
Productos en Stock Crítico
Sucursales Activas
Crecimiento de ventas

Archivo principal:

powerbi/DataMart360_powerBi.pbix
📌 Principales indicadores

Algunos de los indicadores obtenidos a partir del conjunto de datos simulado son:

Indicador	Resultado
Ventas totales	$791.873,65
Ticket promedio	$52,79
Clientes activos	500
Número de facturas	15.000
Productos vendidos	~157,36 mil

Estos resultados corresponden exclusivamente a los datos simulados utilizados en el proyecto.

📁 Estructura del proyecto
DataMart360/
│
├── README.md
│
├── baseDatos/
│   ├── datamart360.sql
│   ├── insercionDatos.sql
│   └── consultas.sql
│
├── diagramas/
│   ├── diagramaConceptual.png
│   ├── modeloLogico.png
│   └── modeloRelacional.png
│
├── excel/
│   └── DataMart360_Dashboard_2.xlsx
│
├── powerbi/
│   ├── DataMart360_powerBi.pbix
│   └── DataMart360_Tema.json
│
├── documentacion/
│   └── DataMart360_Documentacion.pdf
│
└── imagenes/
    ├── dashboard-excel.png
    ├── dashboard-powerbi.png
    └── ...
📚 Documentación

La documentación completa del proyecto contiene el desarrollo de las diferentes etapas, incluyendo:

Análisis del negocio
Diseño de la base de datos
Implementación en PostgreSQL
Consultas SQL
Transformación de datos
Modelo de datos
Análisis con Excel
Desarrollo del dashboard en Power BI
Medidas DAX
Resultados y conclusiones

La documentación completa se encuentra en:

documentacion/
🚀 Resultados del proyecto

DataMart 360 permitió construir una solución completa de trabajo con datos, integrando bases de datos, SQL, transformación, análisis y visualización en un mismo proyecto.

El desarrollo permitió aplicar conocimientos prácticos de:

Diseño y modelado de bases de datos
PostgreSQL y SQL
Transformación y limpieza de datos
Modelado de datos
Excel y Power Query
DAX
Power BI
Diseño de KPIs
Análisis comercial y operativo
Visualización de información

El resultado es una solución que permite explorar diferentes áreas del negocio y convertir información operativa en indicadores y visualizaciones para su análisis.

👩‍💻 Autora
Andraida de la Cruz Corniel

Tecnóloga Superior en Desarrollo de Software

✍️Orientación profesional:
Bases de datos · SQL · PostgreSQL · Data Analytics · Business Intelligence
Proyecto desarrollado individualmente con fines académicos y de demostración profesional.

🤖 Uso de herramientas de IA

Durante el desarrollo se utilizaron herramientas de inteligencia artificial como apoyo para investigación, aprendizaje, resolución de dudas técnicas y exploración de alternativas.
La definición del proyecto, estructura, diseño, implementación, análisis y decisiones de la solución fueron realizados por la autora.

📄 Licencia

Este proyecto se presenta con fines educativos y de demostración profesional.
Los datos utilizados son simulados y no representan información real de una empresa.
