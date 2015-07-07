//
//  ViewController.h
//  Multi-Peer
//
//  Created by Apple on 4/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface ViewController : UIViewController

// MCPeerID - represent yourself -
// MCSession - every decvice holds - send/receive data
// MCNearbyServiceBrowser - (server) looks for other devices - init on device you want to search on
// MCNearbyServiceAdvertiser - (client)

@property (nonatomic) MCPeerID *myPeer;
@property (nonatomic) MCSession *session;
@property (nonatomic) MCNearbyServiceBrowser *browser;
@property (nonatomic) MCNearbyServiceAdvertiser *advertiser;


@end

