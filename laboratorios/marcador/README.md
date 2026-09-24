# Laboratorio Marcador Deportivo

## Capturas de Pantalla

### Empate

[Empate](../marcador/capturas/empate.png)

### Equipo Ganando
[Equipo Ganando](../marcador/capturas/win.png)

## Preguntas

**¿Qué hace setState cuando presiona un botón?**
Al presionar un botón, setState le notifica al framework de Flutter que el estado interno del StatefulWidget ha cambiado (en este caso, los puntos de un equipo han aumentado o disminuido). Esto provoca que el framework vuelva a llamar al método build del widget, reconstruyendo la interfaz de usuario para reflejar el nuevo valor de los puntos, el mensaje actualizado y los colores correspondientes.

**¿Qué ocurriría si cambia los puntos sin llamarlo?**
Si cambiamos los valores de las variables de los puntos (por ejemplo, _puntosXela++) sin envolverlo en setState, el valor de la variable en memoria sí se actualizará, pero el framework de Flutter no se enterará de que hubo un cambio. Por lo tanto, no volverá a renderizar la pantalla y la interfaz gráfica seguirá mostrando el puntaje antiguo, sin reflejar ninguna modificación.
