//
//  RankLayer.h
//  아이스크
//
//  Created by JungTong 51310 on 13. 6. 16..
//  Copyright 2013년 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SceneManager.h"

@interface RankLayer : CCLayer {
    CCLabelTTF *timerLabel;
    CCMenuItem *restart;
    CCMenuItem *home;
}
+(CCScene *) scene;
@end
