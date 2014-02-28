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
    [self.quoteText addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];

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
        self.quoteSting = [NSString stringWithFormat:@"“%@” ― %@ %@",
                           responseObject[@"body"],
                           responseObject[@"author"],
                           responseObject[@"source"]];
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    UITextView *tv = object;
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale]) / 2.0;
    topCorrect = (topCorrect < 0.0 ? 0.0 : topCorrect);
    tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
}

@end
