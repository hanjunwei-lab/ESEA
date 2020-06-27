\name{PlotGlobEdgeCorProfile}
\alias{PlotGlobEdgeCorProfile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot global edge correlation profile}
\description{
 plot global edge correlation profile for differential correlation scores of edges
}
\usage{
  PlotGlobEdgeCorProfile(EdgeCorScore)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{EdgeCorScore}{ A numeric vector. Each element is the differential correlation score of an edge.}
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

#calculate the differential correlation score for edges
EdgeCorScore<-calEdgeCorScore(dataset, class.labels, controlcharactor, edgesbackgrand)

#plot global edge correlation profile
PlotGlobEdgeCorProfile(EdgeCorScore)

}
}