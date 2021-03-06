%module javaupm_itg3200
%include "../upm.i"

%{
    #include "itg3200.hpp"
%}

%typemap(jni) float* "jfloatArray"
%typemap(jstype) float* "float[]"
%typemap(jtype) float* "float[]"

%typemap(javaout) float* {
    return $jnicall;
}

%typemap(out) float *getRotation {
    $result = JCALL1(NewFloatArray, jenv, 3);
    JCALL4(SetFloatArrayRegion, jenv, $result, 0, 3, $1);
}


%typemap(jni) int16_t* "jshortArray"
%typemap(jstype) int16_t* "short[]"
%typemap(jtype) int16_t* "short[]"

%typemap(javaout) int16_t* {
    return $jnicall;
}

%typemap(out) int16_t *getRawValues {
    $result = JCALL1(NewShortArray, jenv, 3);
    JCALL4(SetShortArrayRegion, jenv, $result, 0, 3, (jshort*)$1);
}

%include "itg3200.hpp"

JAVA_JNI_LOADLIBRARY(javaupm_itg3200)