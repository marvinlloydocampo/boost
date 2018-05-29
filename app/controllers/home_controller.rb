class HomeController < ApplicationController
  def index
      return unless params['constant'].present?
      @cipher = params["cipher"]
      @encryptedtext = params["encrypted_text"]
      @originaltext = decipher(params)
  end
  
  def decipher(params)
    cipher = params["cipher"]
    constant =  params["constant"]
    encrypted_text = params["encrypted_text"]
    original_text = ''
    encrypted_text.each_char do |c|
      charindex =  cipher.index(c) || c
      original_text << (charindex.is_a?(Integer) ? constant[charindex] : charindex)
    end
    original_text
  end
end
