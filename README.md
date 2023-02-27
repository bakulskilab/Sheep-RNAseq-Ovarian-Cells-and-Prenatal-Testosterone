# Developmental Programming: Sheep Granulosa and Theca Cell–Specific Transcriptional Regulation by Prenatal Testosterone

## Citation Information
Puttabyatappa, M., Guo, X., Dou, J., Dumesic, D., Bakulski, K. M., & Padmanabhan, V. (2020). 
Developmental Programming: Sheep Granulosa and Theca Cell-Specific Transcriptional Regulation by Prenatal Testosterone. 
Endocrinology, 161(8), bqaa094. https://doi.org/10.1210/endocr/bqaa094. PMID: 32516392. PMCID: PMC7417881


This Github repository contains the data management and analytic scripts to produce the following manuscript:
[Developmental Programming: Sheep Granulosa and Theca Cell–Specific Transcriptional Regulation by Prenatal Testosterone](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7417881/)

## Abstract
Prenatal testosterone (T)–treated sheep, similar to polycystic ovarian syndrome women, manifest reduced cyclicity, functional hyperandrogenism, and polycystic ovary (PCO) morphology. The PCO morphology results from increased follicular recruitment and persistence of antral follicles, a consequence of reduced follicular growth and atresia, and is driven by cell-specific gene expression changes that are poorly understood. Therefore, using RNA sequencing, cell-specific transcriptional changes were assessed in laser capture microdissection isolated antral follicular granulosa and theca cells from age 21 months control and prenatal T–treated (100 mg intramuscular twice weekly from gestational day 30 to 90; term: 147 days) sheep. In controls, 3494 genes were differentially expressed between cell types with cell signaling, proliferation, extracellular matrix, immune, and tissue development genes enriched in theca; and mitochondrial, chromosomal, RNA, fatty acid, and cell cycle process genes enriched in granulosa cells. Prenatal T treatment 1) increased gene expression of transforming growth factor β receptor 1 and exosome component 9, and decreased BCL6 corepressor like 1, BCL9 like, and MAPK interacting serine/threonine kinase 2 in both cells, 2) induced differential expression of 92 genes that included increased mitochondrial, ribosome biogenesis, ribonucleoprotein, and ubiquitin, and decreased cell development and extracellular matrix-related pathways in granulosa cells, and 3) induced differential expression of 56 genes that included increased noncoding RNA processing, ribosome biogenesis, and mitochondrial matrix, and decreased transcription factor pathways in theca cells. These data indicate that follicular function is affected by genes involved in transforming growth factor signaling, extracellular matrix, mitochondria, epigenetics, and apoptosis both in a common as well as a cell-specific manner and suggest possible mechanistic pathways for prenatal T treatment–induced PCO morphology in sheep.

## Funding
This work was supported by Eunice Kennedy Shriver National Institute of Child Health & Human Development, National Institutes of Health (awards P01HD44232 to V.P. and P50HD071836 to D.D.)

##Data Availability
All data generated or analyzed during this study are included in this published article or in the data repositories listed in References.

## Script Files
1_fastqc.sh: using fastqc and multiqc to QC the raw RNA-sequencing data

2_STAR_gl.sh: Aligning RNA sequencing data to human genome

3_QoRTs.sh: Quality control for aligned data

3_QoRTs_plots.R: Saving complied QC plots

4_featureCounts.sh: Generating gene counts data

5_diff_exp_analysis.Rmd: differential expression analysis
