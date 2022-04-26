# ------------------------- project description -------------------------
# Project developed in rstudio.cloud 
# Variable I worked with: Family: Fertility (number of children / woman) 
#                       / Γονιμότητα (αριθμός παιδιών / γυναίκα)
# There aren't any NA (Not Available) values in variable 'Family'

# ---------------------------- dependencies -----------------------------
# 'UsingR' and 'ggplot2' packages should be downloaded from "packages"

# install.packages("UsingR")
library('UsingR') # loads package to library
# install.packages("ggplot2")
library('ggplot2') 

# **************************
# Loading the required dataset 'wellbeing' 
data(wellbeing)
View(wellbeing)

# checking for NA values
is.na(wellbeing$Family) 

# **************************
# mean of variable 'Family' of every European country in the dataset
mean_fam = mean(wellbeing$Family)
mean_fam

# **************************
# European country with max value of the variable 'Family'
max(wellbeing$Family)
wellbeing[wellbeing$Family == max(wellbeing$Family),]$Country

# **************************
# ordering European countries in descending order of the variable 'Family'
wellbeing2 = wellbeing[order(-wellbeing$Family),]
View(wellbeing2)

# **************************
# showing the names of the first 3 European countries of the previous query
wellbeing2$Country[1]
wellbeing2$Country[2]
wellbeing2$Country[3]

# **************************
# graph of well-being indicator in relation to the variable X ('Family')
ggplot(wellbeing, aes(x = Family, y = Well.being)) + geom_point() + geom_smooth()

# Σχόλιο: Τα δεδομένα φαίνεται στις αρχικές τιμές 1.2-1.4, σαν να έχουν
# γραμμική συσχέτιση, αλλά τελικά, στις επόμενες τιμές, φαίνεται ότι 
# αποκλίνουν αισθητά από την γραμμική συσχέτιση. Σαν σύνολο θα λέγαμε
# ότι οι δύο μεταβλητές είναι γραμμικά ασυσχέτιστες.

# **************************
# isolation of countries with value of 'Family' bigger than the mean 
wellbeing3 = wellbeing[wellbeing$Family > mean_fam,]
View(wellbeing3)

# **************************
# bar diagram of well-being indicator of the European countries with value of 'Family' bigger than the mean 
# wellbeing4 = wellbeing3[order(-wellbeing3$Well.being),]
ggplot(wellbeing3) + geom_bar(aes(reorder(Country, -Well.being), Well.being, fill=Well.being),
                              col="black", alpha = 0.5, stat="identity") 

# Σχόλιο: Στο ραβδόγραμμα δεικτών ευεξίας, στο οποίο συμπεριλήφθηκαν οι χώρες
# με τον υψηλότερο δείκτη 'Family' (αριθμός παιδιών / γυναίκα), παρατηρώ ότι
# ο δείκτης ευεξίας είναι αρκετά υψηλός για κάθε μια από αυτές και κυμαίνεται
# σε κοντινές τιμές. 