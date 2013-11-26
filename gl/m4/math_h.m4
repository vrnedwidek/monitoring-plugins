# math_h.m4 serial 9
dnl Copyright (C) 2007-2008 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

AC_DEFUN([gl_MATH_H],
[
  AC_REQUIRE([gl_MATH_H_DEFAULTS])
  gl_CHECK_NEXT_HEADERS([math.h])
])

AC_DEFUN([gl_MATH_MODULE_INDICATOR],
[
  dnl Use AC_REQUIRE here, so that the default settings are expanded once only.
  AC_REQUIRE([gl_MATH_H_DEFAULTS])
  GNULIB_[]m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./-],[ABCDEFGHIJKLMNOPQRSTUVWXYZ___])=1
])

AC_DEFUN([gl_MATH_H_DEFAULTS],
[
  GNULIB_CEILF=0;    AC_SUBST([GNULIB_CEILF])
  GNULIB_CEILL=0;    AC_SUBST([GNULIB_CEILL])
  GNULIB_FLOORF=0;   AC_SUBST([GNULIB_FLOORF])
  GNULIB_FLOORL=0;   AC_SUBST([GNULIB_FLOORL])
  GNULIB_FREXP=0;    AC_SUBST([GNULIB_FREXP])
  GNULIB_FREXPL=0;   AC_SUBST([GNULIB_FREXPL])
  GNULIB_ISFINITE=0; AC_SUBST([GNULIB_ISFINITE])
  GNULIB_LDEXPL=0;   AC_SUBST([GNULIB_LDEXPL])
  GNULIB_MATHL=0;    AC_SUBST([GNULIB_MATHL])
  GNULIB_ROUND=0;    AC_SUBST([GNULIB_ROUND])
  GNULIB_ROUNDF=0;   AC_SUBST([GNULIB_ROUNDF])
  GNULIB_ROUNDL=0;   AC_SUBST([GNULIB_ROUNDL])
  GNULIB_SIGNBIT=0;  AC_SUBST([GNULIB_SIGNBIT])
  GNULIB_TRUNC=0;    AC_SUBST([GNULIB_TRUNC])
  GNULIB_TRUNCF=0;   AC_SUBST([GNULIB_TRUNCF])
  GNULIB_TRUNCL=0;   AC_SUBST([GNULIB_TRUNCL])
  dnl Assume proper GNU behavior unless another module says otherwise.
  HAVE_DECL_ACOSL=1;           AC_SUBST([HAVE_DECL_ACOSL])
  HAVE_DECL_ASINL=1;           AC_SUBST([HAVE_DECL_ASINL])
  HAVE_DECL_ATANL=1;           AC_SUBST([HAVE_DECL_ATANL])
  HAVE_DECL_COSL=1;            AC_SUBST([HAVE_DECL_COSL])
  HAVE_DECL_EXPL=1;            AC_SUBST([HAVE_DECL_EXPL])
  HAVE_DECL_FREXPL=1;          AC_SUBST([HAVE_DECL_FREXPL])
  HAVE_DECL_LDEXPL=1;          AC_SUBST([HAVE_DECL_LDEXPL])
  HAVE_DECL_LOGL=1;            AC_SUBST([HAVE_DECL_LOGL])
  HAVE_DECL_SINL=1;            AC_SUBST([HAVE_DECL_SINL])
  HAVE_DECL_SQRTL=1;           AC_SUBST([HAVE_DECL_SQRTL])
  HAVE_DECL_TANL=1;            AC_SUBST([HAVE_DECL_TANL])
  HAVE_DECL_TRUNC=1;           AC_SUBST([HAVE_DECL_TRUNC])
  HAVE_DECL_TRUNCF=1;          AC_SUBST([HAVE_DECL_TRUNCF])
  HAVE_DECL_TRUNCL=1;          AC_SUBST([HAVE_DECL_TRUNCL])
  REPLACE_CEILF=0;             AC_SUBST([REPLACE_CEILF])
  REPLACE_CEILL=0;             AC_SUBST([REPLACE_CEILL])
  REPLACE_FLOORF=0;            AC_SUBST([REPLACE_FLOORF])
  REPLACE_FLOORL=0;            AC_SUBST([REPLACE_FLOORL])
  REPLACE_FREXP=0;             AC_SUBST([REPLACE_FREXP])
  REPLACE_FREXPL=0;            AC_SUBST([REPLACE_FREXPL])
  REPLACE_ISFINITE=0;          AC_SUBST([REPLACE_ISFINITE])
  REPLACE_LDEXPL=0;            AC_SUBST([REPLACE_LDEXPL])
  REPLACE_ROUND=0;             AC_SUBST([REPLACE_ROUND])
  REPLACE_ROUNDF=0;            AC_SUBST([REPLACE_ROUNDF])
  REPLACE_ROUNDL=0;            AC_SUBST([REPLACE_ROUNDL])
  REPLACE_SIGNBIT=0;           AC_SUBST([REPLACE_SIGNBIT])
  REPLACE_SIGNBIT_USING_GCC=0; AC_SUBST([REPLACE_SIGNBIT_USING_GCC])
])
