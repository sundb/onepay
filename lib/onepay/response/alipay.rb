module Onepay
  class AlipayResponse
    attr_reader :order_id, :total_fee, :extra_param

    def initialize(params)
      @params = params
      @order_id = params['out_trade_no']
      @total_fee = params['total_fee'].to_f
      @extra_param = params['extra_common_param']
    end

    def successful?
      sign = md5_sort(filter_params(@params))
      @params['trade_status'] == 'TRADE_SUCCESS' && sign == @params.sign
    end

    def success_response
      'success'
    end

    private

    def filter_params(params)
      params.dup.delete_if do |k, v|
        k == 'controller' || k == 'action' || k == 'sign' || k == 'sign_type' || v.blank? 
      end
    end

    def md5_sort(hash)
      keys = hash.keys.sort.map do |k|
        "#{k}=#{hash[k]}"
      end

      Digest::MD5.hexdigest(keys.join('&') + Onepay.config['alipay']['key']).downcase
    end
  end
end
