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

    it "return a 200 status" do
      get contacts_path
      expect(response).to have_http_status(200)
    end

    it "should render the index template" do
      get contacts_path
      expect(response).to render_template(:index)
    end

    context "without contacts" do
      it "contacts should be empty" do
        get contacts_path
        expect(assigns[:contacts].empty?).to be_truthy 
      end
    end

    context "with contacts" do
      it "should load the user's contacts" do
        get contacts_path
        expect(assigns[:contacts]).to eq @user.contacts
      end
    end
  end
end
