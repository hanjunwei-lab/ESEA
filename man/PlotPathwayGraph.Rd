\name{PlotPathwayGraph}
\alias{PlotPathwayGraph}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot the pathway-result network diagram}
\description{
  Plot the pathway-result network diagram, the edges which contribute to the pathway enrichment score are marked with red.
}
\usage{
  PlotPathwayGraph(graph, margin = 0, vertex.label.cex = 0.6, vertex.label.font = 1, 
  vertex.size = 8, vertex.size2 = 6, vertex.shape = "rectangle", layout = layout.random,
  vertex.label.color = "black", edge.color = "dimgray", vertex.color = "#C1FFC1", 
  vertex.frame.color = "dimgray", axes = FALSE, xlab = "", ylab = "", sub = NULL, 
  main = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{graph}{ A dataframe of pathway result obtained from the ESEA.main function}
  \item{margin}{ A numeric. The value is usually between -0.5 and 0.5, which is able to zoom in or out a pathway graph. The default is 0.} 
  \item{vertex.label.cex}{ A numeric vector of node label size.}
  \item{vertex.label.font}{ A numeric vector of label font.} 
  \item{vertex.size}{ A numeric vector of Node size. See \code{\link{plot.igraph}}} 
  \item{vertex.size2}{ A numeric vector of Node size.}
  \item{vertex.shape}{ A vector of node shape. The default is graphics_type.} 
  \item{layout}{ A matrix of x-y coordinates with two dims. Determine the placement of the nodes for drawing a graph.The default is layout.random.}  
  \item{vertex.label.color}{ A vector of node label colors. The default is black.}    
  \item{vertex.color}{ A vector of node colors. The default is the KEGG node color.}  
  \item{vertex.frame.color}{ A vector of node frame color. The default is dimgray.}
  \item{edge.color}{ A vector of edge color. The default is dimgray.}
  \item{axes}{ A logical. whether to plot axes. The default is FALSE.}
  \item{xlab}{ A character string. The label of the horizontal axis. The default is the empty string.}
  \item{ylab}{ A character string. The label of the vertical axis. The default is the empty string.}
  \item{sub}{ A character string of subtitle. }
  \item{main}{ A character string of main title. }
  \item{...}{ The arguments passed to or from methods. See \code{\link{plot.igraph}} and see \code{\link{plot}}.}
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

#Plot the pathway-result network diagram, the edges which contribute to the ES are labeled with red.
PlotPathwayGraph(PathwayNetwork,layout=layout.random)

}
}
