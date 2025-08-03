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

# --- FULL-STRETCH DRAW WITH DISPLAYMETRICS ---
.method protected final onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    # Save canvas
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I
    move-result v0

    # Get DisplayMetrics
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v1
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v1
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v1

    # Get real screen width & height
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I
    iget v3, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    # Game resolution 480x800
    const/16 v4, 0x1e0
    const/16 v5, 0x320

    # Convert to float
    int-to-float v6, v2
    int-to-float v7, v3
    int-to-float v8, v4
    int-to-float v9, v5

    # Compute scaleX and scaleY separately (full stretch)
    div-float v6, v6, v8  # scaleX
    div-float v7, v7, v9  # scaleY

    # Apply stretch scaling
    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->scale(FF)V

    # Draw game
    iget-object v10, p0, Lb/a/b/b;->akM:Lb/a/b/q;
    invoke-virtual {v10, p1}, Lb/a/b/q;->onDraw(Landroid/graphics/Canvas;)V

    # Restore canvas
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V
    return-void
.end method

# --- FULL-STRETCH TOUCH WITH DISPLAYMETRICS ---
.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 13

    # Get raw touch
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F
    move-result v0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F
    move-result v1

    # Get DisplayMetrics for real screen size
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;
    move-result-object v2
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
    move-result-object v2
    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;
    move-result-object v2

    iget v3, v2, Landroid/util/DisplayMetrics;->widthPixels:I
    iget v4, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    # Game resolution 480x800
    const/16 v5, 0x1e0
    const/16 v6, 0x320

    # Convert to float
    int-to-float v7, v3   # screenW
    int-to-float v8, v4   # screenH
    int-to-float v9, v5   # gameW
    int-to-float v10, v6  # gameH

    # Compute scaleX and scaleY for stretch
    div-float v7, v7, v9
    div-float v8, v8, v10

    # Adjust touch to game coordinates
    div-float v0, v0, v7
    div-float v1, v1, v8

    # Clone MotionEvent and set scaled location
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;
    move-result-object v11
    invoke-virtual {v11, v0, v1}, Landroid/view/MotionEvent;->setLocation(FF)V

    # Forward to game
    iget-object v12, p0, Lb/a/b/b;->akM:Lb/a/b/q;
    invoke-virtual {v12, v11}, Lb/a/b/q;->onTouchEvent(Landroid/view/MotionEvent;)Z
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
