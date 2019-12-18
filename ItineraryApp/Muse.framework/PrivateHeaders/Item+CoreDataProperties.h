//
//  Item+CoreDataProperties.h
//  Muse
//
//  Created by Mike on 08/05/2019.
//  Copyright © 2019 zenox. All rights reserved.
//
//

#import "Item+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Item (CoreDataProperties)

+ (NSFetchRequest<Item *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *extra;
@property (nullable, nonatomic, copy) NSString *value;
@property (nullable, nonatomic, copy) NSDate *date;
@property (nonatomic) double duration;
@property (nonatomic) int16_t type;

@end

NS_ASSUME_NONNULL_END
