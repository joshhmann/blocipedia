class CollaborationsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by(email: params[:search])
    
    if @user
      @collaboration = Collaboration.new(wiki: @wiki, user: @user)
      if @collaboration.save
        flash[:notice] = "Collaborator was saved."
        redirect_to wiki_path(@wiki)
      else
        flash.now[:error] = "There was an error saving the Collaborator. Please try again."
        render :new
      end
    else
      flash.now[:error] = "That was an invalid username. Please try again"
    end
    redirect_to wiki_path(@wiki)
  end
  

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.find(params[:id])
    if @collaboration.destroy
      flash[:notice] = "Collaborator removed"
      redirect_to @wiki
    else
      flash.now[:alert] = "Error"
      render :show
    end
    redirect_to wiki_path(@wiki)
  end
end
