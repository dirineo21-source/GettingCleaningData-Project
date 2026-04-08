# run_analysis.R
# Getting and Cleaning Data - Course Project
# UCI HAR Dataset: Human Activity Recognition Using Smartphones

library(dplyr)

# ─────────────────────────────────────────
# 0. Descargar y descomprimir los datos
# ─────────────────────────────────────────
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "UCI_HAR_Dataset.zip"

if (!file.exists(zipfile)) {
  download.file(url, destfile = zipfile, method = "auto")
}
if (!dir.exists("UCI HAR Dataset")) {
  unzip(zipfile)
}

# ─────────────────────────────────────────
# 1. Unir training y test en un solo dataset
# ─────────────────────────────────────────

# Leer features y actividades
features      <- read.table("UCI HAR Dataset/features.txt", col.names = c("id", "feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity"))

# Training
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Test
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# Combinar
X_all       <- rbind(X_train, X_test)
y_all       <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

full_data <- cbind(subject_all, y_all, X_all)

# ─────────────────────────────────────────
# 2. Extraer solo media y desviación estándar
# ─────────────────────────────────────────
tidy_data <- full_data %>%
  select(subject, activity_id, matches("mean\\.\\.|std\\.\\.", ignore.case = FALSE))

# ─────────────────────────────────────────
# 3. Nombres descriptivos de actividades
# ─────────────────────────────────────────
tidy_data <- tidy_data %>%
  left_join(activity_labels, by = c("activity_id" = "id")) %>%
  select(-activity_id) %>%
  relocate(activity, .after = subject)

# ─────────────────────────────────────────
# 4. Etiquetas descriptivas para variables
# ─────────────────────────────────────────
names(tidy_data) <- names(tidy_data) %>%
  gsub("^t",        "Time",         .) %>%
  gsub("^f",        "Frequency",    .) %>%
  gsub("Acc",       "Accelerometer",.) %>%
  gsub("Gyro",      "Gyroscope",    .) %>%
  gsub("Mag",       "Magnitude",    .) %>%
  gsub("BodyBody",  "Body",         .) %>%
  gsub("\\.mean\\.\\.", "Mean",     .) %>%
  gsub("\\.std\\.\\.",  "STD",      .) %>%
  gsub("\\.",       "",             .)

# ─────────────────────────────────────────
# 5. Dataset tidy con promedio por actividad y sujeto
# ─────────────────────────────────────────
summary_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

write.table(summary_data, "tidy_data.txt", row.names = FALSE, quote = FALSE)

message("✓ Archivo 'tidy_data.txt' generado correctamente.")