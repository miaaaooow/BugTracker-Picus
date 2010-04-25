class UsersController < ApplicationController
  def index
    @users = User.all

    respond_to do |f|
      f.html
      f.xml { render :xml => @users }
    end
  end
end
