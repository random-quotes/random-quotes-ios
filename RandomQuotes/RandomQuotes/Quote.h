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

- (void)getQuote:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success;

@end
