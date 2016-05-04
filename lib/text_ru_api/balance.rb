module TextRuApi
  class Balance
    BALANCE_URL = 'http://api.text.ru/account'

    def initialize(access_token = nil)
      @access_token = access_token || ENV['TEXT_RU_API_TOKEN']
    end

    def call
      data = { userkey: @access_token, method: 'get_packages_info' }
      HTTParty.post(BALANCE_URL, body: data).parsed_response
      # Возвращает закодированную JSON строку
      # "{\"size\":14872}"
      # где 14872 - количество оставшихся символов в пакете
    end
  end
end
