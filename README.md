# Proyecto de Pruebas de Performance con JMeter

## Requisitos

- Java 8 o superior
- [Apache JMeter](https://jmeter.apache.org/download_jmeter.cgi)
- Python 3.x

## Instalación de JMeter

1. Descarga JMeter desde el [sitio oficial](https://jmeter.apache.org/download_jmeter.cgi).
2. Descomprime el archivo ZIP.
3. Ejecuta `jmeter.bat` (Windows) o `jmeter` (Linux/Mac) desde la carpeta `bin`.

## Estructura del Proyecto

- **Parte1.md**: Análisis y recomendaciones de pruebas de performance.
- **Parte12**
     - ***test_plan.jmx***: Script de JMeter para pruebas de carga.
     - ***ejecucion_grupal.bat***: Batch unificado para ejecutar el escenario deseado y generar reportes técnicos.  
       **Este ejecuta scripts de la carpeta `generacion_reporte` y genera el reporte técnico en la carpeta `evidencias`.**
     - ***Informe_Ejecutivo_Performance.pptx***: Reporte de resultados para personas no técnicas.

### Ejecución de las Pruebas

1. Abre una terminal en la carpeta raíz del proyecto.
2. Ejecuta el batch indicando el escenario (50 o 100 TPS):  
   ```sh
   ejecucion_grupal.bat
   ```
3. El batch actualizará el JMX, ejecutará JMeter y generará los reportes en la carpeta correspondiente.
4. Los resultados HTML estarán en:
   - `evidencias\reportes\50\reportes_50\index.html` (para 50 TPS)
   - `evidencias\reportes\100\reportes_100\index.html` (para 100 TPS)

### Reporte de Pruebas

- Abrir: `Informe_Ejecutivo_Performance.pptx`

### Notas

- El script Python (`generacion_reporte/add_50.py` y `generacion_reporte/add_100.py`) modifica las variables del JMX para activar el escenario correcto:  
  - Variables: `RUN_add_100` y `RUN_add_50`
- Se adjunta evidencia de la última ejecución realizada, guardada como  
  `"evidencias-13062025\reportes\...\index.html"`

### Recursos

- [Documentación oficial de JMeter](https://jmeter.apache.org/usermanual/index.html) 
