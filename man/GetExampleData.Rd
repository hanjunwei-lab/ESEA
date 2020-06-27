\name{GetExampleData}
\alias{GetExampleData}
\title{Get the example data}
\description{
  Get the example data.
}
\usage{
  GetExampleData(exampleData)
  
}

\arguments{
  \item{exampleData}{ A character string, must be one of "dataset", "class.labels" and "controlcharactor".}
}

\details{
  The function GetExampleData(exampleData="dataset") obtains gene expression dataset from the environment variable \code{\link{envData}}.
  
  The function GetExampleData(exampleData="class.labels") obtains class labels from the environment variable \code{\link{envData}}.
  
  The function GetExampleData(exampleData="controlcharactor") obtains control sample label from the environment variable \code{\link{envData}}.
}

\author{Junwei Han <hanjunwei1981@163.com>, Xinrui Shi<xinrui103@163.com> and Chunquan Li <lcqbio@163.com>}

\examples{
\dontrun{

#obtain the gene expression dataset.
dataset<-GetExampleData(exampleData="dataset")
dataset[1:10,]

#obtain the class labels.
class.labels<-GetExampleData(exampleData="class.labels")

#obtain the control sample label.
controlcharactor<-GetExampleData(exampleData="controlcharactor")

}
}
\keyword{ file }
