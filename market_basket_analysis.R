##################
# Project Summary
#################


# Perform a market basket analysis on Blackwell's provided 
# transaction data. To do this, we will use the Aprior algorithm to 
# discover association rules, and sort out the actionable rules 
# from the obvious and inexplicable ones.


###################
# Working directory
###################

setwd("C:\\Users\\Maja\\Documents\\Ubiqum\\Module 2\\R wd")

###############
# Load packages
###############

library(arules) #package for analyzing transactional data. 
library(arulesViz) #package that provides visual techniques for the arules package

#######
#DEFINE
#######

Laptop <- c("Laptop", "Aspire", "Chromebook", "MacBook", "Macbook")


#############
# Import data
#############

# Load transaction data into a sparse matrix. Columns are items, rows are 
# transactions. Columns are sorted alphabetically.

transactions <- read.transactions("ElectronidexTransactions2017.csv", 
                                  format = "basket", 
                                  sep = ",", 
                                  rm.duplicates = TRUE)
 
# remove 0 value transactions (2)

summary(transactions)
summary(itemFrequency(transactions))
transactions <- transactions[which(size(transactions)!=0)]

################
#Looking at data
################

inspect (transactions) # You can view the transactions. 
length (transactions) # Number of transactions.
size (transactions) # Number of items per transaction
LIST(transactions) # Lists the transactions by conversion (LIST must be capitalized)
itemLabels(transactions)# To see the item labels
itemFrequency(transactions) # Frequency by item


# top ten most-purchased items
itemFrequencyPlot(transactions, type = "relative", topN = 15)
itemFrequencyPlot(transactions, type = "absolute", topN = 15)
plot(itemFrequency(transactions))

#number of transactions by item 

head(itemFrequency(transactions))
transactionsByNo <- as.data.frame(itemFrequency(transactions) * 
                                  nrow(transactions))

# items with relative frequency in transactions
itemFrequencyPlot(transactions, support = 0.1)

image(transactions[150:300]) #displays the sparse matrix
image(sample(transactions, 150)) #displays the sparse matrix with random transactions


################################
# Association Rules with Apriori
################################

rules <- apriori(transactions, parameter = list(supp = 40/9833, 
                                                conf = 0.3, 
                                                minlen = 2))

is.redundant(rules) #displaying redundant rules
rules_clean <- rules[!is.redundant(rules)] #cleaning the dataset from redundant rules

summary(rules_clean)

#inspecting rules sorted by support, confidence and lift metrics 
#viewing only top results

inspect(sort(rules_clean, by = "support")[1:20])
inspect(sort(rules_clean, by = "confidence")[1:20])
inspect(sort(rules_clean, by = "lift")[1:20])


#ploting frequent items in the 

itemFrequencyPlot(rules_clean, support = 0.1)


#rules without two most frequent items

rules_noImac <- apriori(transactions, parameter = list(supp = 40/9833, conf = 0.3),
                        appearance = list(none = c("iMac", "HP Laptop", "CYBERPOWER Gamer Desktop")))
summary(rules_noImac)
inspect(head(rules_noImac, n = 10, by = "lift"))
inspect(head(rules_noImac, n = 10, by = "support"))


##inspect lhs and rhs for specific items

inspect(head(subset(rules_clean, (rhs %pin% c("ViewSonic")))), n=10, by ="lift")
inspect(head(subset(rules_clean, (rhs %pin% c("ViewSonic")))), n=10, by ="support")
plot(subset(rules_clean, (rhs %pin% c("ViewSonic"))), method="graph", control=list(type="items"))

inspect(sort(subset(rules_clean, items %pin% c("ViewSonic")), by ="lift")[1:10])
inspect(sort(subset(rules_clean, items %pin% c("ViewSonic")), by ="support")[1:10])

inspect(sort(subset(rules_clean, (lhs %pin% c("iMac"))), by ="lift")[1:10])
inspect(sort(subset(rules_clean, (lhs %pin% c("iMac"))), by ="support")[1:20])

inspect(subset(rules_clean, (rhs %pin% c("HP Laptop"))), n=10, by ="lift")
inspect(subset(rules_clean, (rhs %pin% c("HP Laptop"))), n=10, by ="support")
summary(inspect(subset(rules_clean, (rhs %pin% c("HP Laptop"))), n=10, by ="count"))

inspect(subset(rules_clean, (lhs %in% c("HP Laptop"))), n=10, by ="lift")
inspect(subset(rules_clean, (lhs %in% c("HP Laptop"))), n=10, by ="support")

#1 item transactions to see what is bought alone

transactions_1item <- transactions[which(size(transactions) == 1), ]
itemFrequencyPlot(transactions_1item, topN = 5)
my_crosstable <- crossTable(transactions_1item)
my_crosstable["Apple MacBook Air", "Apple MacBook Air"]

#Big and small customers divide by number of basket items (minlen)

BigCustomers <- apriori(transactions, parameter = list(supp = 0.01, 
                                                       conf = 0.3, 
                                                       minlen = 4))
summary(BigCustomers)
inspect(sort(BigCustomers, by = "support")[1:20])


SmallCustomers <- apriori(transactions, parameter = list(supp = 0.01, 
                                                         conf = 0.3,                                                          minlen = 1, 
                                                         maxlen = 3))
summary(SmallCustomers)
inspect(sort(SmallCustomers, by = "support")[1:20])


for(i in rules_clean) {
  
    if(items %pin% Laptop){
            
        LaptopRules2 <- subset(rules_clean, items %pin% Laptop)
    }
    
}   
    
    DesktopRules <- subset(rules_clean, items %in% "item name")
    
    MonitorRules <- subset(RulesName, items %in% "item name")
    
    MouseRules <- subset(rules_clean, items %pin% c("Mouse", "Button"))
    
    KeyboardRules <- subset(RulesName, items %in% "item name")
    
    MKComboRules <- subset(RulesName, items %in% "item name")
    
    DesktopRules <- subset(RulesName, items %in% "item name")
    
    ComputerHeadphonesRules <- subset(RulesName, items %in% "item name")
    
    HeadphonesRules <- subset()
    
    DesktopRules <- subset(RulesName, items %in% "item name")
    
    ExternalRules <- subset(rules_clean, items %pin% "Hard drive")  
    
#}

##########################
#Plotting and vizulisation 
##########################

#for grouped matrix interactive
plot(rules_clean, method="grouped", engine = "interactive")

plot(rules_clean)

plot(sort(subset(rules_clean, items %pin% c("ViewSonic")), by = "lift")[1:6], method="graph", 
          control=list(type="items"))
plot(sort(rules_clean, by = "support")[1:10], method="graph", 
    control=list(type="items"))

plot(sort(rules_noImac, by = "support")[1:5], method="graph", 
     control=list(type="items"))

plot(sort(rules_clean, by = "lift")[1:5], method="graph", 
     control=list(type="items"))
