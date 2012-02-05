#import "NSDate+Coby.h"

@implementation NSDate (Coby)

- (NSDateComponents*)component:(NSCalendarUnit)unit {
    return [[NSCalendar currentCalendar] components:unit fromDate:self];
}

- (NSInteger)day {
    return [self component:NSDayCalendarUnit].day;
}

- (NSInteger)month {
    return [self component:NSMonthCalendarUnit].month;
}

- (NSInteger)year {
    return [self component:NSYearCalendarUnit].year;
}

- (NSInteger)hour {
    return [self component:NSHourCalendarUnit].hour;
}

- (NSInteger)minute {
    return [self component:NSMinuteCalendarUnit].minute;
}

- (NSInteger)second {
    return [self component:NSSecondCalendarUnit].second;
}

- (NSDate*)dateBySettingHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    return [self dateBySettingHour:hour minute:minute second:second timeZone:nil];
}

- (NSDate*)dateBySettingHour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second timeZone:(NSTimeZone*)timeZone {
    NSDateComponents* components = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit|NSTimeZoneCalendarUnit fromDate:self];
    components.hour = hour;
    components.minute = minute;
    components.second = second;
    if (timeZone) components.timeZone = timeZone;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

@end
