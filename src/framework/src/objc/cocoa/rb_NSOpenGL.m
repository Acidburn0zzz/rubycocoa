#import "osx_ruby.h"
#import "ocdata_conv.h"
#import <AppKit/AppKit.h>

extern VALUE oc_err_new (const char* fname, NSException* nsexcp);
extern void rbarg_to_nsarg(VALUE rbarg, int octype, void* nsarg, const char* fname, id pool, int index);
extern VALUE nsresult_to_rbresult(int octype, const void* nsresult, const char* fname, id pool);
static const int VA_MAX = 4;


  /**** functions ****/
// void NSOpenGLSetOption ( NSOpenGLGlobalOption pname , long param );
static VALUE
osx_NSOpenGLSetOption(VALUE mdl, VALUE a0, VALUE a1)
{

  NSOpenGLGlobalOption ns_a0;
  long ns_a1;

  VALUE excp = Qnil;
  VALUE rb_result;
  id pool = [[NSAutoreleasePool alloc] init];
  /* a0 */
  rbarg_to_nsarg(a0, _C_INT, &ns_a0, "NSOpenGLSetOption", pool, 0);
  /* a1 */
  rbarg_to_nsarg(a1, _C_LNG, &ns_a1, "NSOpenGLSetOption", pool, 1);

NS_DURING
  NSOpenGLSetOption(ns_a0, ns_a1);
NS_HANDLER
  excp = oc_err_new ("NSOpenGLSetOption", localException);
NS_ENDHANDLER
  if (excp != Qnil) {
    [pool release];
    rb_exc_raise (excp);
    return Qnil;
  }

  rb_result = Qnil;
  [pool release];
  return rb_result;
}

// void NSOpenGLGetOption ( NSOpenGLGlobalOption pname , long * param );
static VALUE
osx_NSOpenGLGetOption(VALUE mdl, VALUE a0, VALUE a1)
{

  NSOpenGLGlobalOption ns_a0;
  long * ns_a1;

  VALUE excp = Qnil;
  VALUE rb_result;
  id pool = [[NSAutoreleasePool alloc] init];
  /* a0 */
  rbarg_to_nsarg(a0, _C_INT, &ns_a0, "NSOpenGLGetOption", pool, 0);
  /* a1 */
  rbarg_to_nsarg(a1, _PRIV_C_PTR, &ns_a1, "NSOpenGLGetOption", pool, 1);

NS_DURING
  NSOpenGLGetOption(ns_a0, ns_a1);
NS_HANDLER
  excp = oc_err_new ("NSOpenGLGetOption", localException);
NS_ENDHANDLER
  if (excp != Qnil) {
    [pool release];
    rb_exc_raise (excp);
    return Qnil;
  }

  rb_result = Qnil;
  [pool release];
  return rb_result;
}

// void NSOpenGLGetVersion ( long * major , long * minor );
static VALUE
osx_NSOpenGLGetVersion(VALUE mdl, VALUE a0, VALUE a1)
{

  long * ns_a0;
  long * ns_a1;

  VALUE excp = Qnil;
  VALUE rb_result;
  id pool = [[NSAutoreleasePool alloc] init];
  /* a0 */
  rbarg_to_nsarg(a0, _PRIV_C_PTR, &ns_a0, "NSOpenGLGetVersion", pool, 0);
  /* a1 */
  rbarg_to_nsarg(a1, _PRIV_C_PTR, &ns_a1, "NSOpenGLGetVersion", pool, 1);

NS_DURING
  NSOpenGLGetVersion(ns_a0, ns_a1);
NS_HANDLER
  excp = oc_err_new ("NSOpenGLGetVersion", localException);
NS_ENDHANDLER
  if (excp != Qnil) {
    [pool release];
    rb_exc_raise (excp);
    return Qnil;
  }

  rb_result = Qnil;
  [pool release];
  return rb_result;
}

