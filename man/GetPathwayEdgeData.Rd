\name{GetPathwayEdgeData}
\alias{GetPathwayEdgeData}
\title{Get the edge sets of pathways}
\description{
  Get the edge sets of pathways for the seven pathway database (KEGG; Biocarta; Reactome; NCI; SPIKE; HumanCyc; Panther).
}
\usage{
     GetPathwayEdgeData()
}

\details{
 The edge sets of pathways for the seven pathway database (KEGG; Biocarta; Reactome; NCI; SPIKE; HumanCyc; Panther) are obtained from the environment variable \code{\link{envData}}.
}

\value{
  A character vector, the length of this vector is the number of pathways.
}

\author{Junwei Han <hanjunwei1981@163.com>, Xinrui Shi<xinrui103@163.com> and Chunquan Li <lcqbio@163.com>}

\examples{
\dontrun{

#obtain the edge sets of pathways.
pathwayEdge.db<-GetPathwayEdgeData()

}
}

