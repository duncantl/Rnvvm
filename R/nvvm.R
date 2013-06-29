addModuleToProgram <-
function (prog, buffer, name = "", size = nchar(buffer)) 
{
    buffer <- paste(buffer, collapse = "\n")
    ans = .Call("R_auto_nvvmAddModuleToProgram", as(prog, "nvvmProgram"), 
        as(buffer, "character"), as(size, "size_t"), as(name, 
            "character"))
    if (is(ans, "nvvmResult") && ans != 0) 
        raiseError(ans, "R_auto_nvvmAddModuleToProgram")
    ans
}
compileProgram <-
function (prog, options, numOptions = length(as(options, "character"))) 
{
    ans = .Call("R_auto_nvvmCompileProgram", as(prog, "nvvmProgram"), 
        as(numOptions, "integer"), as(options, "character"))
    if (is(ans, "nvvmResult") && ans != 0) 
        raiseError(ans, "R_auto_nvvmCompileProgram")
    ans
}
createProgram <-
function () 
{
    ans = .Call("R_auto_nvvmCreateProgram")
    if (is(ans, "nvvmResult") && ans != 0) 
        raiseError(ans, "R_auto_nvvmCreateProgram")
    ans
}
destroyProgram <-
function (prog) 
{
    ans = .Call("R_auto_nvvmDestroyProgram", as(prog, "nvvmProgram"))
    if (is(ans, "nvvmResult") && ans != 0) 
        raiseError(ans, "R_auto_nvvmDestroyProgram")
    ans
}
getCompiledResultSize <-
function (prog) 
{
    ans = .Call("R_auto_nvvmGetCompiledResultSize", as(prog, 
        "nvvmProgram"))
    if (is(ans, "nvvmResult") && ans != 0) 
        raiseError(ans, "R_auto_nvvmGetCompiledResultSize")
    ans
}
getErrorString <-
function (result) 
{
    ans = .Call("R_auto_nvvmGetErrorString", as(result, "nvvmResult"))
    if (is(ans, "nvvmResult") && ans != 0) 
        raiseError(ans, "R_auto_nvvmGetErrorString")
    ans
}
getProgramLogSize <-
function (prog) 
{
    ans = .Call("R_auto_nvvmGetProgramLogSize", as(prog, "nvvmProgram"))
    if (is(ans, "nvvmResult") && ans != 0) 
        raiseError(ans, "R_auto_nvvmGetProgramLogSize")
    ans
}
verifyProgram <-
function (prog, options, numOptions = length(as(options, "character"))) 
{
    ans = .Call("R_auto_nvvmVerifyProgram", as(prog, "nvvmProgram"), 
        as(numOptions, "integer"), as(options, "character"))
    if (is(ans, "nvvmResult") && ans != 0) 
        raiseError(ans, "R_auto_nvvmVerifyProgram")
    ans
}
version <-
function () 
{
    ans = .Call("R_auto_nvvmVersion")
    if (is(ans, "nvvmResult") && ans != 0) 
        raiseError(ans, "R_auto_nvvmVersion")
    ans
}
