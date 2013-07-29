require 'thor'

class Dictionary < Thor

  desc 'word WORD', 'Get meaning of the given WORD'
  def word(word)
  	fetcher = Fetch.new
    fetcher.meaning(word)
  end

end
