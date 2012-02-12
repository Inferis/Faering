// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Account.m instead.

#import "_Account.h"

@implementation AccountID
@end

@implementation _Account

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Account" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Account";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Account" inManagedObjectContext:moc_];
}

- (AccountID*)objectID {
	return (AccountID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"earned_pointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"earned_points"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"isActiveValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isActive"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"topups_usedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"topups_used"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"unused_pointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"unused_points"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"used_pointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"used_points"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"waiting_pointsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"waiting_points"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic accessToken;






@dynamic earned_points;



- (int)earned_pointsValue {
	NSNumber *result = [self earned_points];
	return [result intValue];
}

- (void)setEarned_pointsValue:(int)value_ {
	[self setEarned_points:[NSNumber numberWithInt:value_]];
}

- (int)primitiveEarned_pointsValue {
	NSNumber *result = [self primitiveEarned_points];
	return [result intValue];
}

- (void)setPrimitiveEarned_pointsValue:(int)value_ {
	[self setPrimitiveEarned_points:[NSNumber numberWithInt:value_]];
}





@dynamic isActive;



- (BOOL)isActiveValue {
	NSNumber *result = [self isActive];
	return [result boolValue];
}

- (void)setIsActiveValue:(BOOL)value_ {
	[self setIsActive:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsActiveValue {
	NSNumber *result = [self primitiveIsActive];
	return [result boolValue];
}

- (void)setPrimitiveIsActiveValue:(BOOL)value_ {
	[self setPrimitiveIsActive:[NSNumber numberWithBool:value_]];
}





@dynamic name;






@dynamic topups_used;



- (int)topups_usedValue {
	NSNumber *result = [self topups_used];
	return [result intValue];
}

- (void)setTopups_usedValue:(int)value_ {
	[self setTopups_used:[NSNumber numberWithInt:value_]];
}

- (int)primitiveTopups_usedValue {
	NSNumber *result = [self primitiveTopups_used];
	return [result intValue];
}

- (void)setPrimitiveTopups_usedValue:(int)value_ {
	[self setPrimitiveTopups_used:[NSNumber numberWithInt:value_]];
}





@dynamic unused_points;



- (int)unused_pointsValue {
	NSNumber *result = [self unused_points];
	return [result intValue];
}

- (void)setUnused_pointsValue:(int)value_ {
	[self setUnused_points:[NSNumber numberWithInt:value_]];
}

- (int)primitiveUnused_pointsValue {
	NSNumber *result = [self primitiveUnused_points];
	return [result intValue];
}

- (void)setPrimitiveUnused_pointsValue:(int)value_ {
	[self setPrimitiveUnused_points:[NSNumber numberWithInt:value_]];
}





@dynamic used_points;



- (int)used_pointsValue {
	NSNumber *result = [self used_points];
	return [result intValue];
}

- (void)setUsed_pointsValue:(int)value_ {
	[self setUsed_points:[NSNumber numberWithInt:value_]];
}

- (int)primitiveUsed_pointsValue {
	NSNumber *result = [self primitiveUsed_points];
	return [result intValue];
}

- (void)setPrimitiveUsed_pointsValue:(int)value_ {
	[self setPrimitiveUsed_points:[NSNumber numberWithInt:value_]];
}





@dynamic waiting_points;



- (int)waiting_pointsValue {
	NSNumber *result = [self waiting_points];
	return [result intValue];
}

- (void)setWaiting_pointsValue:(int)value_ {
	[self setWaiting_points:[NSNumber numberWithInt:value_]];
}

- (int)primitiveWaiting_pointsValue {
	NSNumber *result = [self primitiveWaiting_points];
	return [result intValue];
}

- (void)setPrimitiveWaiting_pointsValue:(int)value_ {
	[self setPrimitiveWaiting_points:[NSNumber numberWithInt:value_]];
}





@dynamic links;

	
- (NSMutableSet*)linksSet {
	[self willAccessValueForKey:@"links"];
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"links"];
	[self didAccessValueForKey:@"links"];
	return result;
}
	

@dynamic sims;

	
- (NSMutableSet*)simsSet {
	[self willAccessValueForKey:@"sims"];
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"sims"];
	[self didAccessValueForKey:@"sims"];
	return result;
}
	





@end
