\name{generatePTX}
\alias{generatePTX}
\title{Convert LLVM IR code to PTX}
\description{
  This function converts code in LLVM's IR format
  to PTX using libNVVM.
  The function can read the IR code from a file or have it be passed
  directly as content.
}
\usage{
generatePTX(irCode, 
            name = if(isFile) 
                      irCode 
                   else 
                      as.character(Sys.time()),
            options = character(),
            prog = createProgram(),
           isFile = !is(irCode, "AsIs") && (length(irCode) == 1 && file.exists(irCode)))
}

\arguments{
  \item{irCode}{the name of the file containing the IR code or a
    character vector containing the IR code itself.
    If this is the code itself, we can indicate this via the \code{isFile}
   parameter or by passing the content within a call to \code{I}.}
  \item{name}{the name of the module/program}
  \item{options}{a character vector of options passed to
    \code{\link{compileProgram}}.
   The possible options are described in \code{\link{compileProgram}}.}
  \item{prog}{a \code{nvvmProgram} object used to compile the
  code. Often we are compiling a single block of code and so can use a
  new program object. When we want to combine code from different
  translation units/modules, we can create a program with
  \code{\link{createProgram}}
  and pass this object explicitly.
  }
  \item{isFile}{a logical value that allows the caller to explicitly
  indicate whether the value of \code{irCode} is the name of a file or
  the code itself.}
}
\value{
  A string (character vector with one element) containing the PTX code.
  This has a class named \code{PTXCode}.
}
\references{
  libNVVM documentation
}
\author{
Duncan Temple Lang
}

\seealso{
  \code{\link{createProgram}}
}
\examples{
f = system.file("sampleCode", "simple-gpu64.ll", package = "Rnvvm")
ptx = generatePTX(f, isFile = TRUE)
cat(ptx)
}
\keyword{programming}
\concept{compilation}