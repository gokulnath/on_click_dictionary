require 'clipboard'

class Dictionary

  def start

    loop do
      word = Clipboard.paste 'primary'
      word.gsub!("\n",'') if word
        unless word && last_word(word)
        last_word(word)
        meaning = find_meaning(word)
        puts meaning if meaning
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

end
