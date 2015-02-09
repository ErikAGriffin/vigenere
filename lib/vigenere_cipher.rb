class VigenereCipher

  attr_accessor :message
  attr_accessor :phrase

  def initialize
    @lo_char_array = [*'a'..'z']
    @hi_char_array = [*'A'..'Z']
  end

  def alphanumeric?(input)
    if input.match /[^a-zA-Z0-9]/
      return false
    else
      return true
    end
  end


  def input(message)
    @message = message.downcase
  end

  def use_password(phrase)
    alphanumeric?(phrase) ? @phrase = phrase : raise('ERROR: Non-alphanumeric pass')
  end

  def ready?
    if message
      lengthen_password(@phrase)
      return true
    else
      raise 'No message to encrypt.'
    end
  end

  def encrypt
    if ready?
      index = 0
      encrypted_message = ""
      @message.chars.map do |x|


        if @lo_char_array.include? x
          x = @lo_char_array[(charnum(x)+charnum(@phrase[index]))%26]
        else
          if @hi_char_array.include? x
            x = @hi_char_array[(charnum(x)+charnum(@phrase[index]))%26]
          #else
          #  x
          end
        end

          encrypted_message << x
          index += 1

      end # map |x|

      encrypted_message
    end # if ready?
  end

  def charnum(char)
    @lo_char_array.index(char.downcase)
  end



  def lengthen_password(phrase)
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


end
