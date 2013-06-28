#include <nvvm.h>
#include <Rdefines.h>
#include "Rconverters.h"

#undef GET_REF
#define GET_REF(val, type) (type) R_getNativeReference(val, #type, #type)

SEXP R_nvvmErrorInfo(nvvmResult val);

SEXP Renum_convert_nvvmResult(nvvmResult val);
