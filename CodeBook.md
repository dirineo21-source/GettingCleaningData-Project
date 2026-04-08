# CodeBook — UCI HAR Tidy Dataset

## Origen de los datos
- **Experimento:** Human Activity Recognition Using Smartphones
- **Fuente original:** UCI Machine Learning Repository
- **Sujetos:** 30 voluntarios (18–48 años)
- **Actividades:** 6 actividades físicas registradas con Samsung Galaxy S II

## Transformaciones aplicadas
1. Se unieron los conjuntos `train` y `test`.
2. Se conservaron solo variables de **media** y **desviación estándar**: 66 variables.
3. Los IDs de actividad se reemplazaron por nombres descriptivos.
4. Los nombres de variables se expandieron: `t`→`Time`, `f`→`Frequency`, `Acc`→`Accelerometer`, `Gyro`→`Gyroscope`, `Mag`→`Magnitude`, `mean()`→`Mean`, `std()`→`STD`.
5. Se calculó el **promedio** de cada variable por sujeto y actividad.

## Variables de identificación
| Variable | Tipo | Descripción |
|---|---|---|
| `subject` | Entero (1–30) | ID del voluntario |
| `activity` | Factor | Actividad realizada |

## Actividades
| Valor | Descripción |
|---|---|
| WALKING | Caminando en plano |
| WALKING_UPSTAIRS | Subiendo escaleras |
| WALKING_DOWNSTAIRS | Bajando escaleras |
| SITTING | Sentado |
| STANDING | De pie |
| LAYING | Acostado |

## Variables de señal (66 variables)
Numéricas, normalizadas en [-1, 1]. Patrón: `{Dominio}{Componente}{Sensor}{Medida}{Eje}`

## Archivo de salida
**`tidy_data.txt`** — 180 filas × 68 columnas.