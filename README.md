# LPDriver
LPDriver:A novel method for identifying personalized cancer driver genes through linear neighborhood propagation.


(1) This package includes the Matlab scripts of LPDriver and five cancer datasets including BRCA,HNSC,LUAD,LUSC and PRAD.

(2) The user can start LPDriver with main_LPDriver.m. The user can choose one of these five cancer datasets and specify the selected input dataset by setting the parameter “expression_tumor_fileName” in main_LPDriver.m. 
For example, we choose five patients’ tumor genetic expression data in BRCA as an example case and produce an example dataset 'Example_tumor.txt'. The user can specify expression_tumor_fileName = 'Example_tumor.txt' in main_LPDriver.m and run main_LPDriver.m to get a demo.

(3) The output is the resulting matrix of the predicted driver genes. In the resulting matrix, the first row is the name of patient samples and the genes in each column are the predicted driver genes for the patient sample.

(4) LPDriver was written and tested on Matlab with version "R2019a".

