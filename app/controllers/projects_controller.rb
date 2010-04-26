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
    #first_version_name = params[:version][:first_version_name]
#TEMPORARY - CHANGE
    first_version_name = "default" 
#    session[:project].delete(:first_version_name)

    if first_version_name
      @project = Project.new(params[:project])

      if @project.save
        @version = Version.new({:name => first_version_name,
                              :user_id => session[:user][:user_id],
                              :project_id => @project.id })
        @version.save
        flash[:notice] = "Your project was saved to Picus"
        format.html { redirect_to :controller => 'projects', :action => 'show' }
        format.xml { render :xml => @roject, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @project.errors }
      end
    else 
      flash.now[:notice] = "It is important to add a first version's name."
    end
  end

end
