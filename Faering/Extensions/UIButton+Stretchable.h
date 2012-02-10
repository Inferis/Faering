//
//  UIButton+Stretchable.h
//

#import <Foundation/Foundation.h>

@interface UIButton (Stretchable)

- (void) makeBackgroundImagesStretchable: (CGSize)caps;

@end

@interface UIImageView (Stretchable)

- (void) makeImageStretchable: (CGSize)caps;

@end
