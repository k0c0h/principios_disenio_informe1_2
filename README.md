# AquaControl

Aplicación Flutter didáctica para simular el cálculo de una planilla de agua potable.

## Funcionalidades

- Inicio de sesión con validación de usuario y contraseña.
- Registro de cuenta, cliente, lecturas y tipo de consumidor.
- Cálculo de consumo, tarifa por rango, cargo fijo, recargo y total.
- Detalle del resultado y navegación mediante rutas nombradas.
- Credenciales de prueba: usuario `admin` y contraseña `1234`.

## Estructura

- `model/`: modelo de datos del cálculo.
- `controller/`: lógica de cálculo de la planilla.
- `view/pantallas/`: pantallas de inicio, formulario y resultado.
- `view/atomos/`, `view/moleculas/` y `view/organismos/`: componentes de Atomic Design.

La aplicación implementa MVC: el modelo representa el cálculo, el controlador
contiene la lógica y las pantallas construyen la vista. También aplica Atomic
Design mediante átomos, moléculas y organismos, además de un tema propio basado
en tonos azul agua.
