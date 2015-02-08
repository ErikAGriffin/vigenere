require 'vigenere_cipher'

describe 'VigenereCipher' do

  let(:cipher) {VigenereCipher.new}
  let(:message) {"Attack at dawn"}
  let(:password) {"FREEDOM"}

  it 'should take an input string and a passphrase' do
    cipher.input(message)
    cipher.use_password(password)

  end

  it 'passphrase should repeat for every non-" " character' do
    cipher.input(message)
    cipher.use_password("FREEDOM")
    expect(cipher.phrase).to eq "FREEDO MF REED"
  end




end
