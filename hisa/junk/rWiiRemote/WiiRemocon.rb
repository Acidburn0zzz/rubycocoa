#
#  WiiRemocon.rb
#  rWiiRemote
#
#  Created by Fujimoto Hisa on 06/12/28.
#  Copyright (c) 2006 Fujimoto Hisa. All rights reserved.
#

require 'osx/cocoa'
OSX.require_framework "WiiRemote"

class WiiRemocon < OSX::NSObject
  ib_outlet :accView

  kvc_accessor :status

  # Button
  kvc_accessor :btn_left, :btn_up, :btn_right, :btn_down
  kvc_accessor :btn_a, :btn_b
  kvc_accessor :btn_minus, :btn_home, :btn_plus
  kvc_accessor :btn_1, :btn_2
  kvc_accessor :btn_z, :btn_c

  # LED
  kvc_accessor :led_1, :led_2, :led_3, :led_4

  def led_1=(val) @led_1 = _bool_(val) ; led_changed end
  def led_2=(val) @led_2 = _bool_(val) ; led_changed end
  def led_3=(val) @led_3 = _bool_(val) ; led_changed end
  def led_4=(val) @led_4 = _bool_(val) ; led_changed end

  # Acceleration
  kvc_accessor :acc_x, :acc_y, :acc_z

  # IR Point
  kvc_accessor :ir_pt_x, :ir_pt_y

  # Acceleration log
  kvc_depends_on :acc_x, [:acc_x_min, :acc_x_max]
  kvc_depends_on :acc_y, [:acc_y_min, :acc_y_max]
  kvc_depends_on :acc_z, [:acc_z_min, :acc_z_max]

  def acc_x_min; @acc_x_min = _min_( @acc_x_min, @acc_x ) end
  def acc_y_min; @acc_y_min = _min_( @acc_y_min, @acc_y ) end
  def acc_z_min; @acc_z_min = _min_( @acc_z_min, @acc_z ) end

  def acc_x_max; @acc_x_max = _max_( @acc_x_max, @acc_x ) end
  def acc_y_max; @acc_y_max = _max_( @acc_y_max, @acc_y ) end
  def acc_z_max; @acc_z_max = _max_( @acc_z_max, @acc_z ) end

  def initialize
    @wii = @discovery = nil
    @acc_x_min = @acc_y_min = @acc_z_min = 255
    @acc_x_max = @acc_y_max = @acc_z_max = 0
  end

  def awakeFromNib
    @discovery = OSX::WiiRemoteDiscovery.alloc.init
    @discovery.setDelegate(self)
    @discovery.start
    self.status = "-- press A & B --"
  end

  # as WiiRemoteDiscoveryDelegate
  # objc_export :WiiRemoteDiscovered,     %w( void id id  ) # "v@:@"
  # objc_export :WiiRemoteDiscoveryError, %w( void id int ) # "v@:i"

  def WiiRemoteDiscovered(wii)
    putmsg( "WiiRemoteDiscovered wii=%p", wii )
    @wii = wii
    @wii.setDelegate(self)
    @wii.setMotionSensorEnabled(true)
    # @wii.setIRSensorEnabled(true)
    @discovery.stop
    @accView.startTimer
    self.led_4 = true
    self.status = "connected"
  end

  def WiiRemoteDiscoveryError(code)
    putmsg( "WiiRemoteDiscoveryError code=0x%8X", code )
    @wii.setDelegate(nil)
    @wii = nil
    @discovery.stop
    self.status = "error: 0x#{code.to_s(16)}"
    @discovery.start
  end

  # as WiiRemoteDelegate

  def wiiRemoteDisconnected(device)
    putmsg( "wiiRemoteDisconnected device=%p", device)
    @wii = nil
    self.status = "disconnected"
    @accView.stopTimer
    @discovery.start
  end

  def irPointMovedX_Y(px, py)
    self.ir_pt_x = px
    self.ir_pt_y = py
  end

  BTN_MAP = {
    OSX::WiiRemoteAButton     => :btn_a,
    OSX::WiiRemoteBButton     => :btn_b,
    OSX::WiiRemoteOneButton   => :btn_1,
    OSX::WiiRemoteTwoButton   => :btn_2,
    OSX::WiiRemoteMinusButton => :btn_minus,
    OSX::WiiRemoteHomeButton  => :btn_home,
    OSX::WiiRemotePlusButton  => :btn_plus,
    OSX::WiiRemoteUpButton    => :btn_up,
    OSX::WiiRemoteDownButton  => :btn_down,
    OSX::WiiRemoteLeftButton  => :btn_left,
    OSX::WiiRemoteRightButton => :btn_right,
    OSX::WiiNunchukZButton    => :btn_z,
    OSX::WiiNunchukCButton    => :btn_c,
  }

  def buttonChanged_isPressed(btn_type, is_pressed)
    key = BTN_MAP[btn_type]
    if key then
      self.send("#{key}=", is_pressed)
    else
      putmsg("buttonChanged: %x isPressed: %p", btn_type, is_pressed) end
  end

  def accelerationChanged_accX_accY_accZ(type, ax, ay, az)
    self.acc_x = ax
    self.acc_y = ay
    self.acc_z = az
    @accView.setData_y_z(ax,ay,az)
  end

  def joyStickChanged_tiltX_tiltX(type, tilt_x, tilt_y)
    # (will implement later)
  end

  private

  def _bool_(val) val end

  def led_changed
    ary = [ self.led_1, self.led_2, self.led_3, self.led_4 ]
    @wii.setLEDEnabled1_enabled2_enabled3_enabled4(*ary) if @wii
  end

  def putmsg(fmt, *args) OSX.NSLog(fmt % args) end

  def _min_(a,b) a && b && (a < b) ? a : b end
  def _max_(a,b) a && b && (a > b) ? a : b end
end
