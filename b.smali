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

# --- FULL-STRETCH DRAW ---
.method protected final onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    # Save canvas state
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I
    move-result v0

    # Screen width & height
    invoke-virtual {p0}, Lb/a/b/b;->getWidth()I
    move-result v1
    invoke-virtual {p0}, Lb/a/b/b;->getHeight()I
    move-result v2

    # Game resolution 480x800
    const/16 v3, 0x1e0
    const/16 v4, 0x320

    # Convert to float
    int-to-float v5, v1
    int-to-float v6, v2
    int-to-float v7, v3
    int-to-float v8, v4

    # Compute scaleX and scaleY separately
    div-float v5, v5, v7   # scaleX
    div-float v6, v6, v8   # scaleY

    # Apply stretch scaling (no centering)
    invoke-virtual {p1, v5, v6}, Landroid/graphics/Canvas;->scale(FF)V

    # Draw game
    iget-object v7, p0, Lb/a/b/b;->akM:Lb/a/b/q;
    invoke-virtual {v7, p1}, Lb/a/b/q;->onDraw(Landroid/graphics/Canvas;)V

    # Restore canvas
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V
    return-void
.end method

# --- FULL-STRETCH TOUCH ---
.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12

    # Get raw touch
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F
    move-result v0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F
    move-result v1

    # Screen size
    invoke-virtual {p0}, Lb/a/b/b;->getWidth()I
    move-result v2
    invoke-virtual {p0}, Lb/a/b/b;->getHeight()I
    move-result v3

    # Game size 480x800
    const/16 v4, 0x1e0
    const/16 v5, 0x320

    # Convert to float
    int-to-float v6, v2    # screenW
    int-to-float v7, v3    # screenH
    int-to-float v8, v4    # gameW
    int-to-float v9, v5    # gameH

    # Compute scaleX and scaleY
    div-float v6, v6, v8   # scaleX
    div-float v7, v7, v9   # scaleY

    # Adjust touch coordinates for stretched scaling
    div-float v0, v0, v6   # gameX
    div-float v1, v1, v7   # gameY

    # Clone MotionEvent and set scaled location
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;
    move-result-object v10
    invoke-virtual {v10, v0, v1}, Landroid/view/MotionEvent;->setLocation(FF)V

    # Forward to game
    iget-object v11, p0, Lb/a/b/b;->akM:Lb/a/b/q;
    invoke-virtual {v11, v10}, Lb/a/b/q;->onTouchEvent(Landroid/view/MotionEvent;)Z
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
