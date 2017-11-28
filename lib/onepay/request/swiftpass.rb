require 'rest-client'
require 'active_support/core_ext/hash/conversions'
require 'active_support/logger'

module Onepay
  class SwiftpassRequest
    GATEWAY_URL = 'https://pay.swiftpass.cn/pay/gateway'.freeze

    attr_accessor :title, :total_fee, :order_id

    def url
      params = {
        service: 'pay.weixin.wappay',
        mch_id: Onepay.config['swiftpass']['mch_id'],
        out_trade_no: @order_id,
        body: @title,
        total_fee: @total_fee,
        mch_create_ip: Onepay.config['swiftpass']['mch_create_ip'],
        notify_url: Onepay.config['swiftpass']['notify_url'],
        device_info: 'iOS_WAP',
        mch_app_name: '给玩',
        mch_app_id: 'com.geiwan666',
        nonce_str: SecureRandom.uuid.tr('-', '')
      }

      params = params.merge(sign: md5_sort(params))

      resp = RestClient.post(
        GATEWAY_URL,
        xmlify_payload(params),
        {
          accept: :xml
        }
      )

      Rails.logger.fatal GATEWAY_URL
      Rails.logger.fatal xmlify_payload(params)
      Rails.logger.fatal resp.body

      result = Hash.from_xml(resp.body)
      if result['xml']['status'] == '0' && result['xml']['result_code'] == '0'
        return result['xml']['pay_info']
      end

      nil
    end

    private

    def md5_sort(hash)
      keys = hash.keys.sort.map do |k|
        "#{k}=#{hash[k]}"
      end

      Digest::MD5.hexdigest(keys.join('&') + '&key=' + Onepay.config['swiftpass']['key']).upcase
    end

    def xmlify_payload(params)
      "<xml>#{params.map { |k, v| "<#{k}>#{v}</#{k}>" }.join}</xml>"
    end
  end
end
