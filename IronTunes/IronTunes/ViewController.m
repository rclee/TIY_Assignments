//
//  ViewController.m
//  IronTunes
//
//  Created by Apple on 4/23/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@import AVFoundation;
@import MediaPlayer;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *songTitleLabel;

@property (nonatomic) AVQueuePlayer *avQueuePlayer;

-(IBAction)playPauseSong:(UIButton *)sender;
-(IBAction)restartSong:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAudioSession];
    
    self.avQueuePlayer = [[AVQueuePlayer alloc] init]; // AVPlayerItem is a single song to play
    
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"CannedHeat" ofType:@"mp3"]]];
    if (playerItem)
    {
        [self.avQueuePlayer insertItem:playerItem afterItem:nil];
        [MPNowPlayingInfoCenter defaultCenter].nowPlayingInfo = @{MPMediaItemPropertyArtist: @"Jamiroquai", MPMediaItemPropertyTitle: @"Canned Heat"};
        self.artistLabel.text = @"Jamiroquai";
        self.songTitleLabel.text = @"Canned Heat";
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder]; // view has to be first responder for headphone events
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVAudioSessionInterruptionNotification object:[AVAudioSession sharedInstance]]; // only need when the app is killed completely // this is how you remove an observer
    
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
    
    [self.avQueuePlayer removeAllItems];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupAudioSession
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(audioSessionInterrupted:) name:AVAudioSessionInterruptionNotification object:[AVAudioSession sharedInstance]];
    
    NSError *categoryError = nil;
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&categoryError];
    if (categoryError)
    {
        NSLog(@"Error setting category: %@", [categoryError localizedDescription]);
    }
    
    NSError *activationError = nil;
    BOOL success = [[AVAudioSession sharedInstance] setActive:YES error:&activationError];
    if (!success)
    {
        NSLog(@"Audio session failed to activate.");
        if (activationError)
        {
            NSLog(@"Session error: %@", [activationError localizedDescription]);
        }
    }
}

#pragma mark - Notifications

- (void)audioSessionInterrupted:(NSNotification *)notification
{
    NSLog(@"Interruption received: %@", notification.name);
}

#pragma mark - Playback Control

- (void)togglePlayback:(BOOL)play //need this for VenueMenu app //<--
{
    if (play)
    {
        [self.avQueuePlayer play];
        [self.playPauseButton setTitle:@"Pause" forState:UIControlStateNormal]; //<--
    }
    else
    {
        [self.avQueuePlayer pause];
        [self.playPauseButton setTitle:@"Play" forState:UIControlStateNormal]; //<--
    }
    
}


#pragma mark - Action Handlers

- (IBAction)playPauseSong:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:@"Pause"])
    {
        [self togglePlayback:NO];
    }
    else
    {
        [self togglePlayback:YES];
    }
}
- (IBAction)restartSong:(UIButton *)sender
{
    [self.avQueuePlayer seekToTime:CMTimeMakeWithSeconds(0.0, 1)];
    if ([self.avQueuePlayer rate] == 0.0)
    {
        [self togglePlayback:YES];
    }
}

#pragma mark - Remote Control Events

- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeRemoteControl)
    {
        switch (event.subtype)
        {
            case UIEventSubtypeRemoteControlTogglePlayPause:
                if (self.avQueuePlayer.rate > 0.0)
                {
                    [self togglePlayback:NO];
                }
                else
                {
                    [self togglePlayback:YES];
                }
                break;
                
            case UIEventSubtypeRemoteControlPlay:
                [self togglePlayback:YES];
            break;
                
            case UIEventSubtypeRemoteControlPause:
                [self togglePlayback:NO];
            break;
                
            default:
                break;
        }
    }
}

#pragma mark - Audio Session management

- (BOOL)canBecomeFirstResponder // allows a view to become first responder
{
    return YES;
}

@end
