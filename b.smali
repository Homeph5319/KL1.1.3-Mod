.class public final Lb/a/b/b;
.super Landroid/view/View;

# instance fields
.field private akM:Lb/a/b/q;

# direct methods
.method public constructor <init>(Landroid/content/Context;Lb/a/b/q;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V
    iput-object p2, p0, Lb/a/b/b;->akM:Lb/a/b/q;

    return-void
.end method

.method public static onPause()V
    .locals 0
    return-void
.end method

.method public static onResume()V
    .locals 0
    return-void
.end method

# virtual methods
.method public final a(Landroid/view/KeyEvent;)Z
    .locals 1
    iget-object v0, p0, Lb/a/b/b;->akM:Lb/a/b/q;
    invoke-virtual {v0, p1}, Lb/a/b/q;->a(Landroid/view/KeyEvent;)Z
    move-result v0
    return v0
.end method

# --- PATCHED FULLSCREEN DRAW ---
.method protected final onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    # Save canvas state
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I
    move-result v0

    # Screen width & height
    invoke-virtual {p0}, Lb/a/b/b;->getWidth()I
    move-result v1
    invoke-virtual {p0}, Lb/a/b/b;->getHeight()I
    move-result v2

    # Game resolution 480x800
    const/16 v3, 0x1e0   # 480
    const/16 v4, 0x320   # 800

    # Convert to float
    int-to-float v5, v1
    int-to-float v6, v2
    int-to-float v7, v3
    int-to-float v8, v4

    # Compute scale factors
    div-float v5, v5, v7
    div-float v6, v6, v8

    # Pick the smaller scale for correct aspect ratio
    cmpl-float v9, v5, v6
    if-gtz v9, :useScaleY
    move v9, v5
    goto :gotScale
:useScaleY
    move v9, v6
:gotScale

    # Compute scaled width & height
    int-to-float v5, v1
    int-to-float v6, v2
    int-to-float v7, v3
    int-to-float v8, v4
    mul-float v7, v7, v9
    mul-float v8, v8, v9

    # 2.0f for dividing offsets
    const/high16 v10, 0x40000000

    # Compute offsets to center
    sub-float v5, v5, v7
    div-float v5, v5, v10  # xOffset
    sub-float v6, v6, v8
    div-float v6, v6, v10  # yOffset

    # Translate + scale canvas
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->translate(FF)V
    invoke-virtual {p1, v9, v9}, Landroid/graphics/Canvas;->scale(FF)V

    # Draw the game
    iget-object v7, p0, Lb/a/b/b;->akM:Lb/a/b/q;
    invoke-virtual {v7, p1}, Lb/a/b/q;->onDraw(Landroid/graphics/Canvas;)V

    # Restore canvas
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

# --- PATCHED TOUCH HANDLING ---
.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12

    # Get touch coordinates
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F
    move-result v0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F
    move-result v1

    # Get screen size
    invoke-virtual {p0}, Lb/a/b/b;->getWidth()I
    move-result v2
    invoke-virtual {p0}, Lb/a/b/b;->getHeight()I
    move-result v3

    # Game size 480x800
    const/16 v4, 0x1e0
    const/16 v5, 0x320

    # Convert to float
    int-to-float v6, v2
    int-to-float v7, v3
    int-to-float v8, v4
    int-to-float v9, v5

    # Compute scale (uniform)
    div-float v6, v6, v8
    div-float v7, v7, v9
    cmpl-float v10, v6, v7
    if-gtz v10, :useScaleYTouch
    move v10, v6
    goto :gotScaleTouch
:useScaleYTouch
    move v10, v7
:gotScaleTouch

    # Compute offsets
    mul-float v6, v8, v10   # scaledWidth
    mul-float v7, v9, v10   # scaledHeight
    const/high16 v11, 0x40000000   # 2.0f
    int-to-float v8, v2
    int-to-float v9, v3
    sub-float v8, v8, v6
    div-float v8, v8, v11   # xOffset
    sub-float v9, v9, v7
    div-float v9, v9, v11   # yOffset

    # Convert touch coordinates to game space
    sub-float v0, v0, v8
    sub-float v1, v1, v9
    div-float v0, v0, v10
    div-float v1, v1, v10

    # Now forward to game with adjusted MotionEvent
    # Clone event with new coordinates
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;
    move-result-object v2

    invoke-virtual {v2, v0, v1}, Landroid/view/MotionEvent;->setLocation(FF)V

    iget-object v3, p0, Lb/a/b/b;->akM:Lb/a/b/q;
    invoke-virtual {v3, v2}, Lb/a/b/q;->onTouchEvent(Landroid/view/MotionEvent;)Z
    move-result v0

    return v0
.end method

.method public final onWindowFocusChanged(Z)V
    .locals 2
    invoke-static {p1}, Lcom/gameloft/android/wrapper/g;->L(Z)Z
    move-result v0
    iget-object v1, p0, Lb/a/b/b;->akM:Lb/a/b/q;
    invoke-virtual {v1, v0}, Lb/a/b/q;->onWindowFocusChanged(Z)V
    return-void
.end method
