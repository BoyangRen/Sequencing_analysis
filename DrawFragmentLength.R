library(ggplot2)
setwd("d:/Data/Daxx/ATAC/")
frag<-read.table("II-Daxx-KO.rmDup.rmMT.shifted.bam.raw.csv",sep = "\t",header = T)

#linear scale y
g<-ggplot(frag,aes(Size,Occurrences/sum(Occurrences)*100))+
  geom_line()+
  geom_vline(xintercept =frag$Size[which(frag$Occurrences==max(frag$Occurrences))],color="black",alpha=0.1)+
  geom_text(aes(label=frag$Size[which(frag$Occurrences==max(frag$Occurrences))]),data=frag[which(frag$Occurrences==max(frag$Occurrences)),],size=4,nudge_x =50,nudge_y = -97)+
  coord_cartesian(xlim = c(0,1000))+
  theme_bw()+
  xlab("Fragment length")+ylab("Frequency (%)")+
  labs(title = "ATAC-Daxx_KO-Phase II")
g



#log scale y
g<-ggplot(frag,aes(Size,log10(Occurrences/sum(Occurrences))))+
  geom_line()+
  geom_vline(xintercept =frag$Size[which(frag$Occurrences==max(frag$Occurrences))],color="black",alpha=0.1)+
  geom_text(aes(label=frag$Size[which(frag$Occurrences==max(frag$Occurrences))]),data=frag[which(frag$Occurrences==max(frag$Occurrences)),],size=4,nudge_x =50,nudge_y = -1.5)+
  coord_cartesian(ylim=c(-5,-1))+
  theme_bw()+
  xlab("Fragment length")+ylab("log10Frequency")+
  labs(title = "ATAC-Daxx_KO-Phase II")
g






gg<-gg + geom_text_repel(aes(label=county),data=midwest_sub,size=2)
