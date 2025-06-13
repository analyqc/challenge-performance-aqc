@echo off

rem Crear directorios si no existen
if not exist "evidencias\resultados\50" mkdir "evidencias\resultados\50"
if not exist "evidencias\reportes\50" mkdir "evidencias\reportes\50"
if not exist "temp" mkdir "temp"

rem Rutas de archivos
set TEST_PLAN=test_plan.jmx
set RESULTADOS=evidencias\resultados\50\resultados_50.jtl
set REPORTES=evidencias\reportes\50\reportes_50
set LOG_FILE=temp\jmeter.log

rem Verificar si la carpeta de reportes existe, si existe, eliminarla y crearla de nuevo
if exist "%REPORTES%" (
    echo Eliminando carpeta %REPORTES%...
    rmdir /s /q "%REPORTES%"
)
echo Creando carpeta %REPORTES%...
mkdir "%REPORTES%"

rem Verificar si el archivo de resultados existe, si existe, eliminarlo
if exist "%RESULTADOS%" (
    echo Eliminando archivo %RESULTADOS%...
    del /f /q "%RESULTADOS%"
)

rem Ejecutar el script Python para activar el escenario de 50 TPS
py generacion_reporte/add_50.py

rem Configuración de JMeter para el reporte
set JMETER_ARGS=-Jjmeter.save.saveservice.output_format=csv ^
-Jjmeter.save.saveservice.response_data=true ^
-Jjmeter.save.saveservice.samplerData=true ^
-Jjmeter.save.saveservice.requestHeaders=true ^
-Jjmeter.save.saveservice.url=true ^
-Jjmeter.save.saveservice.responseHeaders=true ^
-Jjmeter.save.saveservice.thread_counts=true ^
-Jjmeter.save.saveservice.timestamp_format="yyyy/MM/dd HH:mm:ss.SSS" ^
-Jjmeter.save.saveservice.default_delimiter=, ^
-Jjmeter.save.saveservice.print_field_names=true

rem Ejecutar JMeter con la configuración optimizada
echo Ejecutando JMeter con configuración optimizada...
jmeter -n -t "%TEST_PLAN%" ^
-j "%LOG_FILE%" ^
-l "%RESULTADOS%" ^
-e -o "%REPORTES%" ^
%JMETER_ARGS%

rem Verificar si la ejecución fue exitosa
if errorlevel 1 (
    echo Error en la ejecución de JMeter. Revisa el archivo de log: %LOG_FILE%
    type "%LOG_FILE%"
    pause
    exit /b 1
)

rem Mensaje final
echo Los resultados HTML se encuentran en: %REPORTES%
pause 