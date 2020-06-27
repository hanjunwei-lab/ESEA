\name{calEdgeCorScore}
\alias{calEdgeCorScore}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Calculate the differential correlation score for edges}
\description{
 CalEdgeCorScore attempts to calculate the differential correlation scores of two genes in the edge between the expression data of all samples and control samples.
}
\usage{
  calEdgeCorScore(dataset, class.labels, controlcharactor, edgesbackgrand)
}
\arguments{
  \item{dataset}{ A marix of gene expression data whose row names are genes symbols and whose column names are samples.}
  \item{class.labels}{ A vector of binary labels. The vector is used to distinguish the class of phenotype.}
  \item{controlcharactor}{ A character string of control sample label.}
  \item{edgesbackgrand}{ A marix which deposits the data of background set of edges.}
}
\details{
 For each edge, we estimated the mutual information (MI) between two genes in the expression data of all samples and control samples respectively. The difference of MI between all samples and control samples is used as the differential correlation score of the edge.}
\value{
 A vector. Each element is the differential correlation score of an edge and whose name correspond to 
 edge ID in the background set of edges.
}
\author{Junwei Han <hanjunwei1981@163.com>, Xinrui Shi<xinrui103@163.com> 
and Chunquan Li <lcqbio@163.com>}

\references{

Margolin, A.A., Nemenman, I., Basso, K., Wiggins, C., Stolovitzky, G., Dalla Favera, R. and Califano, A. (2006) ARACNE: an algorithm for the reconstruction of gene regulatory networks in a mammalian cellular context. BMC bioinformatics, 7 Suppl 1, S7.

Mani, K.M., Lefebvre, C., Wang, K., Lim, W.K., Basso, K., Dalla-Favera, R. and Califano, A. (2008) A systems biology approach to prediction of oncogenes and molecular perturbation targets in B-cell lymphomas. Molecular systems biology, 4, 169.
}

\examples{
\dontrun{

#get example data
dataset<-GetExampleData("dataset")
class.labels<-GetExampleData("class.labels")
controlcharactor<-GetExampleData("controlcharactor")

#get the data for background set of edges
edgesbackgrand<-GetEdgesBackgrandData()

#Calculate the differential correlation score for edges
EdgeCorScore<-calEdgeCorScore(dataset, class.labels, controlcharactor, edgesbackgrand)

#print the top ten results to screen
EdgeCorScore[1:10]

#Each element is the differential correlation score of an edge and whose name correspond to
# the edge in the background set of edges.

}
}
\keyword{ file }