# -*- mode:ruby; indent-tabs-mode:nil -*-
#
#  oc_bundle_support.rb
#  RubyCocoa
#  $Id$
#
#  Copyright (c) 2007 FUJIMOTO Hisakuni

module OSX

  if not NSBundle.respondsToSelector?('_originalBundleForClass:') then
    NSBundle.objc_alias_class_method '_originalBundleForClass:', 'bundleForClass:'
    class NSBundle
      def NSBundle.bundleForClass(cls)
        OSX::NSClassFromString("NSObject") # some magic to suppress error,
                                           # i can't see why this effects.
        bdl = OSX::BundleSupport.bundle_for_class(cls)
        bdl ||= self._originalBundleForClass(cls)
        return bdl
      end
    end
    NSBundle.objc_class_method 'bundleForClass:', [:id, :class]
  end

  module BundleSupport

    def init_for_bundle
      bdl, prm = _current_bundle
      logger = Logger.new(bdl)
      logger.info("init_for_bundle ...")
      ret = yield(bdl, prm, logger)
      logger.info("init_for_bundle done.")
      ret
    rescue Exception => err
      logger.error(err)
      logger.info("init_for_bundle failed.")
      raise
    end
    module_function :init_for_bundle

    private
    class Logger
      def initialize(bdl)
        @bundle_name  = bdl.to_s.sub(/^.*<(.*)>.*$/,'\1').split('/').last
        @process_name = OSX::NSProcessInfo.processInfo.processName
      end

      def info(fmt, *args)
        OSX.NSLog("#{@bundle_name} (#{@process_name}): #{fmt % args}")
      end
      
      def error(err)
        info("*ERROR* - %s", err)
        err.backtrace.each { |s| loginfo("    %s", s) }
      end
    end
  end

  def init_for_bundle
    BundleSupport.init_for_bundle { |*x| yield(*x) }
  end
  module_function :init_for_bundle

end
