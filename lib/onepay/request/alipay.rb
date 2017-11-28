require 'json'
require 'alipay'

module Onepay
  class AlipayRequest
    GATEWAY_URL = 'https://openapi.alipay.com/gateway.do?'.freeze

    attr_accessor :title, :total_fee, :order_id

    def url
      alipay_client = Alipay::Client.new(
        url: GATEWAY_URL,
        app_id: Onepay.config['alipay']['app_id'],
        app_private_key: Onepay.config['alipay']['private_key'],
        alipay_public_key: Onepay.config['alipay']['public_key']
      )

      alipay_client.page_execute_url(
        method: 'alipay.trade.wap.pay',
        notify_url: Onepay.config['alipay']['notify_url'],
        biz_content: {
          out_trade_no: @order_id,
          product_code: 'QUICK_WAP_WAY',
          total_amount: @total_fee,
          subject: @title
        }.to_json,
        timestamp: Time.now.strftime('%Y-%m-%d %H:%M:%S')
      )
    end
  end
end
