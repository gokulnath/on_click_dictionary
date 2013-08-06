require 'clipboard'

class Dictionary

  def start

    loop do
      word = Clipboard.paste 'primary'
      format(word) if word
      unless word && last_word(word)
        last_word(word)
        meaning = find_meaning(word)
        notify(word, meaning) if meaning
      end
      sleep 2
    end

  end

  private

  def find_meaning(word)
    fetcher = Fetch.new
    fetcher.meaning(word)
  end

  def last_word(word)
    @last_word ||= nil
    return true if @last_word == word
    @last_word = word
    false 
  end

  def notify(word, meaning)
    Libnotify.show(:body => word, :summary => meaning, :timeout => 1)
  end

  def format(word)
    word.gsub!("\n",'')
    word.downcase!
  end

end
