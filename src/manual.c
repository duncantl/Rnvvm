#include "Rnvvm.h"

SEXP
R_auto_nvvmGetCompiledResult(SEXP r_prog,  SEXP r_bufLen)
{
    nvvmResult ans;
    nvvmProgram prog = GET_REF(r_prog, nvvmProgram);
    size_t bufLen = REAL(r_bufLen)[0];
    char buf[bufLen];
    ans = nvvmGetCompiledResult( prog, buf);
    if(ans)
       return(R_nvvmErrorInfo(ans));
    return(mkString(buf));
} 

SEXP
R_auto_nvvmGetProgramLog(SEXP r_prog,  SEXP r_bufLen)
{
    nvvmResult ans;
    nvvmProgram prog = GET_REF(r_prog, nvvmProgram);
    size_t bufLen = REAL(r_bufLen)[0];
    char buf[bufLen];
    ans = nvvmGetProgramLog( prog, buf);
    if(ans)
       return(R_nvvmErrorInfo(ans));
    return(mkString(buf));
} 


SEXP
R_nvvmErrorInfo(nvvmResult status)
{
    SEXP ans;
    PROTECT(ans = ScalarInteger(status));
    SET_CLASS(ans, mkString("nvvmResult"));
    SET_NAMES(ans, nvvmGetErrorString(status));
    UNPROTECT(1);
    return(ans);  
}


void
R_nvvmProgramDestroy(SEXP robj)
{
    nvvmProgram prog = (nvvmProgram) R_ExternalPtrAddr(robj);
    if(prog) {
	nvvmDestroyProgram(&prog);
    }
}


SEXP 
R_createNvvmReference(void *ptr, const char * const className, const char * tag)
{
    SEXP ans = R_createReference(ptr, className, tag);
    if(strcmp(className, "nvvmProgram") == 0) {
	PROTECT(ans);
	SEXP ref = GET_SLOT(ans, Rf_install("ref"));
	R_RegisterCFinalizer(ref, R_nvvmProgramDestroy);
	UNPROTECT(1);
    }
    return(ans);
}
