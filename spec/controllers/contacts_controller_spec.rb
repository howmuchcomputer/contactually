require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  # authentication is required
  login_user

  let(:valid_attributes) {
    FactoryGirl.attributes_for(:contact)
  }

  let(:invalid_attributes) {
    {
      first_name: "",
      last_name: ""
    }
  }

  describe "GET #index" do
    it "assigns all contacts as @contacts" do
      contact = create(:contact, user: controller.current_user) 
      get :index, params: {}
      expect(assigns(:contacts)).to eq([contact])
    end
  end

  describe "GET #show" do
    it "assigns the requested contact as @contact" do
      contact = create(:contact, user: controller.current_user) 
      get :show, id: contact.to_param
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "GET #new" do
    it "assigns a new contact as @contact" do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe "GET #edit" do
    it "assigns the requested contact as @contact" do
      contact = create(:contact, user: controller.current_user) 
      get :edit, id: contact.to_param
      expect(assigns(:contact)).to eq(contact)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contact" do
        expect {
          post :create, contact: valid_attributes
        }.to change(Contact, :count).by(1)
      end

      it "assigns a newly created contact as @contact" do
        post :create, contact: valid_attributes
        expect(assigns(:contact)).to be_a(Contact)
        expect(assigns(:contact)).to be_persisted
      end

      it "redirects to the created contact" do
        post :create, contact: valid_attributes
        expect(response).to redirect_to(Contact.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contact as @contact" do
        post :create, contact: invalid_attributes
        expect(assigns(:contact)).to be_a_new(Contact)
      end

      it "re-renders the 'new' template" do
        post :create, contact: invalid_attributes
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for(:contact, first_name: "Johnny", last_name: "Nash")
      }

      it "updates the requested contact" do
        contact = create(:contact, user: controller.current_user) 
        put :update, id: contact.to_param, contact: new_attributes
        contact.reload
      end

      it "assigns the requested contact as @contact" do
        contact = create(:contact, user: controller.current_user) 
        put :update, id: contact.to_param, contact: valid_attributes
        expect(assigns(:contact)).to eq(contact)
      end

      it "redirects to the contact" do
        contact = create(:contact, user: controller.current_user) 
        put :update, id: contact.to_param, contact: valid_attributes
        expect(response).to redirect_to(contact)
      end
    end

    context "with invalid params" do
      it "assigns the contact as @contact" do
        contact = create(:contact, user: controller.current_user) 
        put :update, id: contact.to_param, contact: invalid_attributes
        expect(assigns(:contact)).to eq(contact)
      end

      it "re-renders the 'edit' template" do
        contact = create(:contact, user: controller.current_user) 
        put :update, id: contact.to_param, contact: invalid_attributes
        expect(response).to render_template("edit")
      end
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
