# Getting and Cleaning Data — Course Project

## Descripción

Este repositorio contiene el proyecto final del curso **Getting and Cleaning Data** (Coursera / Johns Hopkins). El objetivo es demostrar la capacidad de recolectar, transformar y limpiar un conjunto de datos para análisis posterior.

## Datos

Los datos provienen del experimento **UCI HAR Dataset** (Human Activity Recognition Using Smartphones), que registra señales del acelerómetro y giroscopio de un Samsung Galaxy S mientras 30 voluntarios realizaban 6 actividades físicas.

- **Fuente:** [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Archivos del repositorio

| Archivo | Descripción |
|---|---|
| `run_analysis.R` | Script principal de limpieza y transformación |
| `tidy_data.txt` | Dataset tidy final generado por el script |
| `CodeBook.md` | Descripción de variables, transformaciones y unidades |
| `README.md` | Este archivo |

## Cómo ejecutar el script

1. Abre RStudio y establece el directorio de trabajo.
2. Ejecuta:

```r
source("run_analysis.R")
```

El script descargará los datos automáticamente si no existen.

## Pasos del análisis

1. Descarga y descompresión del dataset.
2. Unión de los conjuntos train y test.
3. Extracción de variables de media y desviación estándar.
4. Nombres descriptivos para actividades y variables.
5. Dataset resumen con promedio por sujeto y actividad, guardado en `tidy_data.txt`.

## Dependencias

- R >= 3.5
- Paquete `dplyr`
