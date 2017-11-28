module Onepay
  class Railtie < ::Rails::Railtie
    initializer "加载rails的配置文件" do
      Onepay.load_config
    end
  end
end
