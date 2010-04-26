class AdministrationController < ApplicationController
  def login
    if request.post?
      user = User.authenticate(params[:user][:username], params[:user][:password])
      if user
        session[:user] = user.id
        session[:user_name] = user.name
        session[:admin] = user.admin?
        redirect_to(:controller => 'projects', :action => 'index')
      else
        flash.now[:notice] = "Incompatible username and password"
      end
    end  
  end
  
  def logout
    session[:user] = nil
    session[:user_name] = nil
    session[:admin] = nil
    redirect_to(:controller => 'projects', :action => 'index')
  end

  def users
  end  
end
