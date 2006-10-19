# -*-rd-*-

== RubyCocoa�Ȥϡ�

RubyCocoa�ϡ�((<Mac OS X|URL:http://www.apple.co.jp/macosx/>))�Υ��ץꥱ�������Ķ�((<Cocoa|URL:http://developer.apple.com/cocoa/>))�١����Υ��եȥ������򡢥��֥������Ȼظ�������ץȸ���((<Ruby|URL:http://www.ruby-lang.org/>))�ǵ��ҤǤ���褦�ˤ���ե졼�����Ǥ���

RubyCocoa��Ȥäơ�Cocoa���ץꥱ��������Ruby�ǽ񤤤��ꡢRuby������ץȤ�
Cocoa���֥������Ȥ��������Ƶ�ǽ�����Ѥ��뤳�Ȥ��Ǥ��ޤ���
Cocoa���ץꥱ�������Ǥϡ�Ruby��Objective-C�Υ����������ߤ���Cocoa
���ץꥱ���������뤳�Ȥ��ǽ�Ǥ���

���Τ褦�ʤȤ���RubyCocoa��Ȥ��ޤ�:

  * irb������Ū��Cocoa���֥������Ȥ�������õ��
  * Cocoa���ץꥱ�������Υ֥�ȥ����ԥ󥰡���ȯ
  * Ruby��Objective-C������Ĺ���褫����Cocoa���ץꥱ�������
  * Ruby������ץȤ�Mac OS X���Υ桼�����󥿡��ե������򤫤֤���


== �����꡼�󥷥�å�

Ruby������ץȤ�Interface Builder��Nib�ե�����Τߤǽ񤫤줿RubyCocoa
���ץꥱ�������ư��Ƥ���Ȥ���Υ����꡼�󥷥�åȤǤ���
<<< img_simpleapp

== ������ץ���

�ʲ�����ϥ����ƥ�β�����֤��Ĥ餹������ץȤǤ���

  require 'osx/cocoa'
  snd_files =`ls /System/Library/Sounds/*.aiff`.split
  snd_files.each do |path|
    snd = OSX::NSSound.alloc.
      initWithContentsOfFile_byReference (path, true)
    snd.play
    sleep 0.5
  end

�ʲ�����ϥޥå��˥ƥ����Ȥ��ɤ߾夲�����륹����ץȤǤ�(OSX 10.2�ʹ���)��

  require 'osx/cocoa'
  include OSX
  def speak (str)
    str.gsub! (/"/, '\"')
    src = %(say "#{str}")
    NSAppleScript.alloc.initWithSource(src).executeAndReturnError(nil)
  end
  speak "Hello World!"
  speak "Kon nich Wah. Ogan key desu ka?" # "Hi. How are you." in Japanese
  speak "Fuji Yamah, Nin Jya, Sukiyaki, Ten pora, Sushi."

�ʲ�����ϥ��󥿡��ե������ӥ�����Ǻ�������nib�ե�������Υ��饹�ȴ�
Ϣ�Ť���줿���饹����Υ���ץ�Ǥ���

  require 'osx/cocoa'

  class AppCtrl < OSX::NSObject

    ib_outlets :monthField, :dayField, :mulField

    def awakeFromNib
      @monthField.setIntValue  Time.now.month
      @dayField.setIntValue Time.now.day
      convert
    end

    def convert (sender = nil)
      val = @monthField.intValue * @dayField.intValue
      @mulField.setIntValue (val)
      @monthField.selectText (self)
    end

    def windowShouldClose (sender = nil)
      OSX.NSApp.stop (self)
      true
    end    

  end

== �饤����

((<GNU Lesser General Public License version 2. LGPL
|URL:http://www.gnu.org/licenses/lgpl.html>)) �ޤ���Ruby�饤����


== ���

[2001ǯ��] ƣ�ܾ�ˮ��NSClassFromString��NSObject���åפ���Ruby��ĥ�⥸�塼��������
[2001ǯ10��] InterfaceBuilder+ProjectBuilder�Ȥ����硣
[2001ǯ11��] RubyCocoa������
[2002ǯ2���] SourceForge �˥ץ������Ȥ���Ͽ(((<URL:http://rubycocoa.sourceforge.net/>)))��Chris Thomas�����ߥå��˻��á�
[2002ǯ5��] Chris Thomas�ˤ��RubyCocoa���⵭��"Examining RubyCocoa"������((<'Dr. Dobbs Journal, May 2002'|URL:http://www.ddj.com/articles/2002/0205/>)) �˷Ǻܤ��줿��
[2003ǯ] ��¼�ϡ����ߥå��˻��á�
[2006ǯ2��] Jonathan Paisley�����ߥå��˻��á�
[2006ǯ] Tim Burks�ˤ��RubyCocoa���󥵥��� ((<rubycocoa.com|URL:http://www.rubycocoa.com/>))��
[2006ǯ5��] Laurent Sansonetti�����ߥå��˻��á�
[2006ǯ8��] Tim Burks�����ߥå��˻��á�
[2006ǯ8��] Apple WWDC�ˤ�Leopard�ؤ���ܤ���ɽ��


== ���󥿥���

* ((<URL:http://http://sourceforge.net/projects/rubycocoa/>)) (((<URL:http://www.macosforge.org/>))�˰�ưͽ��)
* hisa at sourceforge.net (���ꡢMac OS Forge �˰�ưͽ��)


RubyCocoa Project $Date$
