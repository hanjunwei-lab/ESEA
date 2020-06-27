\name{PlotRunEnrichment}
\alias{PlotRunEnrichment}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot running Edge enrichment score}
\description{
  Plot running edge enrichment score for the pathway result
}
\usage{
  PlotRunEnrichment(EdgeCorScore, PathwayResult, weighted.score.type = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{EdgeCorScore}{ A numeric vector. Each element is the differential correlation score of an edge.}
  \item{PathwayResult}{ A list of pathway result obtained from the ESEA.main function}
  \item{weighted.score.type}{A value. Edge enrichment correlation-based weighting: 0=no weight, 1=standard weigth, 2 = over-weigth. The default value is 1}
}

\author{Junwei Han <hanjunwei1981@163.com>, Xinrui Shi<xinrui103@163.com> and Chunquan Li <lcqbio@163.com>}

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
EdgeCorScore<-calEdgeCorScore(dataset, class.labels, controlcharactor,edgesbackgrand)

#identify dysregulated pathways by using the function ESEA.Main
#Results<-ESEA.Main(EdgeCorScore,pathwayEdge.db)
Results<-GetExampleData("PathwayResult")

#obtain the detail results of genes for a significant pathway
PathwayResult<-Results[[2]][1]

#Plot running edge enrichment score for the pathway result
PlotRunEnrichment(EdgeCorScore,PathwayResult,weighted.score.type = 1)

}
}
