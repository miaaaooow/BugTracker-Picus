class VersionsController < ApplicationController
  def index
    @versions = Versions.find(:condions => ["project_id = ?", session[:project][:name]], 
                              :order => "created_at DESC" )
  end

  def new
  end

  def show
  end

  def create
  end

  def destroy
  end

end
