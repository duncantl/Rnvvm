\name{getErrorString}
\alias{getErrorString}
\title{Get the libNVVM string corresponding to an nvvmResult status value}
\description{
  This function allows us to retrieve a string describing the general
  nature of a particular type of error in libNVVM.
  There are various different types of errors, indicated by the
  (non-exported) \code{nvvmResult} enumeration type.
  When we get an error from a \code{libNVVM} function,
  this error message is contained in the error object.
}
\usage{
getErrorString(result)
}
\arguments{
  \item{result}{the \code{nvvmResult} value}
}
\value{
  A string.
}
\references{
libNVVM documentation
}
\author{
Duncan Temple Lang
}


\seealso{
\code{\link{compileProgram}} and related functions
}
\examples{
sapply(Rnvvm:::nvvmResultValues, getErrorString)
}
\keyword{programming}
