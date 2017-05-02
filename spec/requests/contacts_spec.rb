require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /contacts" do
    before :each do
      @user = create(:user)
      sign_in(@user)
    end

    after :each do
      sign_out(@user)
    end

    it "works! (now write some real specs)" do
      get contacts_path
      expect(response).to have_http_status(200)
    end
  end
end
