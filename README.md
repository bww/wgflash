WOLTER GROUP FLASH FOUNDATION
=============================

Yet another Actionscript framework.  The interesting bit is the transactional
animation package.  It takes an approach similar to CoreAnimation and provides
implicit animation within a transaction.

IMPLICIT ANIMATION EXAMPLE
--------------------------

In the simplest case, you can just bracket the property changes you want animated
with `Animate.begin()` and `Animate.commit()`.  The former can take some arguments,
but omitting them uses reasonable defaults.

    var someSprite:Sprite = new AnimatableSprite();
    
    Animate.begin();
    
    someSprite.x = 500;
    someSprite.y = 500;
    someSprite.alpha = 1;
    someSprite.tintColor = 0xff0000;
    
    Animate.commit();

When properties are set on an Animatable object, that object first checks to
seek if the animation manager has an open transaction (created in this case by
`Animate.begin()`), and if so, instead of setting the value directly, it creates
an implicit animation and the value is changed over time.  Properties that do
not support animation will just be immediately changed.

This pattern also allows for much more straightfoward conditional animation:

    function updateSomething(shouldAnimate) : void {
      if(shouldAnimate) Animate.begin();
      someSprite.x = 500;
      if(shouldAnimate) Animate.commit();
    }

And controlling animation from code that does not have or need direct access to
animated objects:

    function updateSomething() : void {
      Animate.begin();
      updateSomeObjects(); // updated objects will be animated
      Animate.commit();
    }
    
    // elsewhere...
    function updateSomeObjects() : void {
      someSprite.x = 500;
    }

CAVEATS
-------

This framework is very new, has never been used in a substantial project, only
supports a limited subset of animatable properties[1], and has not yet been
optimized very much at all.  At this stage it's an effort to look at a new way
of managing animation in Actionscript that (hopefully) some people might help
improve.  Fork it and help make it better!

[1] Currently: x, y, width, hight, alpha, color, tintColor

