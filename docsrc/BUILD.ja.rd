# -*-rd-*-
= RubyCocoa�򥽡������鹽�ۡ����󥹥ȡ��뤹��

����ʸ��Ǥ�RubyCocoa 0.4.2�򥽡������鹽�ۡ����󥹥ȡ��뤹����ˡ�ˤĤ���
�������ޤ����Х��ʥ����դ򥤥󥹥ȡ��뤷�ƻȤ����ˤϤȤ����ɤ�ɬ�פϤ���ޤ���

���ۡ����󥹥ȡ����Ȥϡ�Terminal���ץꥱ�������ʤɤ��饷���륳�ޥ��
�����Ϥ��ƹԤ��ޤ��������륳�ޥ��������ˤ�bash�����ꤷ�Ƶ��Ҥ��Ƥ��ޤ���
����¾�Υ�����(�㤨��tcsh)��ȤäƤ����硢Ŭ�����ɤ��Ѥ��Ƥ���������


== ���ۡ����󥹥ȡ���μ��

���ۡ����󥹥ȡ���ϡ������褽�ʲ��Τ褦�ʼ��ǹԤ��ޤ���

  * ((<Ruby�ι��ۡ����󥹥ȡ���>))
  * ((<RubyCocoa�ι���>))
  * ((<RubyCocoa��ñ�Υƥ���>))
  * ((<RubyCocoa�Υ��󥹥ȡ���>))

���餫����ɤ�����RubyCocoa�Υ�������Ÿ�����Ƥ����Ƥ���������

  $ cd {�ɤ���}
  $ tar zxf rubycocoa-0.4.2.tar.gz

((*���*)) StuffIt��Ȥ��ȥե�����̾��Ĺ���������RubyCocoa��������
���󥹥ȡ��뤵��ʤ��Τ�tar���ޥ�ɤ�ȤäƤ���������


== Ruby�ι��ۡ����󥹥ȡ���

RubyCocoa���ۤ��뤿��ˤϡ������libruby��Ruby���տ魯��C�����
�إå����ե����뤬ɬ�פȤʤ�ޤ��������Ǥϼ��˼���������ˡ�
RubyCocoa�Υ١����Ȥʤ�Ruby�ι��ۼ����������ޤ���

  * ���������饤�󥹥ȡ��뤷��Ruby 1.8.5
  * Mac OS X��°��Ruby
    * Ruby 1.8.2(Mac OS X 10.4)

