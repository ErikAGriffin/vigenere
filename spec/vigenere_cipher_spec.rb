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
    cipher.lengthen_password("FREEDOM")
    expect(cipher.phrase).to eq "FREEDO MF REED"
  end

  it 'should reject passphrases that are not alpha-numeric' do
    input = 'Bad-phrase'
    expect{cipher.use_password(input)}.to raise_error 'ERROR: Non-alphanumeric pass'
  end

  it 'should shift each letter of the message by the appropriate amount' do

    #         FREEDO MF REED
    #         Attack at dawn
    #         ==============
    result = 'fkxefy my ueaq'

    cipher.input(message)
    cipher.use_password(password)
    expect(cipher.encrypt).to eq result

  end






end
