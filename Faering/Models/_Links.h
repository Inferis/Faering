// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Links.h instead.

#import <CoreData/CoreData.h>


@class Account;




@interface LinksID : NSManagedObjectID {}
@end

@interface _Links : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (LinksID*)objectID;




@property (nonatomic, retain) NSString *alias;


//- (BOOL)validateAlias:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *link;


//- (BOOL)validateLink:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) Account* account;

//- (BOOL)validateAccount:(id*)value_ error:(NSError**)error_;




@end

@interface _Links (CoreDataGeneratedAccessors)

@end

@interface _Links (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAlias;
- (void)setPrimitiveAlias:(NSString*)value;




- (NSString*)primitiveLink;
- (void)setPrimitiveLink:(NSString*)value;





- (Account*)primitiveAccount;
- (void)setPrimitiveAccount:(Account*)value;


@end
