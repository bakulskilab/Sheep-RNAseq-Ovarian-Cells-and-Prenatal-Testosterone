###############################
#QoRTs plots
###############################

# line to start interactive job on great lakes
# srun --nodes=1 --ntasks-per-node=1 --mem-per-cpu=4GB --pty /bin/bash

meta <- read.table("/nfs/turbo/bakulski1/Datasets/Padmanabhan/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/Run_2823/Run_2823_padmanabha_DemuxStats.txt"
                   , header = T)

#get all the folders from QoRTs
folders <- list.dirs(path='/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/QoRTs',recursive=T)
folders <- folders[-1]

#format variables and check folders order same as meta
meta <- meta[1:24,]
meta$id2 <- paste0("Sample_",meta$SampleID)
meta$Description <- as.character(meta$Description)
meta$treat <- c('C','C','C','C','C','T','T','T','T','T',
                'C','C','C','C','C','T','T','T','T','T',
                'C','C','T','T')
meta$sheep <- ifelse(grepl('VAT',meta$Description, fixed = T), 
                     substr(meta$Description, 4,6),
                     substr(meta$Description,1,3))

folders.check <- gsub('.*/QoRTs/','',folders)
identical(meta$id2, folders.check)


decoder <- data.frame(unique.ID=sub('.*/QoRTs/','',folders),
                      group.ID=meta$treat,
                      sample.ID=meta$sheep)
  
#done after running the QoRTs program on STAR output
library(QoRTs)
library(png)

res <- read.qc.results.data('/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/QoRTs/', decoder=decoder[1:20,])
#res2 <- read.qc.results.data('/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/QoRTs/', decoder=decoder[20:24,])

makeMultiPlot.all(res, outfile.dir='/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/QoRTs/',plot.device.name='pdf',chromosome.name.style="ENSEMBL")
