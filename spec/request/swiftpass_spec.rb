require 'spec_helper'
require './lib/onepay/config'
require './lib/onepay/request/swiftpass'

RSpec.describe Onepay::SwiftpassRequest do
  describe 'url' do
    it 'returns a url' do
      Onepay.config = {}
      Onepay.config['swiftpass'] = {}
      Onepay.config['swiftpass']['key'] = 'e5a4e1398def0cf7e7c0b36264321355'
      Onepay.config['swiftpass']['mch_id'] = '102514342409'
      Onepay.config['swiftpass']['mch_create_ip'] = '127.0.0.1'
      Onepay.config['swiftpass']['notify_url'] = '127.0.0.1'
      req = Onepay::SwiftpassRequest.new
      req.total_fee = 1
      req.title = 'title'
      req.order_id = SecureRandom.uuid.tr('-', '')
      p req.url
    end
  end
end
