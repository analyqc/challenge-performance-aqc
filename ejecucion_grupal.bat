@echo off

rem Configuración de memoria para JMeter
set HEAP=-Xms2048m -Xmx4096m
set NEW=-XX:NewSize=1024m -XX:MaxNewSize=1024m
set SURVIVOR=-XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=50%%
set TENURING=-XX:MaxTenuringThreshold=2
set RMIGC=-Dsun.rmi.dgc.client.gcInterval=600000 -Dsun.rmi.dgc.server.gcInterval=600000
set PERM=-XX:PermSize=512m -XX:MaxPermSize=1024m
set GC=-XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:+UseStringDeduplication

set JAVA_OPTS=%HEAP% %NEW% %SURVIVOR% %TENURING% %RMIGC% %PERM% %GC%

rem Verificar si Python está instalado (múltiples métodos)
where python >nul 2>&1
if errorlevel 1 (
    where py >nul 2>&1
    if errorlevel 1 (
        echo Verificando instalación de Python...
        if exist "C:\Python*" (
            set PYTHON_PATH=C:\Python*\python.exe
            echo Python encontrado en: %PYTHON_PATH%
        ) else if exist "C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python*" (
            set PYTHON_PATH=C:\Users\%USERNAME%\AppData\Local\Programs\Python\Python*\python.exe
            echo Python encontrado en: %PYTHON_PATH%
        ) else (
            echo Python no está en el PATH. Por favor, asegúrate de que Python esté instalado y agregado al PATH del sistema.
            echo Puedes instalarlo desde: https://www.python.org/downloads/
            pause
            exit /b 1
        )
    ) else (
        set PYTHON_PATH=py
    )
) else (
    set PYTHON_PATH=python
)

rem Limpiar archivos temporales
if exist "temp" rmdir /s /q "temp"
mkdir "temp"

rem Ejecutar escenario 100 TPS
echo Ejecutando add_100.bat...
call generacion_reporte\add_100.bat

rem Ejecutar escenario 50 TPS
echo Ejecutando add_50.bat...
call generacion_reporte\add_50.bat

rem Limpiar archivos temporales
if exist "temp" rmdir /s /q "temp"

echo Todos los procesos se completaron.
pause