RubyCocoa 0.4.2�Х��ʥ�ѥå������ϡ�2���ܤ���ˡ�Ǻ��줿��ΤǤ���
((<Fink|URL:http://fink.sf.net/>))�ʤɤΥѥå�������Ȥä�Ruby��
���󥹥ȡ��뤷�Ƥ�����ʤɤϡ�����˹�碌���ɤ��Ѥ��Ƥ���������

=== ���󥹥ȡ��뤵��Ƥ���Mac OS X�ѥå������γ�ǧ

Mac OS X�򥤥󥹥ȡ��뤷�����Υ��ץ�������꼡��Ǥϡ�ɬ�פ�
�ѥå�����(BSD.pkg��BSDSDK.pkg)�����󥹥ȡ��뤵��Ƥ��ʤ���ǽ��������ޤ���
�ޤ��ϥѥå����������󥹥ȡ��뤵��Ƥ��뤫��ǧ���ơ�ɬ�פǤ���Х��󥹥ȡ���
���Ƥ���������

  $ ls -dF /Library/Receipts/BSD*.pkg   # ��ǧ
  /Library/Receipts/BSD.pkg/   /Library/Receipts/BSDSDK.pkg/


=== ���������饤�󥹥ȡ��뤷��Ruby 1.8.5

Ruby 1.8.5�Υ������ǥ��쥯�ȥ�˰�ư���ơ��ʲ��Τ褦�˹��ۡ����󥹥ȡ���
���ޤ������ץ�����ɬ�פ˱������ѹ����Ƥ���������
((- CFLAGS��'-fno-common'���ץ�������ꤷ�ʤ��ȡ�RubyCocoa.framework
����󥯤Ǥ��ʤ��褦�Ǥ� -))

  $ CFLAGS='-g -O2 -fno-common' ./configure --enable-shared
  $ make
  $ make test
  $ sudo make install
  $ sudo ranlib /usr/local/lib/libruby-static.a  # 

=== Mac OS X 10.4��°��Ruby 1.8.2

�Ȥ��˺�Ȥ�ɬ�פ���ޤ���

== RubyCocoa�ι���

���Τ褦�����Ϥ���RubyCocoa���ۤ��ޤ���

  $ ruby install.rb --help   # ���ץ����γ�ǧ
  $ ruby install.rb config
  $ ruby install.rb setup

((% ruby install.rb config %))�ˤϤ����Ĥ�RubyCocoa�ѤΥ��ץ���󤬤���ޤ���
ɬ�פʤ�config�ե������ΤȤ��˥��ץ�������ꤷ�Ƥ���������

== RubyCocoa��ñ�Υƥ���

  $ ruby install.rb test

ñ�Υƥ��Ȥˤ�
((<"Test::Unit"|URL:http://raa.ruby-lang.org/list.rhtml?name=testunit>))
��ɬ�פǤ������Υץ����Ͼ�ά��ǽ�Ǥ���
(Test::Unit�ϸ���RAA����������뤳�Ȥ��Ǥ��ޤ���RubyCocoa�ץ������Ȥ� 
((<testunit-0.1.8.tar.gz|URL:http://rubycocoa.sourceforge.net/files/testunit-0.1.8.tar.gz>))
�˥��ԡ����Ѱդ��Ƥ��ޤ���)

Test::Unit��Ruby 1.8�Ǥ�ɸ��ź�դ���Ƥ��ޤ���


== RubyCocoa�Υ��󥹥ȡ���

  $ sudo ruby install.rb install

�ʾ�ǥ��󥹥ȡ���ϴ�λ�Ǥ��������ޤǤμ��ǰʲ��Τ�Τ����󥹥ȡ���
����ޤ�������Mac OS X 10.4��°��Ruby 1.8.2�ǹ��ۤ�����硣Ruby�����
�����ƥ�ΥС������ˤ�ꡢ���󥹥ȡ����褬¿���ۤʤ�ޤ���

: /Library/Frameworks/RubyCocoa.framework
  RubyCocoa�ե졼���� (����)

: /usr/lib/ruby/site_ruby/1.8/osx/ ����
  RubyCocoa�饤�֥�� (stub) 
  - addressbook.rb, appkit.rb, cocoa.rb, foundation.rb

: /usr/lib/ruby/site_ruby/1.8/[powerpc|i386]-darwin8.0/rubycocoa.bundle
  RubyCocoa��ĥ�饤�֥�� (stub)

: '/Library/Application Support/Apple/Developer Tools/' ����
  Xcode�Υƥ�ץ졼��
  * 'File Templates/Ruby'
  * 'Project Templates/Application/Cocoa-Ruby Document-based Application'
  * 'Project Templates/Application/Cocoa-Ruby Application'

: /Library/BridgeSupport
  AppKit��Foundation�˴ؤ���᥿�ǡ���XML�ե�����

: /Developer/Documentation/RubyCocoa
  �ɥ������ (HTML)

: /Developer/Examples/RubyCocoa
  ����ץ�ץ����


((<����°����ץ���Ƥߤ��|URL:trysamples.ja.html>)) �򻲹ͤ�
ư���ǧ���ƤߤƤ���������


== [FYI] �Х��ʥ�ѥå������󥰤������ʥ��󥹥ȡ��륪�ץ����

RubyCocoa�ΥХ��ʥ�ѥå���������Ȥ���������'ruby install.rb
config'�Υ��ץ���󤬤���ޤ���

  * --install-prefix : 
    ��ĥ�饤�֥��ȥ饤�֥��Υ��󥹥ȡ�����˱ƶ�
  * --install-root :
    �ե졼�������ƥ�ץ졼�ȡ��ɥ�����ȡ�����ץ�Υ��󥹥ȡ�����˱ƶ�

=== ��

  $ ruby -r rbconfig -e 'p Config::CONFIG["prefix"]'
  "/usr"
  $ ruby install.rb config \
      --install-prefix=/tmp/build/usr --install-root=/tmp/build
  $ ruby install.rb setup
  $ sudo ruby install.rb install

��̤Ȥ��ưʲ��ξ���(����)���󥹥ȡ��뤵��ޤ���

  /tmp/build/usr/lib/ruby/site_ruby/1.8/osx/addressbook.rb
  /tmp/build/usr/lib/ruby/site_ruby/1.8/osx/appkit.rb
  /tmp/build/usr/lib/ruby/site_ruby/1.8/osx/cocoa.rb
  /tmp/build/usr/lib/ruby/site_ruby/1.8/osx/foundation.rb
  /tmp/build/usr/lib/ruby/site_ruby/1.8/powerpc-darwin8.0/rubycocoa.bundle
  /tmp/build/Library/Frameworks/RubyCocoa.framework
  /tmp/build/Developer/ProjectBuilder Extras/File Templates/Ruby
  /tmp/build/Developer/ProjectBuilder Extras/Project Templates/ \
          Application/Cocoa-Ruby Application
  /tmp/build/Developer/ProjectBuilder Extras/Project Templates/ \
          Application/Cocoa-Ruby Document-based Application
  /tmp/build/Developer/Examples/RubyCocoa
  /tmp/build/Developer/Documentation/RubyCocoa


== ��ȯư���ǧ�Ķ�

�ʲ��δĶ��ǳ�ȯư���ǧ�򤷤Ƥ��ޤ���

* PowerBook G4/1.67/640MB
* Mac OS X 10.4.8 (ppc)
  * XcodeTools 2.4
  * ruby-1.8.2 (pre-installed in Mac OS X 10.4)
  * ruby-1.8.5

== �ǤϤ��ڤ��ߤ�������

���ۡ������ǥ�����ơ����䡢����ʤɤʤ�Ǥⵤ�ڤ˶����Ƥ���������


$Date$
