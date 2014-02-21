//
//  Quote.h
//  RandomQuotes
//
//  Created by idealhack on 2/20/14.
//  Copyright (c) 2014 idealhack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"

@interface Quote : NSObject

@property (strong, nonatomic) NSString *body;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *source;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

- (void)getQuote:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success;

@end
