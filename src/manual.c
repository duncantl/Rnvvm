#include "Rnvvm.h"

SEXP
R_auto_nvvmGetCompiledResult(SEXP r_prog,  SEXP r_bufLen)
{
    nvvmResult ans;
    nvvmProgram *prog = GET_REF(r_prog, nvvmProgram);
    int bufLen = INTEGER(r_bufLen)[0];
    char buf[bufLen];
    ans = nvvmGetCompiledResult( *prog, buf);
    if(ans)
       return(R_nvvmErrorInfo(ans));
    return(mkString(buf));
} 

SEXP
R_auto_nvvmGetProgramLog(SEXP r_prog,  SEXP r_bufLen)
{
    nvvmResult ans;
    nvvmProgram *prog = GET_REF(r_prog, nvvmProgram);
    int bufLen = INTEGER(r_bufLen)[0];
    char buf[bufLen];
    ans = nvvmGetProgramLog( *prog, buf);
    if(ans)
       return(R_nvvmErrorInfo(ans));
    return(mkString(buf));
} 


