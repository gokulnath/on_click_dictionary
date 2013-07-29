require 'wordnik'


class Fetch

  def initialize
    Wordnik.configure do |config|
     	config.api_key = Common.settings[:wordnick_api_key]
    end
  end

  def meaning(word)
    definition = Wordnik.word.get_definitions(word).first # wordnik returans an array of all defnitions
    definition['text']
  end

end
