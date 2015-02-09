class VigenereCipher

  attr_accessor :message, :phrase, :status

  def initialize
    @lo_char_array = [*'a'..'z']
    @hi_char_array = [*'A'..'Z']
    @status = :encrypting
  end

  def input_message(text)
    self.message = text
  end

  def use_password(phrase)
    alphanumeric?(phrase) ? @phrase = phrase : raise('ERROR: Non-alphanumeric pass')
  end

  def alphanumeric?(input)
    !input.match /[^a-zA-Z0-9]/
  end

  def encrypt_using(password)
    use_password(password)
  end

  # -- Shifts the character by appropriate amount

  def shiftex(char,index)
    case char
      when /[a-z]/
        char = @lo_char_array[new_index(char,index)]
      when /[A-Z]/
        char = @hi_char_array[new_index(char,index)]
      when /[0-9]/
        char = ((char.to_i+charnum(@phrase[index]))%10).to_s
      else
        char
    end # case
  end

  def new_index(char,index)
    if status == :encrypting
      (charnum(char)+charnum(@phrase[index]))%26
    else
      (charnum(char)-charnum(@phrase[index]))%26
    end
  end

  def encrypt
    if !message
      raise 'No message to encrypt'
    end
    @status = :encrypting
    self.crypt
  end # def decrypt

  def decrypt
    if !message
      raise 'No message to encrypt'
    end
    @status = :decrypting
    self.crypt
  end # def decrypt

  def crypt
    lengthen_password(@phrase)
    index = 0
    result = ""
    self.message.chars.map do |x|
      x = shiftex(x,index)
      result << x
      index += 1
    end # self.map do
    @message = nil
    @phrase = nil
    result
  end # crypt

  def charnum(char)
    if char =~ /[0-9]/
      return char.to_i
    end
      @lo_char_array.index(char.downcase)
  end

  def lengthen_password(phrase)
    @phrase = ""
    i = 0
    self.message.chars.each do |x|
      if !alphanumeric?(x)
        @phrase << " "
      else
        @phrase << phrase.upcase[i]
        i += 1
        i = i%phrase.length
      end # if !alphanumeric
    end # self.chars do
  end
end
