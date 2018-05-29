require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  
  let(:action) do
    get 'index', params: attributes
  end
  describe "GET #index" do
    context "with example number 1" do
      let(:attributes) do
        {
          "constant": "abcdefghijklmnopqrstuvwxyz",
          "cipher": "zodvqukgwefbyitmrsplhacxnj",
          "encrypted_text"=>"dzs"
        }
      end
       it "returns http success and originaltext should be decrypted" do
         action
         expect(response).to be_successful
         originaltext = assigns(:originaltext)
         expect(originaltext).not_to be_nil
         originaltext.should eq('car')
      end
    end
  end
end
