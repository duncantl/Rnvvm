#include "Rnvvm.h"

SEXP R_auto_nvvmGetErrorString(SEXP r_result)
{
    SEXP r_ans = R_NilValue;
    nvvmResult result = (nvvmResult) INTEGER(r_result)[0];
    
    const char * ans;
    ans = nvvmGetErrorString(result);
    
    r_ans = mkString(ans) ;
    
    return(r_ans);
}
SEXP
R_auto_nvvmVersion()
{
    SEXP r_ans = R_NilValue;
    int major;
    int minor;
    nvvmResult ans;
    ans = nvvmVersion(& major, & minor);
    if(ans)
       return(R_nvvmErrorInfo(ans));
    PROTECT(r_ans = NEW_LIST(2));
    SET_VECTOR_ELT(r_ans, 0, ScalarInteger(major));
    SET_VECTOR_ELT(r_ans, 1, ScalarInteger(minor));
    UNPROTECT(1);
    return(r_ans);
}
SEXP
R_auto_nvvmCreateProgram()
{
    SEXP r_ans = R_NilValue;
    nvvmProgram prog;
    nvvmResult ans;
    ans = nvvmCreateProgram(& prog);
    if(ans)
       return(R_nvvmErrorInfo(ans));
    r_ans = R_createRef(prog, "nvvmProgram") ;
    return(r_ans);
}
SEXP R_auto_nvvmDestroyProgram(SEXP r_prog)
{
    SEXP r_ans = R_NilValue;
    nvvmProgram * prog = GET_REF(r_prog, nvvmProgram );
    
    nvvmResult ans;
    ans = nvvmDestroyProgram(prog);
    
    r_ans = Renum_convert_nvvmResult(ans) ;
    
    return(r_ans);
}
SEXP R_auto_nvvmAddModuleToProgram(SEXP r_prog, SEXP r_buffer, SEXP r_size, SEXP r_name)
{
    SEXP r_ans = R_NilValue;
    nvvmProgram prog = GET_REF(r_prog, nvvmProgram);
    const char * buffer = CHAR(STRING_ELT(r_buffer, 0));
    size_t size = REAL(r_size)[0];
    const char * name = CHAR(STRING_ELT(r_name, 0));
    
    nvvmResult ans;
    ans = nvvmAddModuleToProgram(prog, buffer, size, name);
    
    r_ans = Renum_convert_nvvmResult(ans) ;
    
    return(r_ans);
}
SEXP R_auto_nvvmCompileProgram(SEXP r_prog, SEXP r_numOptions, SEXP r_options)
{
    SEXP r_ans = R_NilValue;
    nvvmProgram prog = GET_REF(r_prog, nvvmProgram);
    int numOptions = INTEGER(r_numOptions)[0];
    const char ** options = getCharArrayPtr(r_options);
    
    nvvmResult ans;
    ans = nvvmCompileProgram(prog, numOptions, options);
    
    r_ans = Renum_convert_nvvmResult(ans) ;
    
    return(r_ans);
}
SEXP R_auto_nvvmVerifyProgram(SEXP r_prog, SEXP r_numOptions, SEXP r_options)
{
    SEXP r_ans = R_NilValue;
    nvvmProgram prog = GET_REF(r_prog, nvvmProgram);
    int numOptions = INTEGER(r_numOptions)[0];
    const char ** options = getCharArrayPtr(r_options);
    
    nvvmResult ans;
    ans = nvvmVerifyProgram(prog, numOptions, options);
    
    r_ans = Renum_convert_nvvmResult(ans) ;
    
    return(r_ans);
}
SEXP
R_auto_nvvmGetCompiledResultSize(SEXP r_prog)
{
    SEXP r_ans = R_NilValue;
    size_t bufferSizeRet;
    nvvmProgram prog = GET_REF(r_prog, nvvmProgram);
    nvvmResult ans;
    ans = nvvmGetCompiledResultSize( prog, & bufferSizeRet);
    if(ans)
       return(R_nvvmErrorInfo(ans));
    r_ans = ScalarReal(bufferSizeRet) ;
    return(r_ans);
}
SEXP
R_auto_nvvmGetProgramLogSize(SEXP r_prog)
{
    SEXP r_ans = R_NilValue;
    size_t bufferSizeRet;
    nvvmProgram prog = GET_REF(r_prog, nvvmProgram);
    nvvmResult ans;
    ans = nvvmGetProgramLogSize( prog, & bufferSizeRet);
    if(ans)
       return(R_nvvmErrorInfo(ans));
    r_ans = ScalarReal(bufferSizeRet) ;
    return(r_ans);
}
