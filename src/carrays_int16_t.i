// From the SWIG documentation:
//		Unlike #include, %include includes each file once
//		(and will not reload the file on subsequent %include declarations).
//		Therefore, it is not necessary to use include-guards in SWIG interfaces. 
// So you can include this file and .i files for other C types
%include "stdint.i"
%include "carrays.i"
%array_class(int16_t, int16Array);

// Adding these typemaps because SWIG is converting uint8, uint16, and uint32 into a short by default
// This forces SWIG to convert it correctly

#if (SWIG_JAVASCRIPT_V8)
%typemap(in) int16_t * {
  void *argp = 0 ;
  int res = SWIG_ConvertPtr($input, &argp, SWIGTYPE_p_int16Array, 0 |  0 );
  if (!SWIG_IsOK(res)) {
    SWIG_exception_fail(SWIG_ArgError(res), "failed to convert input to int16 *");
  }
  $1 = (int16_t *)(argp);
}

/*$input (non-pointer) is a v8::object, which inherits from v8::value */
%typemap(in) int16_t {
  int ecode2 = 0 ;
  if (($input)->IsInt16())
    $1 = ($input)->int16Value();
  else
    SWIG_exception_fail(SWIG_ArgError(ecode2), "failed to convert uint32");
}
#endif

#if (SWIGPYTHON)
%typemap(in) int16_t * {
  void *argp = 0 ;
  int res = SWIG_ConvertPtr($input, &argp, SWIGTYPE_p_int16Array, 0 |  0 );
  if (!SWIG_IsOK(res)) {
    SWIG_exception_fail(SWIG_ArgError(res), "failed to convert input to int16 *");
  }
  $1 = reinterpret_cast< int16_t * >(argp);
}

/*$input (non-pointer) */
%typemap(in) int16_t {
  long v;
  int res = SWIG_AsVal_long ($input, &v);
  if (SWIG_IsOK(res)) {
    $1 = PyInt_AsLong($input);
  }
  else {
    SWIG_exception_fail(SWIG_ArgError(res), "failed to convert int16");
  }
}

%typemap(out) int16_t* {
  $result = SWIG_NewPointerObj(SWIG_as_voidptr(result), SWIGTYPE_p_int16Array, 0 |  0 );
}
#endif
