require './lib/vigenere_cipher'




cipher = VigenereCipher.new


puts 'Welcome.'
puts 'Input message to be encrypted'
cipher.input_message(gets.chomp)
puts 'Input Passphrase to be used'
cipher.use_password(gets.chomp)
puts cipher.encrypt
