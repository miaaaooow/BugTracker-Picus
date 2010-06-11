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
        flash[:notice] = "#{@user.username} was successfully registered at Picus.<br/> Now You can login."
        #TODO send them a mail
        format.html { redirect_to(:controller => 'users', :action=>'index') } 
        format.xml { render :xml => @user, :location => @user }
      else
        flash[:notice] = "Some wrong params! Try again!"
        format.html { redirect_to(:action => 'new') }
        format.xml { render :xml => @user.errors }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml { render :xml => @user.to_xml }
    end
  end

  def update
    @user.update_attributes(params[:user])
    respond_to do |format|
      format.html { redirect_to(:controller =>'users') }
      format.xml { head :ok }
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to(:controller => 'users') }
      format.xml { head :ok }
    end
  end

end
