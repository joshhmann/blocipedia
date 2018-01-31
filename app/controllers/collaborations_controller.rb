class CollaborationsController < ApplicationController

  
  def create
    wiki = Wiki.find(params[:wiki_id])
    user = User.find_by(email: params[:search])
    
    if user
      collaboration = Collaboration.new(wiki: wiki, user: user)
      authorize collaboration
      if collaboration.save
        flash[:notice] = "Collaborator was saved."
        redirect_to wiki_path(wiki)
      else
        flash.now[:error] = "There was an error saving the Collaborator. Please try again."
      end
    end
  end
  

  def destroy
    collaboration = Collaboration.find(params[:id])
    authorize collaboration
    wiki = collaboration.wiki
    if collaboration.destroy
      flash[:notice] = "Collaborator removed"
      redirect_to wiki
    else
      flash.now[:alert] = "Error"
      render :show
    end
  end
end
