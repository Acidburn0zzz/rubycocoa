# This program is the GraphView in DarwiinRemote which was rewritten by
# Ruby.  The original objective-c version of GraphView appeared from the
# DarwiinRemote project:

#   http://sourceforge.net/projects/darwiin-remote

require 'osx/cocoa'
OSX.require_framework "OpenGL"

class GraphView < OSX::NSOpenGLView

  GraphPoint = Struct.new(:value, :time_value)
  SAMPLETIME = 10.0

  def initialize
    @datax = @datay = @dataz = nil
    @anim_timer = nil
    @lock = nil
    @x = @y = 0.0
  end

  def awakeFromNib
    @lock  = OSX::NSLock.alloc.init
    @datax = []
    @datay = []
    @dataz = []
  end

  def resizeView(rect)
    OSX.glViewport(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
  end

  def setIRPointX_Y(x, y)
    @x = x.to_f
    @y = y.to_f
  end

  def initWithFrame(frameRect)
    @x = @y = -2.0
    attr = [ OSX::NSOpenGLPFADoubleBuffer, 
             OSX::NSOpenGLPFAAccelerated , 
             OSX::NSOpenGLPFAStencilSize , 32,
             OSX::NSOpenGLPFAColorSize   , 32,
             OSX::NSOpenGLPFADepthSize   , 32, 0 ]
  
    pFormat = OSX::NSOpenGLPixelFormat.alloc.initWithAttributes(attr.pack('i*'))
    self.objc_send :initWithFrame, frameRect,
                   :pixelFormat,   pFormat
    self.openGLContext.makeCurrentContext
    OSX.glClearColor( 1.0, 1.0, 1.0, 1.0 )
    self.setNeedsDisplay(true)
    return self
  end

  def startTimer
    @anim_timer = OSX::NSTimer.
      objc_send(:scheduledTimerWithTimeInterval, 0.1,
                :target,                         self,
                :selector,                       "drawAnimation:",
                :userInfo,                       nil,
                :repeats,                        true)
  end

  def stopTimer
    @anim_timer.invalidate
  end

  objc_method :drawAnimation, [:void, :id] do
    self.setNeedsDisplay(true)
  end

  def should_draw_at(tval, now)
    dif = now - tval
    return (dif <= SAMPLETIME)
  end

  def drawRect(rect)
    self.resizeView(rect)
    now = Time.now             # tval, tzone
    while !@datax.empty? && !@datay.empty? && !@dataz.empty? do
      if !should_draw_at(@datax[0].time_value, now) then
        @datax.shift
        @datay.shift
        @dataz.shift
      else
        break
      end
    end
    return if @datax.empty? || @datay.empty? || @dataz.empty?

    OSX.glClearColor(1.0, 1.0, 1.0, 1.0)
    OSX.glClear( OSX::GL_COLOR_BUFFER_BIT | OSX::GL_DEPTH_BUFFER_BIT )

    from = @datax[0].time_value
    gl_plot(@datax, from, now, 1.0, 0.0, 0.0, 1.0)
    gl_plot(@datay, from, now, 0.0, 1.0, 0.0, 1.0)
    gl_plot(@dataz, from, now, 0.0, 0.0, 1.0, 1.0)
  
    if @x > -2 then
      OSX.glColor4f(1.0, 1.0, 0.0, 1.0)
      OSX.glRectf( @x - 0.05 * (rect.size.height / rect.size.width),
                   @y - 0.05, @x + 0.05 * (rect.size.height / rect.size.width),
                   @y + 0.05 )
    end
    OSX.glFinish()
    self.openGLContext.flushBuffer
  end

  def setData_y_z(x,y,z)
    now = Time.now
    @datax << GraphPoint.new(x, now)
    @datay << GraphPoint.new(y, now)
    @dataz << GraphPoint.new(z, now)
  end

  private
  def gl_with(arg)
    OSX.glBegin(arg)
    yield
    OSX.glEnd
  end

  def gl_plot(ary, from, now, *colors)
    gl_with(OSX::GL_LINE_STRIP) {
      OSX.glColor4f(*colors)
      ary.each do |pt|
        y = pt.value / 255.0 * 2.0 - 1.0
        x = (pt.time_value - from) / (now - from) * 2.0 - 1.0
        OSX.glVertex3f(x, y, 0.0)
      end
    }
  end

  def putmsg(fmt, *args) OSX.NSLog(fmt % args) end
end
