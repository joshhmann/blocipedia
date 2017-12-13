class WikisController < ApplicationController
 before_action :authenticate_user!, except: [:index, :show]
  def index
    @wikis = Wiki.visible_to(current_user)
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    
    unless @wiki.private == false || current_user
    flash[:alert] = "You must be signed in to view private topics."
    redirect_to wikis_path
    end
    authorize @wiki
    
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end
  
  def create 
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    authorize @wiki
    
    if @wiki.save
      flash[:notice] = "Wiki page was saved successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the Wiki page. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    authorize @wiki
    
    if @wiki.save
      flash[:notice] = "Wiki page was updated successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "Tehre was an error saving your page. Please try again."
      render :edit
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the page."
      render :show
    end
  end
  
      private 
  
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
    end
end
