require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  # authentication is required
  login_user

  describe "GET #index" do
    it "assigns all contacts as @contacts" do
      contact = create(:contact, user: controller.current_user) 
      get :index, params: {}
      expect(assigns(:contacts)).to eq([contact])
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contact" do
      contact = create(:contact, user: controller.current_user) 
      expect {
        delete :destroy, id: contact.to_param
      }.to change(Contact, :count).by(-1)
    end

    it "redirects to the contacts list" do
      contact = create(:contact, user: controller.current_user) 
      delete :destroy, id: contact.to_param
      expect(response).to redirect_to(contacts_url)
    end
  end
end
