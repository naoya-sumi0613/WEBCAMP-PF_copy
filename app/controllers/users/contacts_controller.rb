class Users::ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	@contact.save
  	redirect_to action: :done
  end

  def done
  end


  def contact_params
  	params.require(:contact).permit(:user_id, :title, :content, :status)
  end
end
