library(Rnvvm)

version()
sapply(Rnvvm:::nvvmResultValues, getErrorString)
p = createProgram()
destroyProgram(p)
