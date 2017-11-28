module Onepay
  class << self
    attr_accessor :config
  end

  def self.load_config
    begin
      filename = File.expand_path(Rails.root.to_s + '/config/onepay.yml')
      @config = YAML.safe_load(File.open(filename))[Rails.env]
    rescue Exception => e
      puts <<-EXAMPLE
      ---
      development:
        alipay:
          parter: 12111XXXX
          key: XXXXXXX
          seller_email: XXXXX@XXXXX.com
        swiftpass:
          appid: wxd678efh567hg6787
          mch_id: 1230000109
      EXAMPLE
      raise "Please configure your Onepay settings in #{filename}."
    end
  end
end
