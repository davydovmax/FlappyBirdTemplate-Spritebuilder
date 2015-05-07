#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    secondsSinceObstacle = 0;
}

-(void)update:(CCTime)delta
{
    secondsSinceObstacle += delta;
    if(secondsSinceObstacle > 2.0) {
        [self addObstacle];
        secondsSinceObstacle = 0;
    }
}

// put new methods here
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // this will get called every time the player touches the screen
    [character flap];
}

@end
