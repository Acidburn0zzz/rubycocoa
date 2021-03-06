
# NEWS

## 2.0.0の変更点(1.2.0から): 2017-07-XX

### 改良

  * RubyCocoaは以下の2通りの形式で配布されます。
    * gem "rubycocoa": rubyスクリプトから利用する場合に使います。
    * RubyCocoa.framework: XcodeでmacOS用のアプリケーションを開発するときに使います。

### 廃止された機能

  * Objective-Cのクラス"RBObject"は廃止されました。内部利用のみのクラスとなります。

### 修正

  * macOS 10.12または10.11に付属するrubyで`require "osx/cocoa"`したときにSEGVする問題を修正。

## 1.1.0から1.2.0の変更点: 2014-07-27

### 改良

  * ruby-2.0に対応しました。おおむねruby-1.8と同様に動作します。
    * RubyCocoaのインストーラはruby-1.8用と2.0用で別々のファイルとして
      リリースされます。RubyCocoaアプリケーションをOS X 10.9添付のruby-2.0で
      動作させてみたいときは、RubyCocoa.frameworkを入れ替えてください。
  * 存在しないメソッドが呼び出されたときの例外をNoMethodErrorに変更しました。
    (以前はOSX::OCMessageSendExceptionでした。)

### 廃止された機能

  * CocoaClass#objc_export()は廃止されました。objc_method()を使ってください。
  * OSX::NSObject#ocm_responds?()は廃止される予定です。ocm_respond_to?()を使ってください。
  * OSX::NSData#dataWithRubyString()およびOSX::NSMutableData#dataWithRubyString()は
    廃止される予定です。[NSString dataUsingEncoding:]を使ってください。

### 修正

  * Yosemite DP上でのビルドエラーを修正しました。

### RubyCocoaをRuby-2.0上で使う際の注意

  * ruby-2.xの文字列はエンコーディングを保持するようになります。詳しくは
    https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/MigrationIssuesFrom18 や
    http://magazine.rubyist.net/?0025-Ruby19_m17n をごらんください。
  * (frameworkでない)bundleやdylibのObjective-CのクラスをRubyのコードで
    拡張したいときは、OSX.ns_importを書くようにしてください。

        require 'path/to/your_bundle.bundle'
        OSX.ns_import :YourClass
        module OSX
          class YourClass
            : # extend class in Ruby code
          end
        end
        
## 1.0.7から1.1.0の変更点: 2013-11-17

### 改良

  * Xcode 5の"Modules"に対応。
  * Objective-CとRubyオブジェクトのキャッシュをグローバル変数
    $RUBYCOCOA_USE_OC2RBCACHEで無効にできるようになりました。[Experimental]
    この機能は、NSTableViewのdelegateなどでときどきキャッシュとRubyのGCで
    不整合が発生してアプリケーションがクラッシュしてしまうケースを回避する
    ために使用することができます。

### 修正

  * standaloneify.rbがruby-2.0またはrubygems-2.1でエラーになる問題を修正。
  * Objective-CのオブジェクトをObject#dupしたときSEGVする問題を修正。

### 廃止された機能

  * Objective-Cのクラス"RubyCocoa"は廃止されました。
    Objective-Cからrubyを呼び出すには、ランタイム関数を使ってください。
    それぞれ対応する関数は次のとおりです。

      - bundleInitWithProgram:class:param: -> RBBundleInit()
      - applicationInitWithProgram:argc:argv:param: -> RBApplicationInit()
      - applicationMainWithProgram:argc:argv: -> RBApplicationMain()

  * NSString|Stringの"NKF"拡張ライブラリを使っているメソッドを廃止しました。

      - NSString.guess_nsencoding
      - NSString.guess_encoding
      - NSString.stringWithRubyString
      - NSMutableString.stringWithRubyString
      - String.nsencoding

### 備考

  * Mac OS X 10.5 or earlier not supported.

## 1.0.6から1.0.7の変更点: 2013-10-26

### 修正

  * 10.9 Mavericksでボックス化されたObjective-Cのオブジェクトが
    Ruby側で誤った型(OSX::CFTypeRef)に変換されてしまうことがある問題を修正。

## 1.0.5から1.0.6の変更点: 2012-12-31

### 修正

  * RubyCocoa 1.0.5でアプリケーションが起動しないことがある問題を修正しました。
  * standaloneify.rbで生成したアプリがrubygems 1.3.2以降で起動しない問題を修正しました。

## 1.0.4から1.0.5の変更点: 2012-10-07

### 改良

  * Xcode 4.2-4.5に最適化したプロジェクトテンプレートも用意しました。
    以下のコマンドで ~/Library/Developer/Xcode 以下にテンプレートがインストールできます。

      $ ruby /Developer/Documentation/RubyCocoa/Templates/install_templates.rb Xcode4.x

### 修正

  * standaloneify.rbが動作しなくなっていた問題を修正しました。

