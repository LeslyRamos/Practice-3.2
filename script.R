#Create the data frame by inserting each column
plants<-c('plant 1', 'plant 2', 'plant 3', 'plant 4', 'plant 5')
start_height<-c(4.0, 5.0, 3.0, 6.0, 7.0)
end_height<-c(9.0, 6.0, 5.0, 4.0, 7.0)

#create the table
experiment<-data.frame(plant = plants, start_experiment = start_height, end_experiment = end_height)
print(experiment)

#Reformat the data frame
#Make the time just one column by using pivot_longer
experiment_ref <- experiment %>%
  +         pivot_longer(cols = starts_with("start_experiment"):starts_with("end_experiment"), names_to = "time", values_to = "height")

experiment_ref


#Change the time measurement column in a factor of 2 levels
experiment_ref$time<-factor(experiment_ref$time, levels = c("start_experiment", "end_experiment"))

print(experiment_ref)

#create a list. The first element will be the experiment_long data frame. 
#The second element is a list called growth with three parts

#1) calculate percentage growth
growth_percentage<-(experiment$end_experiment - experiment$start_experiment) / experiment$start_experiment * 100

#2) create the "growth" list
growth<-list(rownames = rownames(experiment), percentage_change = growth_percentage, summary.table = data.frame(plant = plants, growth = growth_percentage))

print(growth)

#A message about the growth status of these plants
growth_message<-"Three out of five plants show positive growth changes"

#Generate a final list
my_experiment<-list(experiment = experiment_ref, growth = growth, message = growth_message)

print(my_experiment)






