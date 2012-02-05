#import <Foundation/Foundation.h>

@interface NSDate (Coby)

- (NSInteger)day;
- (NSInteger)month;
- (NSInteger)year;
- (NSInteger)hour;
- (NSInteger)minute;
- (NSInteger)second;

- (NSDate*)dateBySettingHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;
- (NSDate*)dateBySettingHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second timeZone:(NSTimeZone*)timeZone;


@end
