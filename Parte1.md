# Parte 1: Análisis y Recomendaciones de Pruebas de Performance

**Escenario:**
Un e-commerce con 1500 ventas diarias, que se quintuplican en fechas especiales (Black Friday, Navidad, etc.).

## Pruebas de performance para el caso:

1. **Pruebas de carga (Load Testing):**
    Simular el tráfico normal y el tráfico en picos (hasta 7500 ventas/día).
    Objetivo: Verificar que el sistema soporta la carga esperada sin degradar el servicio,se debe mantener tiempos de respuesta aceptables (< 1 seg) y sin errores.
	Usuarios simulados:
		- Tráfico normal: 1500 ventas/día ≈ 1 venta/minuto ≈ 0.017 TPS
		- Pico esperado: 7500 ventas/día ≈ 5 ventas/minuto ≈ 0.083 TPS
	Duración: 1 hora (o el tiempo que represente un ciclo típico de ventas).


2. **Pruebas de estrés (Stress Testing):**
	Incrementar la carga hasta encontrar el punto de quiebre del sistema.
	Objetivo: Identificar el máximo de transacciones por segundo (TPS) que soporta antes de fallar
    Usuarios simulados:
		- Incrementa progresivamente los TPS: 10, 50, 100, 200, 500, etc., hasta que el sistema falle o degrade notablemente.
    Duración: 5-10 minutos por nivel de carga.
	

3. **Pruebas de picos (Spike Testing):**
   Simular incrementos bruscos de tráfico en poco tiempo.
   Objetivo: Evaluar la respuesta ante aumentos repentinos de usuarios.
   Usuarios simulados:
		- Carga base baja (ejemplo: 10 TPS), luego súbelo abruptamente a 100 o 200 TPS por 1-2 minutos, y vuelve a la base.
   Duración: 10-15 minutos (con varios picos).


4. **Pruebas de estabilidad (Soak Testing):**
   Mantener una carga alta durante varias horas.
   Usuarios simulados:
		- Carga constante (ejemplo: 10-20 TPS, o el valor de pico esperado).
   Duración: 4-8 horas (o más, si es posible).
   Objetivo: Detectar problemas de memoria, fugas de recursos o degradación a largo plazo.


5. **Pruebas de concurrencia:**
   Simular múltiples usuarios realizando compras simultáneamente.
   Usuarios simulados:
		- 50, 100, 200 usuarios concurrentes realizando compras al mismo tiempo.
   Duración: 10-30 minutos.
   Objetivo: Verificar la correcta gestión de sesiones y recursos compartidos.

---

Estas pruebas permiten asegurar que el sistema es robusto, escalable y confiable tanto en condiciones normales como en situaciones de alta demanda. 
