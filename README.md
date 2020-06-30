# ESEA
Discovering the Dysregulated Pathways based on Edge Set Enrichment Analysis

> The package can identify the dysregulated canonical pathways by investigating the changes of biological relationships of pathways in the context of gene expression data. (1) The ESEA package constructs a background set of edges by extracting pathway structure (e.g. interaction, regulation, modification, and binding etc.) from the seven public databases (KEGG; Reactome; Biocarta; NCI; SPIKE; HumanCyc; Panther) and the edge sets of pathways for each of the above databases. (2) The ESEA package can can quantify the change of correlation between genes for each edge based on gene expression data with cases and controls. (3) The ESEA package uses the weighted Kolmogorov-Smirnov statistic to calculate an edge enrichment score (EES), which reflects the degree to which a given pathway is associated the specific phenotype. (4) The ESEA package can provide the visualization of the results.

### how to install

```R
Installation method：

1. library(devtools); 
   install_github("hanjunwei-lab/ESEA")
2. install.packages("ESEA")

Use：
library(ESEA)
```

Please cite the following article when using `ESEA`:

Han, J., X. Shi, Y. Zhang, Y. Xu, Y. Jiang, C. Zhang, L. Feng, H. Yang, D. Shang, Z. Sun, F. Su, C. Li, and X. Li, ESEA: Discovering the Dysregulated Pathways based on Edge Set Enrichment Analysis. Sci Rep, 2015. 5: p. 13044.