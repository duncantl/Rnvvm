getCompiledResult =
function(prog, bufLen = getCompiledResultSize(prog))
{
  .Call("R_auto_nvvmGetCompiledResult", as(prog, "nvvmProgram"), as.numeric(bufLen))
}

getProgramLog =
function(prog, bufLen = getProgramLogSize(prog))
{
  .Call("R_auto_nvvmGetProgramLog", as(prog, "nvvmProgram"), as.numeric(bufLen))
}
