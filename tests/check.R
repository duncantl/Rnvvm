library(Rnvvm)

version()
sapply(Rnvvm:::nvvmResultValues, getErrorString)
p = createProgram()
rm(p)  # garbage collected via C routine nvvmDestroyProgram
