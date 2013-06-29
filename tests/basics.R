library(Rnvvm)
library(RCUDA)

ll = readLines(system.file("sampleCode", "simple-gpu64.ll", package = "Rnvvm")

# corresponds to generatePTX() routine in simple.c in nvvm examples
prog = createProgram()
addModuleToProgram(prog, paste(ll, collapse = "\n"),  "bob")
compileProgram(prog, character())

n = getCompiledResultSize(prog)
o = getCompiledResult(prog, n)

cuGetContext()
mod = cuModuleLoadDataEx(o)

mod$simple
N = 512*32*32
ans = integer(N)
.gpu(mod$simple, ans, gridDim = c(512, 32), blockDim = 32)


