/** -*-objc-*-
 *
 *   $Id$
 *
 *   Copyright (c) 2001 FUJIMOTO Hisakuni <hisa@imasy.or.jp>
 *
 *   This program is free software.
 *   You can distribute/modify this program under the terms of
 *   the GNU Lesser General Public License version 2.
 *
 **/

#import <Foundation/NSAutoreleasePool.h>
#import "RBThreadSwitcher.h"
#import "osx_ruby.h"
#import "rubysig.h"

static id rthread_switcher = nil;

@implementation RBThreadSwitcher

- init
{
  timer = nil;
  wait.tv_sec = 0;
  wait.tv_usec = 100 * 1000;	// 100 msec
  return self;
}

- (NSTimer*) timer
{
  return timer;
}

- (void) setTimer: (NSTimer*)a_timer
{
  timer = a_timer;
}

- (void) setWait: (int32_t) usec
{
  wait.tv_usec = usec;
}

- (void) sched: (NSTimer*)a_timer
{
  CHECK_INTS;
  if (!rb_thread_critical) rb_thread_schedule();
}

- (void) schedWithWait: (NSTimer*)a_timer
{
  CHECK_INTS;
  if (!rb_thread_critical) rb_thread_wait_for(wait);
}

+ (void) start: (double)interval wait: (double)a_wait
{
  id pool, a_timer;
  SEL sel;

  if (rthread_switcher) [self stop];

  if (a_wait <= 0.0)
    sel = @selector(sched:);
  else
    sel = @selector(schedWithWait:);

  pool = [[NSAutoreleasePool alloc] init];
  rthread_switcher = [[self alloc] init];
  a_timer = [NSTimer scheduledTimerWithTimeInterval: interval
		     target: rthread_switcher
		     selector: sel
		     userInfo: nil
		     repeats: YES];
  [rthread_switcher setTimer: a_timer];
  [rthread_switcher setWait: (int32_t)(a_wait * 1000.0 * 1000.0)];
  [pool release];
}

+ (void) start: (double)interval
{
  [self start: interval wait: 0.0];
}

+ (void) start
{
  [self start: 0.005];
}

+ (void) stop
{
  if (rthread_switcher == nil) return;
  [[rthread_switcher timer] invalidate];
  [rthread_switcher release];
  rthread_switcher = nil;
}

@end
