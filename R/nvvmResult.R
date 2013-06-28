setClass("nvvmResult", contains = "EnumValue")

nvvmResultValues = structure(c(0L, 1L, 2L, 3L, 4L, 5L, 6L, 7L, 8L, 9L), .Names = c('NVVM_SUCCESS', 'NVVM_ERROR_OUT_OF_MEMORY', 'NVVM_ERROR_PROGRAM_CREATION_FAILURE', 'NVVM_ERROR_IR_VERSION_MISMATCH', 'NVVM_ERROR_INVALID_INPUT', 'NVVM_ERROR_INVALID_PROGRAM', 'NVVM_ERROR_INVALID_IR', 'NVVM_ERROR_INVALID_OPTION', 'NVVM_ERROR_NO_MODULE_IN_PROGRAM', 'NVVM_ERROR_COMPILATION'))

`NVVM_SUCCESS` = GenericEnumValue('NVVM_SUCCESS', 0L, 'nvvmResult')
`NVVM_ERROR_OUT_OF_MEMORY` = GenericEnumValue('NVVM_ERROR_OUT_OF_MEMORY', 1L, 'nvvmResult')
`NVVM_ERROR_PROGRAM_CREATION_FAILURE` = GenericEnumValue('NVVM_ERROR_PROGRAM_CREATION_FAILURE', 2L, 'nvvmResult')
`NVVM_ERROR_IR_VERSION_MISMATCH` = GenericEnumValue('NVVM_ERROR_IR_VERSION_MISMATCH', 3L, 'nvvmResult')
`NVVM_ERROR_INVALID_INPUT` = GenericEnumValue('NVVM_ERROR_INVALID_INPUT', 4L, 'nvvmResult')
`NVVM_ERROR_INVALID_PROGRAM` = GenericEnumValue('NVVM_ERROR_INVALID_PROGRAM', 5L, 'nvvmResult')
`NVVM_ERROR_INVALID_IR` = GenericEnumValue('NVVM_ERROR_INVALID_IR', 6L, 'nvvmResult')
`NVVM_ERROR_INVALID_OPTION` = GenericEnumValue('NVVM_ERROR_INVALID_OPTION', 7L, 'nvvmResult')
`NVVM_ERROR_NO_MODULE_IN_PROGRAM` = GenericEnumValue('NVVM_ERROR_NO_MODULE_IN_PROGRAM', 8L, 'nvvmResult')
`NVVM_ERROR_COMPILATION` = GenericEnumValue('NVVM_ERROR_COMPILATION', 9L, 'nvvmResult')

 setAs("character", "nvvmResult", function(from) asEnumValue(from, nvvmResultValues, "nvvmResult", prefix = NA) )
 setAs("integer", "nvvmResult", function(from) asEnumValue(from, nvvmResultValues, "nvvmResult", prefix = NA) )
 setAs("numeric", "nvvmResult", function(from) asEnumValue(from, nvvmResultValues, "nvvmResult", prefix = NA) )
