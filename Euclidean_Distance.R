setwd('C:/Users/carlo/Desktop/Data science/ASDM/KNN')
occupancy_data<-read.table("datatraining.txt", sep = ",")


#explore the dataset
names(occupancy_data)
head(occupancy_data)
tail(occupancy_data)
summary(occupancy_data)
str(occupancy_data

#Check the dimension and number of points in the "occupancy_data" dataset
nrow(occupancy_data)
ncol(occupancy_data)
dim(occupancy_data)

#Create a new dataset only with following attributes Temperature", "Humidity", "Light", "CO2"," Occupancy";
occupancy_data_f <-occupancy_data[,c(2,3,4,5,7)]
occupancy_data_f

# create a new column named "euclidean_distance" and fill with "NA"

occupancy_data_f$euclidean_distance <-NA
occupancy_data_f

# Create new variables to hold predefined Temperature, Humidity, Light and CO2 values


tem<-24.15
hum<-27.2675
lit<-429.5
co2<-715.00

# Calculate the Euclidean distances from a query point to each of the points in the dataset

length <-nrow(occupancy_data_f)

for(i in 1:length)
{
  
  occupancy_data_f$euclidean_distance[i] =  sqrt((occupancy_data_f$Temperature[i]-tem)^2+(occupancy_data_f$Humidity[i]-hum)^2 +(occupancy_data_f$Light[i]-lit)^2+(occupancy_data_f$CO2[i]-co2)^2)
  print(occupancy_data_f$euclidean_distance[i])
  }

# Sort the "euclidean_distance" column in ascending order

occupancy_data_f<-occupancy_data_f[order(occupancy_data_f$euclidean_distance),]

occupancy_data_f

# Show the k nearest neighbours, here weuse k=5

k <-5 
occupancy_data_f[1:k,]

# Determine the class label for the query data point

Class1 <-sum(occupancy_data_f$Occupancy[1:k])==1
             {   
               if(Class1 > k/2){
                 print("The query point belongs to class 1")
               } 
               else{
                 print("The query point belongs to class 0")
               }
             }

