require 'version'
require 'yaml'
require 'digest/md5'
require 'cgi'

require File.dirname(__FILE__) + '/onepay/config'
require File.dirname(__FILE__) + '/onepay/request/alipay'
require File.dirname(__FILE__) + '/onepay/response/alipay'
require File.dirname(__FILE__) + '/onepay/request/swiftpass'
require File.dirname(__FILE__) + '/onepay/response/swiftpass'

module Onepay
  ADAPTER_TYPES = %w[alipay swiftpass]

  def self.build_request(adapter)
    case adapter
    when :alipay
      return Onepay::AlipayRequest.new
    when :swiftpass
      return Onepay::SwiftpassRequest.new
    end

    raise "Not vaid onepay adapter, it should be in #{ADAPTER_TYPES}"
  end

  def self.build_response(adapter, params)
    case adapter
    when :alipay
      return Onepay::AlipayRequest.new(params)
    when :swiftpass
      return Onepay::SwiftpassRequest.new(params)
    end

    raise "Not vaid onepay adapter, it should be in #{ADAPTER_TYPES}"
  end
end

if defined?(Rails)
  require File.dirname(__FILE__) + '/onepay/railtie'
end
