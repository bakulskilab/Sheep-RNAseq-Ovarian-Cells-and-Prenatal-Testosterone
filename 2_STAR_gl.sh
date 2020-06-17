#!/bin/bash
#SBATCH --job-name STAR_map_sheep_ov
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=6
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=6g
#SBATCH --time=24:00:00
#SBATCH --account=bakulski
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END


for path in /nfs/turbo/bakulski1/Datasets/Padmanabhan/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/Run_2823/padmanabha/Sample_12*; do
	
	SAMPLEID="$(basename "${path}")"
	
	rm -r /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/STAR/$SAMPLEID/
	mkdir /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/STAR/$SAMPLEID/
 
  /nfs/turbo/bakulski1/Software/STAR/bin/Linux_x86_64_static/STAR \
  --genomeDir /nfs/turbo/bakulski1/People/johndou/Sheep_Genome/Oar_ram_refSTAR/ \
  --readFilesIn \
  /nfs/turbo/bakulski1/Datasets/Padmanabhan/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/Run_2823/padmanabha/$SAMPLEID/*.fastq.gz \
  --readFilesCommand gunzip -c \
  --runThreadN 6 \
  --clip5pNbases 0 3 \
  --outFilterMultimapNmax 10 \
  --outSAMmode Full \
  --sjdbScore 2 \
  --outFileNamePrefix \
  /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/STAR/$SAMPLEID/ \
  --outReadsUnmapped Fastx
   
done