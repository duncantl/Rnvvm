getCompiledResult =
function(prog, bufLen = 10000L)  
{
  .Call("R_auto_nvvmGetCompiledResult", as(prog, "nvvmProgram"), as.numeric(bufLen))
}

getProgramLog =
function(prog, bufLen = 10000L)  
{
  .Call("R_auto_nvvmGetProgramLog", as(prog, "nvvmProgram"), as.numeric(bufLen))
}
