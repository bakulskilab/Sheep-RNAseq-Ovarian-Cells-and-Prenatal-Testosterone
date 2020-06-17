#!/bin/bash
#SBATCH --job-name featureCount_sheep_run2823
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=9
#SBATCH --mem-per-cpu=3500mb
#SBATCH --time=48:00:00
#SBATCH --account=bakulski
#SBATCH --partition=standard
#SBATCH --mail-user=johndou@umich.edu
#SBATCH --mail-type=BEGIN,FAIL,END


module load Bioinformatics
module load subread/1.6.0

ALIGNED=$(find /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/STAR/ -name "Aligned.out.sorted")

cd /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2823/STAR/
 
featureCounts \
	-T 9 \
	-s 2 \
	-t exon \
	-g gene_id \
	-a /nfs/turbo/bakulski1/People/johndou/Sheep_Genome/Oar_rambouillet_1.0/GCF_002742125.1_Oar_rambouillet_v1.0_genomic.gtf  \
	-o /nfs/turbo/bakulski1/People/johndou/vsheep/Run_2742/featureCounts/counts \
	$ALIGNED
