#include "Rnvvm.h"
SEXP
Renum_convert_nvvmResult(nvvmResult val)
{
const char *elName;
switch(val) {
   case NVVM_SUCCESS:
	elName = "NVVM_SUCCESS";
	break;
   case NVVM_ERROR_OUT_OF_MEMORY:
	elName = "NVVM_ERROR_OUT_OF_MEMORY";
	break;
   case NVVM_ERROR_PROGRAM_CREATION_FAILURE:
	elName = "NVVM_ERROR_PROGRAM_CREATION_FAILURE";
	break;
   case NVVM_ERROR_IR_VERSION_MISMATCH:
	elName = "NVVM_ERROR_IR_VERSION_MISMATCH";
	break;
   case NVVM_ERROR_INVALID_INPUT:
	elName = "NVVM_ERROR_INVALID_INPUT";
	break;
   case NVVM_ERROR_INVALID_PROGRAM:
	elName = "NVVM_ERROR_INVALID_PROGRAM";
	break;
   case NVVM_ERROR_INVALID_IR:
	elName = "NVVM_ERROR_INVALID_IR";
	break;
   case NVVM_ERROR_INVALID_OPTION:
	elName = "NVVM_ERROR_INVALID_OPTION";
	break;
   case NVVM_ERROR_NO_MODULE_IN_PROGRAM:
	elName = "NVVM_ERROR_NO_MODULE_IN_PROGRAM";
	break;
   case NVVM_ERROR_COMPILATION:
	elName = "NVVM_ERROR_COMPILATION";
	break;
   default:
	elName = "?";
}
return(R_makeEnumValue(val, elName, "nvvmResult"));
}
