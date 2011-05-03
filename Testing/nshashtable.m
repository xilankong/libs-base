/* Test/example program for the base library

   Copyright (C) 2005 Free Software Foundation, Inc.
   
  Copying and distribution of this file, with or without modification,
  are permitted in any medium without royalty provided the copyright
  notice and this notice are preserved.

   This file is part of the GNUstep Base Library.
*/
#include <stdio.h>
#include <Foundation/NSHashTable.h>
#include <Foundation/NSValue.h>
#include    <Foundation/NSAutoreleasePool.h>

int main ()
{
  NSHashTable *ht;
  NSHashEnumerator he;
  int i;
  void *v;
  NSAutoreleasePool	*arp = [NSAutoreleasePool new];

  /* Test with ints */

  ht = NSCreateHashTable (NSIntHashCallBacks, 0);

  for (i = 1; i < 16; i++)
    NSHashInsert (ht, (void*)i);

  NSHashRemove (ht, (void*)3);

  he = NSEnumerateHashTable (ht);
  while ((v = NSNextHashEnumeratorItem (&he)))
    printf ("(%d) ", (int)v);
  printf ("\n");

  NSFreeHashTable (ht);


#if 0
  /* Test with NSNumber objects */

  mt = NSCreateHashTable (NSObjectHashKeyCallBacks,
			 NSObjectHashValueCallBacks,
			 0);

  for (i = 0; i < 16; i++)
    NSHashInsert (mt,
		 [NSNumber numberWithInt: i],
		 [NSNumber numberWithInt: i*i]);

  o = [NSNumber numberWithInt: 3];
  printf ("value for key %s is %s\n",
	  [[o description] cString],
	  [[(id)NSHashGet (mt, o) description] cString]);
  NSHashRemove (mt, o);
  printf ("after removing: value for key %s is %s\n",
	  [[o description] cString],
	  [[(id)NSHashGet (mt, o) description] cString]);

  me = NSEnumerateHashTable (mt);
  while (NSNextHashEnumeratorPair (&me, &k, &v))
    printf ("(%d,%d) ", [(id)k intValue], [(id)v intValue]);
  printf ("\n");

  NSFreeHashTable (mt);
#endif

  [arp release];
  exit (0);
}