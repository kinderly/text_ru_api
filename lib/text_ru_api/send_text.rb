module TextRuApi
  class SendText
    LIMITS = 100..15_000

    def initialize(text, params = { copying: 'noadd' })
      # в params  можно передать следующие параметры
      #
      # text - проверяемый текст на уникальность от 100 до 150000 символов
      #
      # exceptdomain - домены, которые вы хотите исключить из проверки.
      # Домены разделяются пробелами или запятыми
      #
      # excepturl - ссылки, которые вы хотите исключить из проверки.
      # Ссылки разделяются пробелами или запятыми
      #
      # visible - доступность результатов проверки другим пользователям.
      # По-умолчанию - результаты проверки
      # (http://text.ru/text_check/result/{ваш text_uid})
      # доступны только вашему аккаунту. Если вы хотите, чтобы результаты
      # проверок были открыты, необходимо передать значение vis_on
      #
      # copying - если вы не хотите, чтобы формировалась ссылка с
      # визуальным оформлением результатов проверки
      # http://text.ru/text_check/result/{ваш text_uid},
      # то необходимо передать значение noadd
      #
      # callback - ваш URL (ссылка), на которую мы отправим POST-запрос с
      # результатами проверки сразу же после её окончания.
      @text = text
      @params = params
    end

    def call(access_token = nil)
      if LIMITS.include?(@text.delete(' ').size)
        data = { text: @text }.merge(@params)
        Request.new(access_token).result(data).parsed_response
        # Возвращается
        # text_uid - уникальный идентификатор текста.
        # Используется при последующем получении результатов проверки.
        # "{\"text_uid\":\"5729bc0328209b\"}"
        # Или ошибка с описанием в JSON
        # "{\"error_code\":142,\"error_desc\":\"\\u041d\\u0435\\u0445\\u0432
        # \\u0430\\u0442\\u043a\\u0430 \\u0441\\u0438\\u043c\\u0432\\u043e\\
        # u043b\\u043e\\u0432\"}"
      else
        raise 'Text must be between 100 and 15000 chars'
      end
    end
  end
end
