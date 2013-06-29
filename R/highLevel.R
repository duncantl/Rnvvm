setClass("PTXCode", contains = "character")

generatePTX =
function(irCode, name = as.character(Sys.time()), options = character(), prog = createProgram(),
          isFile = !is(irCode, "AsIs") && (length(irCode) == 1 && file.exists(irCode)))
{
  if(isFile)
    irCode = readLines(irCode)
    
  if(length(irCode))
    irCode = paste(irCode, collapse = "\n")
  
  addModuleToProgram(prog, irCode, name)
  compileProgram(prog, options)
  new("PTXCode", getCompiledResult(prog, getCompiledResultSize(prog)))
}

if(FALSE) {
  # can't add this to Module
setAs("Module", "PTXCode",
       function(from) {
         generatePTX(showModule(from, TRUE), getName(from))
       })
}
