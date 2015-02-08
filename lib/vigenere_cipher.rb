class VigenereCipher

  attr_accessor :message
  attr_accessor :phrase

  def initialize
    @char_array = [*'a'..'z']
  end

  def input(message)
    @message = message.downcase
  end

  def use_password(phrase)
    @phrase = ""
    i = 0
    @message.chars.each do |x|
      if x == " "
        @phrase << " "
      else
        @phrase << phrase.upcase[i]
        i += 1
        i = i%phrase.length
      end
  end


end
