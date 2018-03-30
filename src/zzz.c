#include <R.h>
#include <R_ext/Rdynload.h>
#include <Rversion.h>


void F77_SUB(subnetgen)(int *, int *, int *, int *,float *, float *, float *, int *);
void F77_SUB(clusters)(int *, int *, int *, int *);

static R_FortranMethodDef R_FortranDef[] = {
  {"subnetgen",  (DL_FUNC) &F77_SUB(subnetgen),  8, NULL},
  {"clusters",  (DL_FUNC) &F77_SUB(clusters),  4, NULL},
  {NULL, NULL, 0, NULL}
};


void R_init_NetGen(DllInfo *dll) {
  R_registerRoutines(dll, NULL, NULL, R_FortranDef, NULL);
#if defined(R_VERSION) && R_VERSION >= R_Version(3, 3, 0)
  R_useDynamicSymbols(dll, FALSE);
#endif
}
