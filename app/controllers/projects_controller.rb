class ProjectsController < ApplicationController
  def index
    @projects = Project.find(:all)
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html
      format.xml { render :xml => @project }
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    #ALTER!!! This is just for testing
    params[:project][:user_id] = 1
    params[:project][:first_version_name] = "haha"


    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Your project was saved to Picus"
      format.html { redirect_to(@project) }
      format.xml { render :xml => @product, :location => @project }
    else
      format.html { render :action => "new" }
      format.xml { render :xml => @product.errors }
    end
  end

end
