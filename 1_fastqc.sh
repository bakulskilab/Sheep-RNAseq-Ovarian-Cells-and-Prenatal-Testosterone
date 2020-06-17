#!/bin/bash
#SBATCH --job-name FastQC_sheep_ov
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=2g
#SBATCH --time=6:00:00
#SBATCH --account=bakulski1
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END

module load fastqc/0.11.5

for path in /nfs/turbo/bakulski1/Datasets/Padmanabhan/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/Run_2823/padmanabha/Sample_12*; do

	SAMPLEID="$(basename "${path}")"
	
	mkdir /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/fastqc/$SAMPLEID/
	
	fastqc \
	/nfs/turbo/bakulski1/Datasets/Padmanabhan/ruddle.brcf.med.umich.edu/ruddle.brcf.med.umich.edu/Run_2823/padmanabha/$SAMPLEID/*.fastq.gz \
	--outdir=/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/fastqc/$SAMPLEID/

done


module load python-anaconda3

cd /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/fastqc/

multiqc \
/nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/fastqc/Sample_12*