// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sim.h instead.

#import <CoreData/CoreData.h>


@class Account;










@interface SimID : NSManagedObjectID {}
@end

@interface _Sim : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SimID*)objectID;




@property (nonatomic, retain) NSString *alias;


//- (BOOL)validateAlias:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *cardnumber;


//- (BOOL)validateCardnumber:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *imsi;


//- (BOOL)validateImsi:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *msisdn;


//- (BOOL)validateMsisdn:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *pin1;


//- (BOOL)validatePin1:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *pin2;


//- (BOOL)validatePin2:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *puk1;


//- (BOOL)validatePuk1:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *puk2;


//- (BOOL)validatePuk2:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) Account* account;

//- (BOOL)validateAccount:(id*)value_ error:(NSError**)error_;




@end

@interface _Sim (CoreDataGeneratedAccessors)

@end

@interface _Sim (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAlias;
- (void)setPrimitiveAlias:(NSString*)value;




- (NSString*)primitiveCardnumber;
- (void)setPrimitiveCardnumber:(NSString*)value;




- (NSString*)primitiveImsi;
- (void)setPrimitiveImsi:(NSString*)value;




- (NSString*)primitiveMsisdn;
- (void)setPrimitiveMsisdn:(NSString*)value;




- (NSString*)primitivePin1;
- (void)setPrimitivePin1:(NSString*)value;




- (NSString*)primitivePin2;
- (void)setPrimitivePin2:(NSString*)value;




- (NSString*)primitivePuk1;
- (void)setPrimitivePuk1:(NSString*)value;




- (NSString*)primitivePuk2;
- (void)setPrimitivePuk2:(NSString*)value;





- (Account*)primitiveAccount;
- (void)setPrimitiveAccount:(Account*)value;


@end
