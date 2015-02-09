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


  def input_message(message)
    @message = message
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

  def encrypt_using(password)
    use_password(password)

  end

  # -- Shifts the character by appropriate amount

  def shiftex(char,index)
    if char.match /[a-z]/
      char = @lo_char_array[(charnum(char)+charnum(@phrase[index]))%26]
    else
      if char.match /[A-Z]/
        char = @hi_char_array[(charnum(char)+charnum(@phrase[index]))%26]
      else
        if char.match /[0-9]/
          char = (char.to_i + charnum(@phrase[index]))%10
        else
        char
        end
      end
    end
  end

  def encrypt
    if ready?
      index = 0
      encrypted_message = ""
      @message.chars.map do |x|

        x = shiftex(x,index)

          encrypted_message << x
          index += 1
      end # map |x|
      @message = nil
      @phrase = nil
      encrypted_message
    end # if ready?
  end

  def charnum(char)
    if char =~ /[0-9]/
      return char.to_i
    end
      @lo_char_array.index(char.downcase)
  end



  def lengthen_password(phrase)
    @phrase = ""
    i = 0
    @message.chars.each do |x|
      if !alphanumeric?(x)
        @phrase << " "
      else
        @phrase << phrase.upcase[i]
        i += 1
        i = i%phrase.length
      end
    end
  end


end
