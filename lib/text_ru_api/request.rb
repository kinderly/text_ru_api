module TextRuApi
  class Request
    URL = 'http://api.text.ru/post'.freeze
    def initialize(access_token = nil)
      @access_token = access_token || ENV['text_ru_api_token']
    end

    def result(options = {})
      data = { userkey: @access_token }.merge(options)
      HTTParty.post(URL, body: data)
    end
  end
end
