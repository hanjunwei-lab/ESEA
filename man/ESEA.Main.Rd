\name{ESEA.Main}
\alias{ESEA.Main}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Identify dysregulated pathways based on edge set enrichment analysis}
\description{
  A edge-centric method to identify dysregulated pathways by investigating the changes of biological relationships of pathways in the context of gene
expression data.
}
\usage{
  ESEA.Main(EdgeCorScore, pathwayEdge.db, weighted.score.type = 1, pathway = "kegg", 
  gs.size.threshold.min = 15, gs.size.threshold.max = 1000, 
  reshuffling.type = "edge.labels", nperm = 100, p.val.threshold = -1, 
  FDR.threshold = 0.05, topgs = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{EdgeCorScore}{ A numeric vector. Each element is the differential correlation score of an edge.}
  \item{pathwayEdge.db}{ A character vector, the length of it is the number of pathways.}
  \item{weighted.score.type}{ A value. Edge enrichment correlation-based weighting: 0=no weight, 1=standard weigth, 2 = over-weigth. The default value is 1}
  \item{pathway}{ A character string of pathway database. Should be one of "kegg","reactome",
  "nci","huamncyc","biocarta","spike" and "panther". The default value is "kegg"}
  \item{gs.size.threshold.min}{ An integer. The minimum size (in edges) for pathways to be considered. The default value is 15. }
  \item{gs.size.threshold.max}{ An integer. The maximum size (in edges) for pathways to be considered. The default value is 1000.}
  \item{reshuffling.type}{ A character string. The type of permutation reshuffling: "edge.labels" or "gene.labels". The default value is "edge.labels".}
  \item{nperm}{ An integer. The number of permutation reshuffling. The default value is 100.}
  \item{p.val.threshold}{ A value. The significance threshold of NOM p-value for pathways whose detail results of pathways to be presented. The  default value is -1, which means no threshold.}
  \item{FDR.threshold}{ A value. The significance threshold of FDR q-value for pathways whose detail results of pathways to be presented. The default value is 0.05.}
  \item{topgs}{ An integer. The number of top scoring gene sets used for detailed reports. The default value is 1.}
}
\details{
   ESEA integrates pathway structure (e.g. interaction, regulation, modification, and binding etc.) and differential correlation among genes in identifying dysregulated pathways. The biological pathways were collected from the seven public databases (KEGG; Reactome; Biocarta; NCI/Nature Pathway Interaction Database; SPIKE; HumanCyc; Panther). We constructed a background set of edges by extracting pathway structure from each pathway in the seven databases. We then applied an information-theoretic measure, mutual information(MI), to quantify the change of correlation between genes for each edge based on gene expression data with cases and controls. An edge list was formed by ranking the edges according to their changes of correlation. Finally, we used the weighted Kolmogorov-Smirnov statistic to evaluate each pathway by mapping the edges in the pathway to the edge list. The permutation is used to identify the statistical significance of pathways (normal p-values) and the FDR is used to to account for false positives.
}
\value{

  A list. It includes two elements: SummaryResult and PathwayList.

  SummaryResult is a list. It is the summary of the result of pathways which include two elements: the results of Gain-of-correlation and Loss-of-correlation. Each element of the lists is a dataframe. Each rows of the dataframe represents a pathway. Its columns include "Pathway Name", "Pathway source" "ES", "NES", "NOM p-val", "FDR q-val", "Tag percentage" (Percent of edge set before running enrichment peak), "edge percentage" (Percent of edge list before running enrichment peak), "Signal strength" (enrichment signal strength).

  PathwayList is list of pathways which present the detail results of pathways with NOM p-val<p.val.threshold or FDR<FDR.threshold or topgs<=topgs.threshold. Each element of the list is a dataframe. Each rows of the dataframe represents an edge. Its columns include "Edge number in the (sorted) pathway", "Edge ID", "location of the edge in the sorted edge list", "EdgeCorScore", "Running enrichment score", "Property of contribution".
}

\author{Junwei Han <hanjunwei1981@163.com>, Xinrui Shi<xinrui103@163.com> and Chunquan Li <lcqbio@163.com>}

\references{
Subramanian, A., Tamayo, P., Mootha, V.K., Mukherjee, S., Ebert, B.L., Gillette, M.A., Paulovich, A., Pomeroy, S.L., Golub, T.R., Lander, E.S. et al. (2005) Gene set enrichment analysis: a knowledgebased approach for interpreting genome-wide expression profiles. Proc Natl Acad Sci U S A, 102, 15545-15550.
}

\examples{
\dontrun{

#get example data
dataset<-GetExampleData("dataset")
class.labels<-GetExampleData("class.labels")
controlcharactor<-GetExampleData("controlcharactor")

#get the data for background set of edges
edgesbackgrand<-GetEdgesBackgrandData()

#get the edge sets of pathways
pathwayEdge.db<-GetPathwayEdgeData()

#calculate the differential correlation score for edges
EdgeCorScore<-calEdgeCorScore(dataset, class.labels, controlcharactor, edgesbackgrand)

#identify dysregulated pathways by using the function ESEA.Main
Results<-ESEA.Main(
EdgeCorScore,
pathwayEdge.db,
weighted.score.type = 1, 
pathway = "kegg", 
gs.size.threshold.min = 15, 
gs.size.threshold.max = 1000,
reshuffling.type = "edge.labels",
nperm =10, 
p.val.threshold=-1,
FDR.threshold = 0.05, 
topgs =1
)

#print the summary results of pathways to screen
Results[[1]][[1]][1:5,]

#print the detail results of pathways to screen
Results[[2]][[1]][1:5,]

#write the summary results of pathways to tab delimited file.
write.table(Results[[1]][[1]], file = "kegg-SUMMARY RESULTS Gain-of-correlation.txt", quote=F,
 row.names=F, sep = "\t")
write.table(Results[[1]][[2]], file = "kegg-SUMMARY RESULTS Loss-of-correlation.txt", quote=F,
 row.names=F, sep = "\t")

#write the detail results of genes for each pathway with FDR.threshold< 0.05 to tab delimited file.
for(i in 1:length(Results[[2]])){
PathwayList<-Results[[2]][[i]]
filename <- paste(names(Results[[2]][i]),".txt", sep="", collapse="")
write.table(PathwayList, file = filename, quote=F, row.names=F, sep = "\t")
}

}
}