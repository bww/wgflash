WOLTER GROUP FLASH FOUNDATION

Yet another Actionscript framework.  The interesting bit is the transactional
animation package.  It takes an approach similar to CoreAnimation and provides
implicit animation within a transaction.

For example, to animate the location and color of a Sprite, you might do this:

=====================================================================================

var someSprite:Sprite = new AnimatableSprite();

// Do some setup

Animate.begin(new EasingTimingVector(Easing.cubicEaseOut), 0.5);

someSprite.x = 500;
someSprite.y = 500;
someSprite.tintColor = 0xff0000;

Animate.commit();

=====================================================================================

When properties are set on an Animatable object, that object first checks to
seek if the animation manager has an open transaction, and if so, instead of
setting the value directly, it creates an implicit animation and the value is
changed over time.

CAVEATS

This framework is very new, has never been used in a substantial project, only
supports a limited subset of animatable properties[1], and has not yet been
optimized very much at all.  At this stage it's an effort to look at a new way
of managing animation in Actionscript that (hopefully) some people might help
improve.  Fork it and help make it better!


[1] Currently: x, y, width, hight, alpha, color, tintColor

