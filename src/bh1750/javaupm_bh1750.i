%module javaupm_bh1750
%include "../upm.i"
%include "std_string.i"


%include "bh1750_defs.h"
%include "bh1750.hpp"
%{
    #include "bh1750.hpp"
%}


JAVA_JNI_LOADLIBRARY(javaupm_bh1750)
