Gem::Specification.new do |s|
  s.name = 'text_ru_api'
  s.version = '0.1'
  s.authors = ['Kinderly LTD', 'pustserg']
  s.email = 'pustserg@yandex.ru'
  s.homepage = 'https://github.com/kinderly/text_ru_api'
  s.summary = 'A wrapper for text.ru api'
  s.license = 'MIT'
  s.files = `git ls-files --{spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'httparty'
end
