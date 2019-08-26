#find the intersect between ITS and LSU results
BC32.featuretable.ITS.LSU_intersect <- merge(BC32.featuretable.ITS.ID95,BC32.featuretable.LSU.ID90,by="row.names")
BC32.featuretable.ITS.LSU_intersect


#modified the LSU part 
#1. delete _.sp at Family and Genus level 
#2. Genus: Gibberella = Fusairum 
#3. Order: Glomerellaceae=sidanimycetes-intera-sedis 
#4. Genus: Cladosporium=cladosprium complex

stopwords = c("_sp.")
gsub(paste0(stopwords,collapse = "|"),"", BC32.featuretable.ITS.LSU_intersect$Genus.y)
BC32.featuretable.ITS.LSU_intersect$Genus.y <- gsub(paste0(stopwords,collapse = "|"),"", BC32.featuretable.ITS.LSU_intersect$Genus.y)

gsub(paste0(stopwords,collapse = "|"),"", BC32.featuretable.ITS.LSU_intersect$Family.y)
BC32.featuretable.ITS.LSU_intersect$Family.y <- gsub(paste0(stopwords,collapse = "|"),"", BC32.featuretable.ITS.LSU_intersect$Family.y)

#Compare the results by taxonomy level
BC32.featuretable.ITS.LSU_intersect$Domain.Z <- NULL
BC32.featuretable.ITS.LSU_intersect$Phylum.Z <- NULL
BC32.featuretable.ITS.LSU_intersect$Class.Z <- NULL
BC32.featuretable.ITS.LSU_intersect$Order.Z <- NULL
BC32.featuretable.ITS.LSU_intersect$Family.Z <- NULL
BC32.featuretable.ITS.LSU_intersect$Genus.Z <- NULL
BC32.featuretable.ITS.LSU_intersect$Species.Z <- NULL
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$Domain.x==BC32.featuretable.ITS.LSU_intersect$Domain.y,"Domain.Z"] <- 1
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$Phylum.x==BC32.featuretable.ITS.LSU_intersect$Phylum.y,"Phylum.Z"] <- 1
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$Class.x==BC32.featuretable.ITS.LSU_intersect$Class.y,"Class.Z"] <- 1
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$Order.x==BC32.featuretable.ITS.LSU_intersect$Order.y,"Order.Z"] <- 1
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$Family.x==BC32.featuretable.ITS.LSU_intersect$Family.y,"Family.Z"] <- 1
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$Genus.x==BC32.featuretable.ITS.LSU_intersect$Genus.y,"Genus.Z"] <- 1
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$Species.x==BC32.featuretable.ITS.LSU_intersect$Species.y,"Species.Z"] <- 1
#replcae NA as 0
BC32.featuretable.ITS.LSU_intersect[is.na(BC32.featuretable.ITS.LSU_intersect)] <- 0
#Check the data structure
str(BC32.featuretable.ITS.LSU_intersect)
BC32.featuretable.ITS.LSU_intersect$Domain.Z <- as.numeric(BC32.featuretable.ITS.LSU_intersect$Domain.Z)
BC32.featuretable.ITS.LSU_intersect$Phylum.Z <- as.numeric(BC32.featuretable.ITS.LSU_intersect$Phylum.Z)
BC32.featuretable.ITS.LSU_intersect$Class.Z <- as.numeric(BC32.featuretable.ITS.LSU_intersect$Class.Z)
BC32.featuretable.ITS.LSU_intersect$Order.Z <- as.numeric(BC32.featuretable.ITS.LSU_intersect$Order.Z)
BC32.featuretable.ITS.LSU_intersect$Family.Z <- as.numeric(BC32.featuretable.ITS.LSU_intersect$Family.Z)
BC32.featuretable.ITS.LSU_intersect$Genus.Z <- as.numeric(BC32.featuretable.ITS.LSU_intersect$Genus.Z)
BC32.featuretable.ITS.LSU_intersect$Species.Z <- as.numeric(BC32.featuretable.ITS.LSU_intersect$Species.Z)
#Sum up the value
BC32.featuretable.ITS.LSU_intersect$SUM <- rowSums(BC32.featuretable.ITS.LSU_intersect[,c(16:22)])

#Covert the sum up value to taxonomy level 
BC32.featuretable.ITS.LSU_intersect$Taxonomy <- NULL
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$SUM==7,"Taxonomy"] <- "Species"
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$SUM==6,"Taxonomy"] <- "Genus"
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$SUM==5,"Taxonomy"] <- "Family"
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$SUM==4,"Taxonomy"] <- "Order"
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$SUM==3,"Taxonomy"] <- "Class"
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$SUM==2,"Taxonomy"] <- "Phylum"
BC32.featuretable.ITS.LSU_intersect[BC32.featuretable.ITS.LSU_intersect$SUM==1,"Taxonomy"] <- "Domain"


# count the number of each taxonomy level 
BC32_intersect_Count <- table(BC32.featuretable.ITS.LSU_intersect$Taxonomy)
BC32_intersect_Count

#sum the taxonomy by column
BC32SUM <- colSums(BC32.featuretable.ITS.LSU_intersect[,c(16:22)])
BC32SUM
BC32SUM <- as.data.frame(t(BC32SUM))
BC32SUM <- as.data.frame(t(BC32SUM))
colnames(BC32SUM)[1] <- "Same"
BC32SUM$V2 <- NULL
BC32SUM$V2 <- (BC32SUM$Same[1] - BC32SUM$Same)
colnames(BC32SUM)[2] <- "Different"
BC32SUM
BC32SUM_2 <- t(BC32SUM)
str(BC32SUM)


#stacked bar plot 
counts <- table(BC32SUM)
counts
barplot(BC32SUM,
        xlab="Taxonomy", ylab="Number of OTU",
        legend = rownames(BC32SUM))

?barplot
mtcars
counts <- table(mtcars$vs, mtcars$gear)
counts

barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts))


#write out the table as excel file
getwd()
write.xlsx(BC32.featuretable.ITS.LSU_intersect, "D:/PHD/BC32.featuretable.ITS.LSU_intersect.xlsx")



