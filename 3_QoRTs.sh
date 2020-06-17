#!/bin/bash
#SBATCH --job-name QoRTs_map_sheep_ov
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=20g
#SBATCH --time=44:00:00
#SBATCH --account=bakulski
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END

module load Bioinformatics
module load samtools/1.5

for path in /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/STAR/Sample_124*; do
	
	SAMPLEID="$(basename "${path}")"
	
  cd /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/STAR/$SAMPLEID/
  samtools view -b -S Aligned.out.sam > Aligned.out.bam
  samtools sort -n Aligned.out.bam -o Aligned.out.sorted
  rm Aligned.out.bam
  rm Aligned.out.sam
 
  rm -r /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/QoRTs/$SAMPLEID/
  mkdir /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/QoRTs/$SAMPLEID/
    
  java -Xmx16G -jar /nfs/turbo/bakulski1/People/johndou/BeWo_RNAseq/QoRTs.jar QC\
  --stranded \
  /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/STAR/$SAMPLEID/Aligned.out.sorted  \
  /nfs/turbo/bakulski1/People/johndou/Sheep_Genome/Oar_rambouillet_1.0/Oar_rambouillet_v1.0.gtf  \
  /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/QoRTs/$SAMPLEID/

done


for path in /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/STAR/Sample_126*; do
	
	SAMPLEID="$(basename "${path}")"
  
  rm -r /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/QoRTs/$SAMPLEID/
  mkdir /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/QoRTs/$SAMPLEID/
    
  java -Xmx16G -jar /nfs/turbo/bakulski1/People/johndou/BeWo_RNAseq/QoRTs.jar QC\
  --stranded \
  --singleEnded \
  /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/STAR/$SAMPLEID/Aligned.out.sam  \
  /nfs/turbo/bakulski1/People/johndou/Sheep_Genome/Oar_rambouillet_1.0/Oar_rambouillet_v1.0.gtf  \
  /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/QoRTs/$SAMPLEID/

done