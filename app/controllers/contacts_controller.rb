class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = current_user.contacts.order(:email_address)
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Contact.import(params[:file], current_user.id)
    redirect_to :back, notice: "Import processed"
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