### 削除

  * osx/active_record.rbは削除されました。


## 1.0.3から1.0.4の変更点: 2012-08-27

### 修正

  * RubyCocoa-1.0.3の初期化時のメモリリークを修正しました。
  * ネストしたフレームワークのbridgesupportファイルが読み込まれない
    問題を修正しました。 たとえば、
    QuartzCore.framework/Frameworks/CoreImage.framework などです。


## 1.0.2から1.0.3の変更点: 2012-08-26 (Not released)

### 改良

  * 環境変数RUBYCOCOA_DEBUGをセットするとデバッグモードになるようにしました。
  * Xcode 4.x用のプロジェクトテンプレートを用意してみました。[Experimental]
    テンプレートは ~/Library/Developer/Xcode/Templates 以下に配置する必要が
    あります。
    以下のコマンドでテンプレートを使用することができます。

        $ svn export --force https://rubycocoa.svn.sourceforge.net/svnroot/rubycocoa/trunk/src/template/Xcode4.x/Templates ~/Library/Developer/Xcode/Templates


### 修正

  * Xcode-4の"Run"ボタンでRubyCocoaアプリを起動すると以下のエラーで
    起動できない問題を修正しました。

        "invalid option -N (-h will show valid options)".
        Now RubyCocoa apps do not process commandline options such as "-d".

    LionのOS付属のRubyCocoaでこの問題を回避するためには、以下のように
    main.mとrb_main.rbを修正してください。

        diff -ur old/main.m new/main.m
        --- old/main.m  2011-11-19 15:49:58.000000000 +0900
        +++ new/main.m  2011-11-19 15:49:16.000000000 +0900
        @@ -11,5 +11,6 @@
         
         int main(int argc, const char *argv[])
         {
        -    return RBApplicationMain("rb_main.rb", argc, argv);
        +    RBApplicationInit("rb_main.rb", argc, argv, nil);
        +    return NSApplicationMain(argc, argv);
         }
        diff -ur old/rb_main.rb new/rb_main.rb
        --- old/rb_main.rb      2011-11-19 15:49:58.000000000 +0900
        +++ new/rb_main.rb      2011-11-19 15:49:16.000000000 +0900
        @@ -17,7 +17,4 @@
           end
         end
         
        -if $0 == __FILE__ then
        -  rb_main_init
        -  OSX.NSApplicationMain(0, nil)
        -end
        +rb_main_init

    RBApplicationInit()はバージョン0.12.0から利用できる関数です。
    (LeopardのRubyCocoaのバージョンは0.13)

  * NSBundle.loadNibNamed_owner(nibname, owner)がLion以降で例外が起きて
    しまう問題を修正しました。

## 1.0.1から1.0.2の変更点: 2011-08-31

### 改良

  * OSX.load_plist() がバイナリのplistデータを受け取れるようにした。

### 修正

  * Lion
     * NSDataやRubyのバイト文字列などを扱おうとするとSEGVする問題を修正。　
     * opaqueオブジェクトがABRecordRefになってしまう問題を修正。
     * install.rbでのビルドでエラーになる問題を修正。
  * x86_64
     * 配列を含む小さな構造体（たとえばNSDecimal）を受け渡しするとSEGVする
       問題を修正。

## 1.0.0から1.0.1の変更点: 2009-10-18

### 改良

  * 10.5用にビルドしたRubyCocoa.frameworkが10.6でも動作するようにした

      $ ruby install.rb config \
             --macosx-deployment-target=10.5 \
             --sdkroot=/Developer/SDKs/MacOSX10.5.sdk \
             --target-archs="ppc i386"
      $ ruby install.rb setup

  * NSStringをHashのキーとして利用できるようにした

      str1 = OSX::NSString.alloc.initWithString("a")
      str2 = OSX::NSString.alloc.initWithString("a")
      hash = {}
      hash[str1] = 1
      hash[str2] = 2
      p hash[str1] # => 2

  * ユニバーサルバイナリ用のビルドシステムを見直し
     * configオプション"--build-universal"を廃止
     * configオプション"--target-archs"を導入

        old) ruby install.rb config --build-universal=yes
        new) ruby install.rb config --target-archs="i386 x86_64 ppc"

  * プロジェクトテンプレートをXcode 3.x用に更新

### 修正

  * Snow Leopard
     * 次のようなメッセージでアプリケーションが停止してしまう問題を修正
       "Assertion failed: (ctx->autoreleasePool ..."
     * NSUndoManagerで呼び出しベースのアンドゥ管理をするときのエラーを修正
  * x86_64
     * OSX::NSNotFoundの値を訂正 (Foudation.bridgesupportの値が誤り)
     * デバッグログ出力で整数値が正しくない値を出力することがある問題を修正
     * BridgeSupportファイルから64bit値を得るときの処理を修正
  * その他
     * irbでrequire "osx/cocoa"したときにSEGVする問題を修正

