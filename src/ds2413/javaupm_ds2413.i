%module javaupm_ds2413
%include "../upm.i"
%include "carrays.i"
%include "std_string.i"

%{
    #include "ds2413.hpp"
%}

%include "ds2413.hpp"
%array_class(char, charArray);

JAVA_JNI_LOADLIBRARY(javaupm_ds2413)
