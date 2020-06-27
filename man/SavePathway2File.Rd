\name{SavePathway2File}
\alias{SavePathway2File}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Save a pathway-result network to a file which can be input to the Cytoscape software}
\description{
  Save a pathway-result network to a file which can be input to the Cytoscape software. 
}
\usage{
  SavePathway2File(network, layout = layout.random, name = "network", file = "Graph")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{network}{ A dataframe of pathway-result network obtained from the ESEA.main function}
  \item{layout}{ A matrix of x-y coordinates with two dims. Determine the placement of the nodes for drawing a graph.The default is "layout.random".}
  \item{name}{ The required variables for XGMML.destription.  The default is "network"}
  \item{file}{ A character string for file name. The default is "Graph"}
}

\author{
Junwei Han <hanjunwei1981@163.com>, Xinrui Shi<xinrui103@163.com> and Chunquan Li <lcqbio@163.com>
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
EdgeCorScore<-calEdgeCorScore(dataset, class.labels, controlcharactor,edgesbackgrand)

#identify dysregulated pathways by using the function ESEA.Main
#Results<-ESEA.Main(EdgeCorScore,pathwayEdge.db)
Results<-GetExampleData("PathwayResult")

#obtain the detail results of genes for a significant pathway
PathwayNetwork<-Results[[2]][[1]]

#save the pathway-result network to a file which can be input to the Cytoscape software. 
SavePathway2File(PathwayNetwork,layout=layout.circle,file="Graph")
  			
}
}