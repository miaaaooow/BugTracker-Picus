class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |f|
      f.html
      f.xml { render :xml => @users }
    end 
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html
      format.xml { render :xml => @user }
    end
  end


  def create
    # The user is not Admin until another Admin made him such
    params[:user][:admin] = false
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = "#{@user.username} was successfully registered at Picus"
        #send them a mail
        format.html { redirect_to(:controller => 'projects', :action=>'index') } 
        format.xml { render :xml => @user, :location => @user }
      else 
        format.html{redirect_to(:action=>'new')}
        format.xml{render :xml => @user.errors}
      end
    end
  end
end