void init_NSOpenGL(VALUE mOSX)
{
  /**** enums ****/
  rb_define_const(mOSX, "NSOpenGLGOFormatCacheSize", INT2NUM(NSOpenGLGOFormatCacheSize));
  rb_define_const(mOSX, "NSOpenGLGOClearFormatCache", INT2NUM(NSOpenGLGOClearFormatCache));
  rb_define_const(mOSX, "NSOpenGLGORetainRenderers", INT2NUM(NSOpenGLGORetainRenderers));
  rb_define_const(mOSX, "NSOpenGLGOResetLibrary", INT2NUM(NSOpenGLGOResetLibrary));
  rb_define_const(mOSX, "NSOpenGLPFAAllRenderers", INT2NUM(NSOpenGLPFAAllRenderers));
  rb_define_const(mOSX, "NSOpenGLPFADoubleBuffer", INT2NUM(NSOpenGLPFADoubleBuffer));
  rb_define_const(mOSX, "NSOpenGLPFAStereo", INT2NUM(NSOpenGLPFAStereo));
  rb_define_const(mOSX, "NSOpenGLPFAAuxBuffers", INT2NUM(NSOpenGLPFAAuxBuffers));
  rb_define_const(mOSX, "NSOpenGLPFAColorSize", INT2NUM(NSOpenGLPFAColorSize));
  rb_define_const(mOSX, "NSOpenGLPFAAlphaSize", INT2NUM(NSOpenGLPFAAlphaSize));
  rb_define_const(mOSX, "NSOpenGLPFADepthSize", INT2NUM(NSOpenGLPFADepthSize));
  rb_define_const(mOSX, "NSOpenGLPFAStencilSize", INT2NUM(NSOpenGLPFAStencilSize));
  rb_define_const(mOSX, "NSOpenGLPFAAccumSize", INT2NUM(NSOpenGLPFAAccumSize));
  rb_define_const(mOSX, "NSOpenGLPFAMinimumPolicy", INT2NUM(NSOpenGLPFAMinimumPolicy));
  rb_define_const(mOSX, "NSOpenGLPFAMaximumPolicy", INT2NUM(NSOpenGLPFAMaximumPolicy));
  rb_define_const(mOSX, "NSOpenGLPFAOffScreen", INT2NUM(NSOpenGLPFAOffScreen));
  rb_define_const(mOSX, "NSOpenGLPFAFullScreen", INT2NUM(NSOpenGLPFAFullScreen));
  rb_define_const(mOSX, "NSOpenGLPFASampleBuffers", INT2NUM(NSOpenGLPFASampleBuffers));
  rb_define_const(mOSX, "NSOpenGLPFASamples", INT2NUM(NSOpenGLPFASamples));
  rb_define_const(mOSX, "NSOpenGLPFAAuxDepthStencil", INT2NUM(NSOpenGLPFAAuxDepthStencil));
  rb_define_const(mOSX, "NSOpenGLPFARendererID", INT2NUM(NSOpenGLPFARendererID));
  rb_define_const(mOSX, "NSOpenGLPFASingleRenderer", INT2NUM(NSOpenGLPFASingleRenderer));
  rb_define_const(mOSX, "NSOpenGLPFANoRecovery", INT2NUM(NSOpenGLPFANoRecovery));
  rb_define_const(mOSX, "NSOpenGLPFAAccelerated", INT2NUM(NSOpenGLPFAAccelerated));
  rb_define_const(mOSX, "NSOpenGLPFAClosestPolicy", INT2NUM(NSOpenGLPFAClosestPolicy));
  rb_define_const(mOSX, "NSOpenGLPFARobust", INT2NUM(NSOpenGLPFARobust));
  rb_define_const(mOSX, "NSOpenGLPFABackingStore", INT2NUM(NSOpenGLPFABackingStore));
  rb_define_const(mOSX, "NSOpenGLPFAMPSafe", INT2NUM(NSOpenGLPFAMPSafe));
  rb_define_const(mOSX, "NSOpenGLPFAWindow", INT2NUM(NSOpenGLPFAWindow));
  rb_define_const(mOSX, "NSOpenGLPFAMultiScreen", INT2NUM(NSOpenGLPFAMultiScreen));
  rb_define_const(mOSX, "NSOpenGLPFACompliant", INT2NUM(NSOpenGLPFACompliant));
  rb_define_const(mOSX, "NSOpenGLPFAScreenMask", INT2NUM(NSOpenGLPFAScreenMask));
  rb_define_const(mOSX, "NSOpenGLPFAVirtualScreenCount", INT2NUM(NSOpenGLPFAVirtualScreenCount));
  rb_define_const(mOSX, "NSOpenGLCPSwapRectangle", INT2NUM(NSOpenGLCPSwapRectangle));
  rb_define_const(mOSX, "NSOpenGLCPSwapRectangleEnable", INT2NUM(NSOpenGLCPSwapRectangleEnable));
  rb_define_const(mOSX, "NSOpenGLCPRasterizationEnable", INT2NUM(NSOpenGLCPRasterizationEnable));
  rb_define_const(mOSX, "NSOpenGLCPSwapInterval", INT2NUM(NSOpenGLCPSwapInterval));
  rb_define_const(mOSX, "NSOpenGLCPSurfaceOrder", INT2NUM(NSOpenGLCPSurfaceOrder));
  rb_define_const(mOSX, "NSOpenGLCPSurfaceOpacity", INT2NUM(NSOpenGLCPSurfaceOpacity));
  rb_define_const(mOSX, "NSOpenGLCPStateValidation", INT2NUM(NSOpenGLCPStateValidation));

  /**** functions ****/
  rb_define_module_function(mOSX, "NSOpenGLSetOption", osx_NSOpenGLSetOption, 2);
  rb_define_module_function(mOSX, "NSOpenGLGetOption", osx_NSOpenGLGetOption, 2);
  rb_define_module_function(mOSX, "NSOpenGLGetVersion", osx_NSOpenGLGetVersion, 2);
}
