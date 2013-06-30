\name{createProgram}
\alias{createProgram}
\alias{verifyProgram}
\alias{compileProgram}
\alias{getCompiledResultSize}
\alias{getCompiledResult}
\alias{getProgramLog}
\alias{getProgramLogSize}
\alias{addModuleToProgram}
\title{Functions to process a libNVVM program}
\description{
  These functions allow us to use libNVVM to convert
  LLVM Intermediate Representation (IR) code to PTX
  code that we can use with CUDA.
  These allow us to create a program object,
  to add IR code to the program and to compile the code to PTX.
  These are the primitives building blocks. \code{\link{generatePTX}}
  uses these to implement the full sequence of converting IR code to PTX.
  
  The functions allow us to both compile the PTX and also
  to retrieve errors about the compilation (\code{getProgramLog}).
}
\usage{
createProgram()
addModuleToProgram(prog, buffer, name = "", size = nchar(buffer))
compileProgram(prog, options, numOptions = length(as(options, "character"))) 
verifyProgram(prog, options, numOptions = length(as(options, "character")))
getCompiledResultSize(prog)
getProgramLogSize(prog)
}
\arguments{
  \item{prog}{a \code{nvvmProgram} object, created with \code{createProgram}.}
  \item{buffer}{a character vector containing the IR code to be
    converted to PTX}
  \item{name}{the name to use for the PTX module name}
  \item{size}{the number of bytes in the bufer}
  \item{options}{a character vector }
  \item{numOptions}{this should never be specified by the caller}
}
\value{
  Each of the functions return differen information.
  \code{verifyProgram} checks whether function
}
\references{
  libNVVM
}
\author{
Duncan Temple Lang
}

\seealso{
  \code{\link{generatePTX}}
}
\examples{
f = system.file("sampleCode", "simple-gpu64.ll", package = "Rnvvm")
ir = readLines(f)
prog = createProgram()
addModuleToProgram(prog, ir, "example")
compileProgram(prog, character())
n = getCompiledResultSize(prog)
ptx = getCompiledResult(prog, n)
}
\keyword{programming}
\concept{compilation}

