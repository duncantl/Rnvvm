#include <nvvm.h>
#include <Rdefines.h>


/* We define R_createRef() to call our own version and then arrange to add a finalizer.
   This is for nvvmProgram so it is garbage collected automatically.
   We could have registered the finalizer in R code, but this is a little more direct
   in that we don't have to modify how the code is generated. But we could and might do that.
   The order here is important to avoid RConverters.h defining R_createRef first.
 */
SEXP R_createNvvmReference(void *ptr, const char * const className, const char * tag);
#define R_createRef(val, type) R_createNvvmReference(val, type, type)

#include "RConverters.h"

#undef GET_REF
#define GET_REF(val, type) (type) R_getNativeReference(val, #type, #type)

SEXP R_nvvmErrorInfo(nvvmResult val);

SEXP Renum_convert_nvvmResult(nvvmResult val);
