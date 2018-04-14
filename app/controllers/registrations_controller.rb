class RegistrationsController < Devise::RegistrationsController
  
  def create
   build_resource(sign_up_params)

   resource.save
   yield resource if block_given?
  if resource.persisted?
    if resource.active_for_authentication?
      set_flash_message! :notice, :signed_up
      sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
      expire_data_after_sign_in!
      respond_with resource, location: after_inactive_sign_up_path_for(resource)
    end
  else
    clean_up_passwords resource
    set_minimum_password_length
    response_to_sign_up_failure resource    
  end
  end

private

def response_to_sign_up_failure(resource)
  if resource.email == "" || resource.password == nil || resource.first_name == "" || resource.last_name == "" || resource.phone == "" || resource.city == "" || resource.street == "" || resource.zip == "" || resource.state == ""
    redirect_to :back, alert: "Please fill out the form in its entirety. Make sure the email is unique and the passwords match."
  elsif User.pluck(:email).include? resource.email
    redirect_to :back, alert: "The email #{resource.email} already exists!"
  end
end


  protected

  def after_sign_up_path_for(resource)
    
  end
  
  def update_resource(resource, params)
    params.delete :current_password
    resource.update_without_password(params)
  end
end