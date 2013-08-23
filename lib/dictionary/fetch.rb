require 'wordnik'


class Fetch

  def initialize
    Wordnik.configure do |config|
      config.api_key = Common.settings[:wordnick_api_key]
    end
  end

  def meaning(word)
    begin
      definition = Wordnik.word.get_definitions(word).first # wordnik returans an array of all defnitions
    rescue ClientError => e
      puts e.message
    rescue ServerError => e
      puts e.message
    rescue NoMethodError => e
      puts e.message
    end

    begin
      return definition['text'] if definition
    rescue TypeError => e
      puts e.message  
    end 
  end

end
