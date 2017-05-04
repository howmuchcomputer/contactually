class Api::V1::ContactsController < Api::V1::BaseController
  before_action :set_contact, only: [:update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    respond_with current_user.contacts.order(:email_address)
  end

  # POST /contacts
  # POST /contacts.json
  def create
    respond_with :api, :v1, Contact.create(contact_params.merge(user_id: current_user.id))
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    @contact.update(contact_params)
    respond_with contact, json: contact
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    respond_with @contact.destroy
  end

  def import
    Contact.import(params[:file])
    redirect_to :index, notice: "Import processed"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find_by(id: params[:id], user_id: current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email_address, :phone_number, :company_name)
    end
end
