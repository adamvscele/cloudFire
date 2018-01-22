//
//  DDTcpClientManager.h
//  CloudFire
//
//  Created by macos on 2018/1/22.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDTcpClientManager : NSObject<NSStreamDelegate>
{
    NSInputStream* _inStream;
    NSOutputStream* _outputStream;
    
    NSLock* _sendLock;
    NSLock* _receiveLock;
    NSMutableData* _receiveBuffer;
    
    BOOL _noDataSent;
}

+(instancetype)instance;



-(void)connect:(NSString *)ip port:(NSInteger) port status:(NSInteger)status;
-(void)disconnect;
@end
