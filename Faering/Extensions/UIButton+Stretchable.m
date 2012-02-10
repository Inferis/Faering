//
//  UIButton+Stretchable.m
//

#import "UIButton+Stretchable.h"

@implementation UIButton (Stretchable)

- (void) applyCaps:(CGSize)caps forState:(UIControlState)state {
    UIImage* image = [self backgroundImageForState:state];
    if (image != nil) {
        image = [image stretchableImageWithLeftCapWidth:caps.width topCapHeight:caps.height];
        [self setBackgroundImage:image forState:state];
    }
}

- (void) makeBackgroundImagesStretchable: (CGSize)caps {
    [self applyCaps:caps forState:UIControlStateNormal];
    [self applyCaps:caps forState:UIControlStateSelected];
    [self applyCaps:caps forState:UIControlStateDisabled];
    [self applyCaps:caps forState:UIControlStateHighlighted];
}

@end


@implementation UIImageView (Stretchable)

- (void) makeImageStretchable: (CGSize)caps {
    UIImage* image = [self image];
    if (image != nil) {
        image = [image stretchableImageWithLeftCapWidth:caps.width topCapHeight:caps.height];
        [self setImage:image];
    }
}

@end
