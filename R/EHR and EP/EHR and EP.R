# Nicolas Pigadas el18445
# ΗΦΥ και Ηλεκτρονική Συνταγογράφηση

# installing packages, loading libraries
install.packages('RISmed')
library(RISmed)
install.packages('treemap')
library(treemap)

#apoth_hkeysh thematos anazhthshs se metavlhth
search_topic <- 'e-prescription' 

# ----------------- 1 -----------------
# x = 5, 2015
search_query<-EUtilsSummary(search_topic, db = "pubmed", retmax = 50, mindate=2015, maxdate=2015) 
# retmax: arithmos eggrafwn poy mas endiaferoun

summary(search_query)
# ----------------- 2a -----------------
QueryId(search_query) # articles' ids
records<-EUtilsGet(search_query) # lhpsh data
class(records)

#topothethsh etiketwn/pediwn se framework px title, abstract text
#pubmed_data1 <- data.frame('Title'=ArticleTitle(records), 'Abstract'=AbstractText(records))

# ----------------- 2b -----------------
pubmed_data1 <- data.frame('Title'=ArticleTitle(records))
head(pubmed_data1, 10) # 10 first articles' titles

# ----------------- 2c -----------------
pubmed_data2 <- data.frame('Abstract'=AbstractText(records))
tail(pubmed_data2, 2) # 2 last articles' abstract


# ----------------- 3 -----------------
# reading the given file
icd10 <- read.csv(file = 'icd10.csv', header=TRUE, sep=";", quote="", stringsAsFactors=FALSE)

# ----------------- 4 -----------------
# ----------------- 4a -----------------
disease1 <- "P445" # doesn't exist
disease1 <- "P45"  # doesn't exist either
disease1 <- "P045"
disease1_name <- icd10$name[icd10$code==disease1]
disease1_name

# ----------------- 4b -----------------
disease2 <- "N445" # doesn't exist
disease2 <- "N45"  # doesn't exist either
disease2 <- "N045"
disease2_name <- icd10$name[icd10$code==disease2]
disease2_name

# ----------------- 4c -----------------
# I ran the sample command once and got "Q644".
# I will keep this value for the sake of reproducibility of my code results.
# disease3 <- sample(icd10$code, 1) 
disease3 <- "Q644"
disease3_name <- icd10$name[icd10$code==disease3]
disease3_name

# ----------------- 5 -----------------
# ----------------- 5a -----------------
search_query1<-EUtilsSummary(disease1_name, db = "pubmed", mindate=2018, maxdate=2022) 
summary(search_query1)
count1 <- QueryCount(search_query1)
count1
# Το count1 βγαίνει 0. Θα ξανατρέξω το sample command μια φορά
# και θα κρατήσω την πρώτη τιμή για λόγους επαναληψιμότητας των
# αποτελεσμάτων του κώδικά μου. Ο λόγος που διαλέγω νέα ασθένεια
# είναι για να έχουν νόημα τα plots. Τελικά για πολλές δεν υπήρχαν
# papers, χρειάστηκε να τρέξω τις εντολές πολλαπλές φορές.

# disease1 <- sample(icd10$code, 1)
disease1 <- "Z52010"
disease1_name <- icd10$name[icd10$code==disease1]
disease1_name
search_query1<-EUtilsSummary(disease1_name, db = "pubmed", mindate=2018, maxdate=2022) 
summary(search_query1)
count1 <- QueryCount(search_query1)
count1

records1 <- EUtilsGet(search_query1) 
pubmed_q1 = data.frame('Abstract'=AbstractText(records1))
abstract_count1 = pubmed_q1[!pubmed_q1$Abstract=="NA",]
length(abstract_count1)

# ----------------- 5b -----------------
search_query2<-EUtilsSummary(disease2_name, db = "pubmed", mindate=2018, maxdate=2022) 
summary(search_query2)
count2 <- QueryCount(search_query2)
count2

# Το count2 βγαίνει και αυτό 0. Κάνω τα ίδια με την ασθένεια 1.
#disease1 <- sample(icd10$code, 1)
disease2 <- "P610"
disease2_name <- icd10$name[icd10$code==disease2]
disease2_name
search_query2<-EUtilsSummary(disease2_name, db = "pubmed", mindate=2018, maxdate=2022) 
summary(search_query2)
count2 <- QueryCount(search_query2)
count2

