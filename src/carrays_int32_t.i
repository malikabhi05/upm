// From the SWIG documentation:
//		Unlike #include, %include includes each file once
//		(and will not reload the file on subsequent %include declarations).
//		Therefore, it is not necessary to use include-guards in SWIG interfaces. 
// So you can include this file and .i files for other C types
%include "stdint.i"
%include "carrays.i"
%array_class(int32_t, int32Array);

// Adding these typemaps because SWIG is converting uint8, uint16, and uint32 into a short by default
// This forces SWIG to convert it correctly

#if (SWIG_JAVASCRIPT_V8)
%typemap(in) int32_t * {
  void *argp = 0 ;
  int res = SWIG_ConvertPtr($input, &argp, SWIGTYPE_p_int32Array, 0 |  0 );
  if (!SWIG_IsOK(res)) {
    SWIG_exception_fail(SWIG_ArgError(res), "failed to convert input to int32 *");
  }
  $1 = (int32_t *)(argp);
}

/*$input (non-pointer) is a v8::object, which inherits from v8::value */
%typemap(in) int32_t {
  int ecode2 = 0 ;
  if (($input)->IsInt32())
    $1 = ($input)->int32Value();
  else
    SWIG_exception_fail(SWIG_ArgError(ecode2), "failed to convert int32");
}
#endif

#if (SWIGPYTHON)
%typemap(in) int32_t * {
  void *argp = 0 ;
  int res = SWIG_ConvertPtr($input, &argp, SWIGTYPE_p_int32Array, 0 |  0 );
  if (!SWIG_IsOK(res)) {
    SWIG_exception_fail(SWIG_ArgError(res), "failed to convert input to int32 *");
  }
  $1 = reinterpret_cast< int32_t * >(argp);
}

/*$input (non-pointer) */
%typemap(in) int32_t {
  long v;
  int res = SWIG_AsVal_long ($input, &v);
  if (SWIG_IsOK(res)) {
    $1 = PyInt_AsLong($input);
  }
  else {
    SWIG_exception_fail(SWIG_ArgError(res), "failed to convert int32");
  }
}

%typemap(out) int32_t* {
  $result = SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_int32Array, 0 |  0 );
}
#endif
