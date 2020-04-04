#spec/caesar_cipher_spec.rb
require './lib/caesar_cipher'

RSpec.describe CaesarCipher do
  describe ".caesar_cipher" do
    it "returns the Caesar cipher of the given text with the given key" do
      expect(CaesarCipher.caesar_cipher("abcd", 2)).to eql("cdef")
    end

    it "returns the encryption wrapped after z" do
      expect(CaesarCipher.caesar_cipher("wxyz", 4)).to eql("abcd")
    end

    it "returns both wrapped and unwrapped characters" do
      expect(CaesarCipher.caesar_cipher("wxef", 4)).to eql("abij")
    end

    it "returns the encryption respecting case" do
      expect(CaesarCipher.caesar_cipher("AeZT", 4)).to eql("EiDX")
    end

    it "returns the encryption ignoring numbers, punctuation, and spaces" do
      expect(CaesarCipher.caesar_cipher("F'x 1Nz", 1)).to eql("G'y 1Oa")
    end
  end
end