# Desafío App Flutter

Desafio de codigo hecho donde se consulta y muestra datos de la serie de television Rick and Morty.

El usuario puede cargar personajes y episodios (20 a la vez) en dos vistas distintas. Tambien hay vista de personaje, que le permite al usuario buscar un personaje por su nombre.

## Arquitectura

Se separo la UI de la data (/data y /ui). En /ui en las features que corresponden se agrego un viewmodel para agregar logica de negocio. Se implementaron dos instancias bloc (charactes y episodes). En cada feature estan las carpetas /widgets, /view_model y el archivo screen.dart. Hay una carpeta /widgets donde hay widgets globales. 
En /data los servicios consultan la data de la api, los repositorios llaman a los servicios y devuelven la data a la ui.

