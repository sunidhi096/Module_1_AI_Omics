setwd("E:/AI_Omics_Internship_2025/Module_1")
dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")  
patient_data <- read.csv("raw_data/patient_info.csv")
str(patient_data)  
patient_data$gender <- as.factor(patient_data$gender)
patient_data$diagnosis <- as.factor(patient_data$diagnosis)
patient_data$smoker <- as.factor(patient_data$smoker)
str(patient_data) 
patient_data$smoker_binary <- ifelse(patient_data$smoker == "Yes", 1, 0)
write.csv(patient_data, "clean_data/patient_info_clean.csv")




