require './lib/vigenere_cipher'

cipher = VigenereCipher.new

def prompt_user(cipher)
  cipher.input_message(gets.chomp)
  puts 'Input key'
  cipher.use_password(gets.chomp)
end

choice = 'What life gives you'

puts 'Welcome.'
while choice != ""
  puts 'To encrypt push 1, to decrypt push 2'
  choice = gets.chomp
  case choice.to_i
    when 1
      puts 'Input message to be encrypted'
      prompt_user(cipher)
      puts cipher.encrypt
    when 2
      puts 'Input coded message'
      prompt_user(cipher)
      puts cipher.decrypt
    else
      puts 'Enter either 1 or 2, or ENTER to exit'
  end
end
