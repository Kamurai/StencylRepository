#import <Box2D/Box2D.h>
#import <AudioToolbox/AudioServices.h>
#import <Foundation/Foundation.h>
#import "ActorScript.h"

#import "Script.h"

#import "Actor.h"
#import "ActorType.h"
#import "Assets.h"
#import "Behavior.h"
#import "Collision.h"
#import "CollisionPoint.h"
#import "Game.h"
#import "GameModel.h"
#import "GroupDef.h"
#import "FadeInTransition.h"
#import "FadeOutTransition.h"
#import "Region.h"
#import "Runnable.h"
#import "Scene.h"
#import "SHThumbstick.h"
#import "Sparrow.h"
#import "Transition.h"



@interface Design_0_0_Movement : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _TouchX;

}
@end

@implementation Design_0_0_Movement

    -(void)load
{
        [mActor setXPosition:0];
        [mActor makeAlwaysSimulate];
        [mActor disableActorDrawing];
}

    -(void)update
{
        [[Game game] cameraFollow:mActor lockX:TRUE lockY:TRUE];
        /* Basic touch controls based on Jon's Pan Camera behavior. */
        /* Snaping behaviors. These only activate if the camera helper actor is with in the ranges. This is meant to mimic the snapping behavior of the standard iOS spring board. */
        /* Flash and iOS are separated because I had to compenstate for the helper object to get the exact center, but it only needs to be done for Flash. */
                    /* @"iOS is separated to lock out potential inputs from multiple touches." */
            if(([[Game game] beganTouch] && [self sameAs:[NSNumber numberWithFloat:[[Game game] numTouches]] two:[NSNumber numberWithFloat:1]]))
{
                _TouchX = ([self getTouchX] + [self getScreenX]);
}

            if(([[Game game] draggedTouch] && [self sameAs:[NSNumber numberWithFloat:[[Game game] numTouches]] two:[NSNumber numberWithFloat:1]]))
{
                [mActor setXPosition:((_TouchX - [self getTouchDragX]) + ([self getScreenWidth] / 2))];
}

         
        if([[Game game] releasedTouch])
{
             
                            /* @"Less than between One and Two" */
                if(([mActor getXCenter] < 480))
{
                    /* @"Center of One" */
                    [mActor moveToX:240 y:0 time:0.5 transition:SP_TRANSITION_EASE_OUT];
}

                /* @"Greater than between One and Two but Less than between Two and Three" */
                if((([mActor getXCenter] > 480) && ([mActor getXCenter] < 960)))
{
                    /* @"Center of Two" */
                    [mActor moveToX:720 y:0 time:0.5 transition:SP_TRANSITION_EASE_OUT];
}

                /* @"Greater than between Two and Three" */
                if(([mActor getXCenter] > 960))
{
                    /* @"Center of Three" */
                    [mActor moveToX:1200 y:0 time:0.5 transition:SP_TRANSITION_EASE_OUT];
}

}

}

    -(void)handleCollision:(Collision*)c
{

}

    -(void)render:(SPRenderSupport*)g x:(int)x y:(int)y
{
[super render:g x:x y:y];

}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end