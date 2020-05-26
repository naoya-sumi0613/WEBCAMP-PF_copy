class Admins::ContactsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @contacts = Contact.page(params[:page]).per(10)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update_attributes(status: contact_params[:status])
    redirect_to admins_contacts_path
  end

  def destroy
    @contacts= Contact.find(params[:id])
    @contacts.destroy
    redirect_to admins_contacts_path
  end


  def contact_params
    params.require(:contact).permit(:user_id, :title, :content, :status)
  end

end
