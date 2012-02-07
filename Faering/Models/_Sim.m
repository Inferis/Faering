// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sim.m instead.

#import "_Sim.h"

@implementation SimID
@end

@implementation _Sim

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Sim" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Sim";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Sim" inManagedObjectContext:moc_];
}

- (SimID*)objectID {
	return (SimID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic alias;






@dynamic cardnumber;






@dynamic imsi;






@dynamic msisdn;






@dynamic pin1;






@dynamic pin2;






@dynamic puk1;






@dynamic puk2;






@dynamic account;

	





@end
