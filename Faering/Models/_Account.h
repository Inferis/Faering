// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Account.h instead.

#import <CoreData/CoreData.h>


@class Links;
@class Sim;









@interface AccountID : NSManagedObjectID {}
@end

@interface _Account : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AccountID*)objectID;




@property (nonatomic, retain) NSString *accessToken;


//- (BOOL)validateAccessToken:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *earned_points;


@property int earned_pointsValue;
- (int)earned_pointsValue;
- (void)setEarned_pointsValue:(int)value_;

//- (BOOL)validateEarned_points:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *topups_used;


@property int topups_usedValue;
- (int)topups_usedValue;
- (void)setTopups_usedValue:(int)value_;

//- (BOOL)validateTopups_used:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *unused_points;


@property int unused_pointsValue;
- (int)unused_pointsValue;
- (void)setUnused_pointsValue:(int)value_;

//- (BOOL)validateUnused_points:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *used_points;


@property int used_pointsValue;
- (int)used_pointsValue;
- (void)setUsed_pointsValue:(int)value_;

//- (BOOL)validateUsed_points:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *waiting_points;


@property int waiting_pointsValue;
- (int)waiting_pointsValue;
- (void)setWaiting_pointsValue:(int)value_;

//- (BOOL)validateWaiting_points:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSSet* links;

- (NSMutableSet*)linksSet;




@property (nonatomic, retain) NSSet* sims;

- (NSMutableSet*)simsSet;




@end

@interface _Account (CoreDataGeneratedAccessors)

- (void)addLinks:(NSSet*)value_;
- (void)removeLinks:(NSSet*)value_;
- (void)addLinksObject:(Links*)value_;
- (void)removeLinksObject:(Links*)value_;

- (void)addSims:(NSSet*)value_;
- (void)removeSims:(NSSet*)value_;
- (void)addSimsObject:(Sim*)value_;
- (void)removeSimsObject:(Sim*)value_;

@end

@interface _Account (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAccessToken;
- (void)setPrimitiveAccessToken:(NSString*)value;




- (NSNumber*)primitiveEarned_points;
- (void)setPrimitiveEarned_points:(NSNumber*)value;

- (int)primitiveEarned_pointsValue;
- (void)setPrimitiveEarned_pointsValue:(int)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveTopups_used;
- (void)setPrimitiveTopups_used:(NSNumber*)value;

- (int)primitiveTopups_usedValue;
- (void)setPrimitiveTopups_usedValue:(int)value_;




- (NSNumber*)primitiveUnused_points;
- (void)setPrimitiveUnused_points:(NSNumber*)value;

- (int)primitiveUnused_pointsValue;
- (void)setPrimitiveUnused_pointsValue:(int)value_;




- (NSNumber*)primitiveUsed_points;
- (void)setPrimitiveUsed_points:(NSNumber*)value;

- (int)primitiveUsed_pointsValue;
- (void)setPrimitiveUsed_pointsValue:(int)value_;




- (NSNumber*)primitiveWaiting_points;
- (void)setPrimitiveWaiting_points:(NSNumber*)value;

- (int)primitiveWaiting_pointsValue;
- (void)setPrimitiveWaiting_pointsValue:(int)value_;





- (NSMutableSet*)primitiveLinks;
- (void)setPrimitiveLinks:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSims;
- (void)setPrimitiveSims:(NSMutableSet*)value;


@end
