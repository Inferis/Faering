//
//  CommonMacros.h
//

/*
 * How to use this file:
 *  1. Find your .pch file
 *  2. Import this file
 *  3. Make sure to import this file after UIKit and Foundation
 *  4. Use the functions in your app.
 *
 */

#define RectLog(x) NSLog(@"%s rect: %@",#x, NSStringFromCGRect(x.frame))

// Blatantly picked up from [Wil Shipley](http://blog.wilshipley.com/2005/10/pimp-my-code-interlude-free-code.html)
//
// > Essentially, if you're wondering if an NSString or NSData or
// > NSAttributedString or NSArray or NSSet has actual useful data in
// > it, this is your macro. Instead of checking things like
// > `if (inputString == nil || [inputString length] == 0)` you just
// > say, "if (IsEmpty(inputString))".
//
// It rocks.
static inline BOOL IsEmpty(id thing) {
    if (thing == nil) return YES;
    if ([thing isEqual:[NSNull null]]) return YES;
    if ([thing respondsToSelector:@selector(count)]) return [thing performSelector:@selector(count)] == 0;
    if ([thing respondsToSelector:@selector(length)]) return [thing performSelector:@selector(length)] == 0;
    return NO;
}

// The inverse for IsEmpty
static inline BOOL IsPresent(id thing) {
    return !IsEmpty(thing);
}

static inline BOOL IsInSimulator() {
#if TARGET_IPHONE_SIMULATOR
	return YES;
#endif
	return NO;
}

// A check to see if we're running on an iPad.
// Picked up [here](http://cocoawithlove.com/2010/07/tips-tricks-for-conditional-ios3-ios32.html)
static inline BOOL IsIPad() {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 30200
    if ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] && [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
		return YES;
	} else
#endif
    {
       	return NO;
    }
}


#define partition_result(yes, no, partition) NSArray* yes; NSArray* no; { NSArray* result = partition; yes = [result objectAtIndex:0];

#define dispatch_delayed(time, block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (time) * NSEC_PER_SEC), dispatch_get_main_queue(), (block));

#define CGRectSetWidth(rect, width) ((CGRect) { (rect).origin, (width), (rect).size.height })
#define CGRectSetHeight(rect, height) ((CGRect) { (rect).origin, (rect).size.width, (height) })
#define CGRectSetX(rect, x) ((CGRect) { (x), (rect).origin.y, (rect).size })
#define CGRectSetY(rect, x) ((CGRect) { (rect).origin.x, (y), (rect).size })
#define CGRectSetOrigin(rect, origin) ((CGRect) { (origin), (rect).size })
#define CGRectSetSize(rect, size) ((CGRect) { (rect).origin, size })

