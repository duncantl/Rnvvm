setClass("PTXCode", contains = "character")

generatePTX =
function(irCode, name = if(isFile) irCode else as.character(Sys.time()), options = character(), prog = createProgram(),
          isFile = !is(irCode, "AsIs") && (length(irCode) == 1 && file.exists(irCode)))
{
  name

  if(isFile)
    irCode = readLines(irCode, warn = FALSE)
    
  if(length(irCode))
    irCode = paste(irCode, collapse = "\n")
  
  addModuleToProgram(prog, irCode, name)
  tryCatch(compileProgram(prog, options),
            error = function(e) {
                  # if there is an error grab the log and add it to the error message.
	       msg = getProgramLog(prog)
	       stop(structure(simpleError(paste(e$message, msg, sep = "\n")), class = class(e)))
            })

  new("PTXCode", getCompiledResult(prog))
}

if(FALSE) {
  # can't add this here as Module is in Rllvm, not here.
setAs("Module", "PTXCode",
       function(from) {
         generatePTX(showModule(from, TRUE), getName(from))
       })
}
