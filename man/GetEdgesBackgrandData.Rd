\name{GetEdgesBackgrandData}
\alias{GetEdgesBackgrandData}
\title{Get the data for background set of edges}
\description{
  Get the data for background set of edges.
}
\usage{
  GetEdgesBackgrandData()
}


\details{
  The data for background set of edges are obtained from the environment variable \code{\link{envData}}.
}

\value{
  A marix which deposits the data of background set of edges. Each row includes a pair of genes which correspond to an edge.   
}

\author{Junwei Han <hanjunwei1981@163.com>, Xinrui Shi<xinrui103@163.com> and Chunquan Li <lcqbio@163.com>}



\examples{
\dontrun{

#obtain the data for background set of edges.
edgesbackgrand<-GetEdgesBackgrandData()

}
}

