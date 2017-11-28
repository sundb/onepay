require 'spec_helper'
require './lib/onepay/config'
require './lib/onepay/request/alipay'

RSpec.describe Onepay::AlipayRequest do
  describe 'url' do
    it 'returns a url' do
      Onepay.config = {}
      Onepay.config['alipay'] = {}
      Onepay.config['alipay']['app_id'] = '2016090101831842'
      Onepay.config['alipay']['private_key'] = "-----BEGIN RSA PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCJtFuIXiGxZ4t5b4KOX/Os5i9cITrHnE+AmKgF4xUsNxouKsEsmpPoKnKrLl2E2fHEqR0FxGipSrdCxhSsbaXT3Oi70f4r1BcVuaEjHlKtWAvUMxrgRhev4aJmGrqNBZ4+mc/oi4HwcIeIvJHaPGbSJSWJae7WzlMOYERBbU5TvGcTzOdKYi8yh7LqQ23jVjYyFoKFxcbVKQMjrDepx830AGJKf2dagi1g7B+bfe4itTVSvhc7AGNep/A81eWzPIFNR05DcdeCdgCEkibTNblpSuRf19OfuacYcKuatOUZfRrFhPre3Dwr5IeIkvbq+cwsJfEJVmIrQWJjUNxB44zlAgMBAAECggEAOnxy3/FzCAE9eN9GqSfRvB6sAMpQR9V44tpzisSPCo+AvBkGoOYqadIVj+UKbVGP4QIexINOHJESUvcEctPDOb+6zYL8HCthfqWv7dWEMgGSTJdEE/tRNi90JT+2+gxn0JjNeCxAjRmORyIoJHPBDAIg9kMa4PsSxalXdB5zxRZA3CyqgpLSKd92SFzXZSc9enb050OQ+5Y7TcToI+M3mV2RlinjSHpy1BK9e0PL3SQaeYkMXzKvlsuTrh+KiLxpAvDrNgUr5FRjwmSZzihv4FW+iwIu2akeeA5duuk8U9XI8Or86WnWhGgI+B9x2LWkufl7+EP1cHfOXuVon9ugJQKBgQDNxvjSz5SWnkA/uWTORTWWjEa0VCJiDKVnBEWMkS/EvrAibbGLmMkbj94MBO0TTXQ0bzcuVEGqVNYFj98Q78Y5BtzrmUc1eLWJrXac0nA8y/8KHV0kUuOUYWQObCtETAcYDWdFXEScDwQ5qla4et2gjKk0RMxPdw1VQY+YaM0LBwKBgQCrUC42yq0txtIC59piydXPGRfCgvkBvSBNEu/l/vL/4uNPkHkyB+rVADsLhbSAXLe2oDoyr+JRPsQSHYi6JQsVcuu2hiW4+I9XiRXtUwAEOiMcWhvmtr2W4AYO9xbBNlyOI9w1jD4HQ8P0lOdFyPL2rdeH/PbEPWvOKZC1gLOxswKBgFRj3lWuVdSzT8wSfxns3j5AhxqbSoKFhyvJX7B3NmzsexWTgPWsEgXgqYKqXoPFBvweBDZWzZtKMX+Ucjni65slimKAuOhf+atd3UAROYBldNG0GyezaqvGiR81E0VuHJaroIecgHKz4dq4VdpQYSXfqeDKujN4spodSgOKL1TvAoGBAIhUhJKB9BMr19EMJZTcPlRTCb93byXdFil/2n3TyBmuu2qD9I7GEjFzv4lJ2/0Sy/h/xhC0O4ygQHSSIE7ST+G/1KkqVDbBR4FHzLVSif7TLUHQy8dswa+hk/Cw3eDgnANZslLCylIJsZWgMfQtGH0KlyzXOKGup24nUcu/IkFVAoGAJ4rRAIMCk6FktMxi0XLHujKc8rwQTmMZqAGnBGcZxWvvRHPr34l75Oxt2WAnhTJvOFSdlv22EbqbCU1+9WEE7peBbO/zPC2uraypRm/E3+nZBWg8iQs9A5S/72y6RkCh0LbMRIWf/iWwEO7ZZBs7Im4EsPGCt/hE7Rry3ZcobwM=\n-----END RSA PRIVATE KEY-----\n"
      Onepay.config['alipay']['public_key'] = "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAibRbiF4hsWeLeW+Cjl/zrOYvXCE6x5xPgJioBeMVLDcaLirBLJqT6Cpyqy5dhNnxxKkdBcRoqUq3QsYUrG2l09zou9H+K9QXFbmhIx5SrVgL1DMa4EYXr+GiZhq6jQWePpnP6IuB8HCHiLyR2jxm0iUliWnu1s5TDmBEQW1OU7xnE8znSmIvMoey6kNt41Y2MhaChcXG1SkDI6w3qcfN9ABiSn9nWoItYOwfm33uIrU1Ur4XOwBjXqfwPNXlszyBTUdOQ3HXgnYAhJIm0zW5aUrkX9fTn7mnGHCrmrTlGX0axYT63tw8K+SHiJL26vnMLCXxCVZiK0FiY1DcQeOM5QIDAQAB\n-----END PUBLIC KEY-----\n"
      Onepay::AlipayRequest.new.url
    end
  end
end
