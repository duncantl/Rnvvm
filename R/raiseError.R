# This should probably go in RAutoGenRunTime
# and allow the caller to specify the vector of values, i.e. the enums.
raiseError =
function(status, msg = character(), ...)
{
 i =  match(status, nvvmResultValues)
 type = names(nvvmResultValues)[i]
 e = simpleError(paste(c(msg, names(status), "(", type, ")"), collapse = " "), ...)
 class(e) = c(type, class(e))
 stop(e)
}
