require 'wordnik'

Wordnick.configure do
	config.api_key = Common.settings[:wordnick_api_key]
end

class Fetch
  def meaning(word)
  	Wordnick.word.get_definitions(word)
  end

end
