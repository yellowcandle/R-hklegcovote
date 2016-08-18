legco.members.info <- read.csv("legco-members-info.csv")
makeurls <- paste("http://app.legco.gov.hk/vrdb/odata/vVotingResult?$filter=type%20eq%20%27Council%20Meeting%27%20and%20name_en%20eq%20%27",as.character(legco.members.info[,1]),"%27%20and%20term_no%20eq%205&$select=motion_en,vote", sep="")
download.file(makeurls[2], paste(legco.members.info[3,1],".json",sep=""))


for (v in 1:71) {
  download.file(makeurls[v], paste(legco.members.info[v,1],".json",sep=""))
}