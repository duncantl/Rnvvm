Rnvvm
=====

R interface to libNVVM for working with PTX and LLVM for CUDA

To work with the git repository, you will need to create symbolic
links to RConverters.c and RConverters.h from the RAutoGenRunTime
package or repository.
You might do something like

```shell
git clone https://github.com/duncantl/Rnvvm
git clone https://github.com/omegahat/RAutoGenRunTime

cd Rnvvm/src
ln -s ../../RAutoGenRunTime/src/RConverters.c .
ln -s ../../RAutoGenRunTime/inst/include/RConverters.h .
```


See the index.html file for information about installing the package.

