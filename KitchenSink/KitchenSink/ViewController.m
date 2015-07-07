//
//  ViewController.m
//  KitchenSink
//
//  Created by Apple on 4/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@import iAd;


@interface ViewController () <ADBannerViewDelegate>
{
    BOOL _bannerIsVisible;
    ADBannerView *_adBanner;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _adBanner = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 50)];
    _adBanner.delegate = self;
    _bannerIsVisible = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - iAd Banner View Delegate

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!_bannerIsVisible)
    {
        if (_adBanner.superview == nil)
        {
            [self.view addSubview:_adBanner]; // never see the banner without this
        }
        
        [UIView animateWithDuration:0.5 animations:^{
            banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height); // raises up in the Y direction by the height of the banner
        }];
        _bannerIsVisible = YES;
    }
}


- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"Failed to receive ad.");
    
    if (_bannerIsVisible)
    {
        [UIView animateWithDuration:0.5 animations:^{
            banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height);
        }];
        _bannerIsVisible = NO;
    }
}















@end
