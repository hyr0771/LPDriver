# LPDriver
A novel method for identifying personalized cancer driver genes through linear neighborhood propagation.


- This package includes Matlab scripts and five datasets include BRCA,HNSC,LUAD,LUSC and PRAD for demo of LPDriver method.

- The input datasets include: DatasetsName_tumor.txt: the gene tumor expression data. 
- The output datasets include: The result (matrix) of detecting personalized driver genes by LPDriver; For LPDriver,The first row is the samples.The genes in each column are the predictive genes of the sample

- LPDriver was written and tested on Matlab with version "R2019a".

- Usage: 
Step 1. Download files and directories from the repository " LPDriver ".
Step 2. Set expression_tumor_fileName = ' DatasetsName _tumor.txt' in  " main_LPDriver.m" .
Step 3. Run main_LPDriver.m.

- We choose 5 patients data in BRCA as a example case in our demo so you can implement LPDriver quickly. 
- Note that LPDriver requires a good amount of RAM.
