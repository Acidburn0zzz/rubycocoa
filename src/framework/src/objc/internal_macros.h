/** -*- mode:objc; indent-tabs-mode:nil; coding:utf-8 -*-
 *
 *  internal_macros.h
 *  RubyCocoa
 *
 *  Copyright (c) 2007 Fujimoto Hisa
 *
 *  $Id$
 *
 **/

#ifndef _INTERNAL_MACROS_H_
#define _INTERNAL_MACROS_H_

#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSString.h>

#define ASSERT_ALLOC(x) do { if (x == NULL) rb_fatal("can't allocate memory"); } while (0)

#define DLOG(mod, fmt, args...)                           \
  do {                                                    \
    if (ruby_debug == Qtrue) {                            \
      NSAutoreleasePool * pool;                           \
      NSString *          nsfmt;                          \
                                                          \
      pool = [[NSAutoreleasePool alloc] init];            \
      nsfmt = [NSString stringWithFormat:                 \
        [NSString stringWithFormat:@"%s : %s",            \
          mod, fmt], ##args];                             \
      NSLog(nsfmt);                                       \
      [pool release];                                     \
    }                                                     \
  }                                                       \
  while (0)

/* syntax: POOL_DO(the_pool) { ... } END_POOL(the_pool); */
#define POOL_DO(POOL)   { id POOL = [[NSAutoreleasePool alloc] init];
#define END_POOL(POOL)  [(POOL) release]; }

#endif	// _INTERNAL_MACROS_H_