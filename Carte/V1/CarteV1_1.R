library(sf)
library(dplyr)

#Chargement des données
fd_c <- st_read('fond_ZE2020_geo20.shp')

l <- c()

#Indices des codes correspondants aux départements d'outre mer
indices <- c('971','972','973','974','976')
for(i in indices){
  l <- c(l,grep(i, fd_c$code, ignore.case = TRUE))
}
#On retire les départements d'outre mer
fd_cnew <- fd_c[-l,]
fd <- fd_cnew[3]

#Fusion pour obtenir des zones d'emplois
fd_cnew_plot <- fd_cnew%>% 
                group_by(ze2020)%>% 
                dplyr::summarize()

plot(fd_cnew_plot)
