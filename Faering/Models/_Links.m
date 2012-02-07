// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Links.m instead.

#import "_Links.h"

@implementation LinksID
@end

@implementation _Links

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Links" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Links";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Links" inManagedObjectContext:moc_];
}

- (LinksID*)objectID {
	return (LinksID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic alias;






@dynamic link;






@dynamic account;

	





@end