records2 <- EUtilsGet(search_query2) 
pubmed_q2 = data.frame('Abstract'=AbstractText(records2))
abstract_count2 = pubmed_q2[!pubmed_q2$Abstract=="NA",]
length(abstract_count2)

# ----------------- 5c -----------------
search_query3<-EUtilsSummary(disease3_name, db = "pubmed", mindate=2018, maxdate=2022) 
summary(search_query3)
count3 <- QueryCount(search_query3)
count3

records3 <- EUtilsGet(search_query3) 
pubmed_q3 = data.frame('Abstract'=AbstractText(records3))
abstract_count3 = pubmed_q3[!pubmed_q2$Abstract=="NA",]
length(abstract_count3)

# ----------------- 6 -----------------
# ----------------- 6a -----------------
# d:disease, y: year, c:count
d1_y1 <- EUtilsSummary(disease1_name, mindate=2020, maxdate=2020)
#summary(d1_y1)
d1_y2 <- EUtilsSummary(disease1_name, mindate=2021, maxdate=2021)
#summary(d1_y2)
d1_y3 <- EUtilsSummary(disease1_name, mindate=2022, maxdate=2022) 
#summary(d1_y3)
c1_d1_y1 <- QueryCount(d1_y1) 
c2_d1_y2 <- QueryCount(d1_y2) 
c3_d1_y3 <- QueryCount(d1_y3)
show(c1_d1_y1) 
show(c2_d1_y2)
show(c3_d1_y3)
# ----------------- 6b -----------------
d2_y1 <- EUtilsSummary(disease2_name, mindate=2020, maxdate=2020)
#summary(d2_y1)
d2_y2 <- EUtilsSummary(disease2_name, mindate=2021, maxdate=2021)
#summary(d2_y2)
d2_y3 <- EUtilsSummary(disease2_name, mindate=2022, maxdate=2022) 
#summary(d2_y3)
c1_d2_y1 <- QueryCount(d2_y1) 
c2_d2_y2 <- QueryCount(d2_y2) 
c3_d2_y3 <- QueryCount(d2_y3)
show(c1_d2_y1) 
show(c2_d2_y2)
show(c3_d2_y3)
# ----------------- 6c -----------------
d3_y1 <- EUtilsSummary(disease3_name, mindate=2020, maxdate=2020)
#summary(d3_y1)
d3_y2 <- EUtilsSummary(disease3_name, mindate=2021, maxdate=2021)
#summary(d3_y2)
d3_y3 <- EUtilsSummary(disease3_name, mindate=2022, maxdate=2022) 
#summary(d3_y3)
c1_d3_y1 <- QueryCount(d3_y1) 
c2_d3_y2 <- QueryCount(d3_y2) 
c3_d3_y3 <- QueryCount(d3_y3)
show(c1_d3_y1) 
show(c2_d3_y2)
show(c3_d3_y3)

# ----------------- barplot -----------------
years <- c(2020,2021,2022)

plot.df <- data.frame(class = years,
                    disease1 = c(c1_d1_y1,c2_d1_y2,c3_d1_y3),
                    disease2 = c(c1_d2_y1,c2_d2_y2,c3_d2_y3),
                    disease3 = c(c1_d3_y1,c2_d3_y2,c3_d3_y3))

pal <- colorRampPalette(colors = c("lightblue", "darkred"))(3)

barplot(t(as.matrix(plot.df[, 2:4])), 
        beside = TRUE,
        names.arg = plot.df$class,
        legend.text = TRUE,
        col = pal,
        ylab = "No of articles",
        xlab = "Years")

# ----------------- 7: treemap -----------------
group = c(rep("disease1",3), rep("disease2",3), rep("disease3",3))
group
subgroup = c("2020", "2021", "2022" )
counting_papers = c(c1_d1_y1,c2_d1_y2,c3_d1_y3,c1_d2_y1,c2_d2_y2,c3_d2_y3,c1_d3_y1,c2_d3_y2,c3_d3_y3)

tr_data = data.frame(group,subgroup,counting_papers)

treemap(tr_data,
        index=c("group", "subgroup"),
        vSize="counting_papers",
        type="index"
)

