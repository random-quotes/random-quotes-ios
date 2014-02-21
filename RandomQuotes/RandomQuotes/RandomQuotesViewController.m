//
//  RandomQuotesViewController.m
//  RandomQuotes
//
//  Created by idealhack on 2/20/14.
//  Copyright (c) 2014 idealhack. All rights reserved.
//

#import "RandomQuotesViewController.h"
#import "Quote.h"

@interface RandomQuotesViewController ()
@property (weak, nonatomic) IBOutlet UITextView *quoteText;
@property (strong, nonatomic) NSString *quoteSting;

@end

@implementation RandomQuotesViewController

- (void)setQuoteSting:(NSString*)quoteSting
{
    _quoteSting = quoteSting;
    self.quoteText.text = quoteSting;
}

- (void)viewDidLoad
{
    [self showRandomQuote];

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showRandomQuote
{
    Quote *quote = [[Quote alloc] init];

    [quote getQuote:^(AFHTTPRequestOperation *operation, id responseObject) {
        HIDE_NETWORK_INDICATOR
        self.quoteSting = [NSString stringWithFormat:@"%@ ― %@ %@",
                           responseObject[@"body"],
                           responseObject[@"author"],
                           responseObject[@"source"]];
    }];
}

@end
