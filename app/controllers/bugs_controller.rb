class BugsController < ApplicationController
  def index
  end

  def new
    @project = Project.new(params[:project])
  end

  def edit
  end

  def create
  end

end
