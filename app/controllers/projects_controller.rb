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
    
    params[:project][:user_id] = session[:user]

    if first_version_name
      @project = Project.new(params[:project])

      if @project.save
        @version = Version.new({:name => first_version_name,
                              :user_id => session[:user],
                              :project_id => @project.id })

        PicusNotificator.deliver_project_created(@project)
        @version.save
        flash[:notice] = "Your project was saved to Picus"
        respond_to do |format|
          format.html { redirect_to(@project, :controller => 'projects', :action => 'show') }
          format.xml { render :xml => @project }
        end
      else
        respond_to do |format|
          format.html { redirect_to(@project) }
          format.xml { render :xml => @project.errors }
        end
      end
    else 
      flash.now[:notice] = "It is important to add a first version's name."
    end
  end

  def show
    @project = Project.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @project }
    end
  end

  def destroy
    @project = Project.find_by_id(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml { head :ok }
    end
  end
end
