module TextRuApi
  class Request
    def initialize(access_token = nil)
      @access_token = access_token || ENV['text_ru_api_token']
    end
  end
end
