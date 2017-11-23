class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end
  
  def create 
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = nil
    @wiki.user = current_user
    
    if @wiki.save
      flash[:notice] = "Wiki page was saved successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the Wiki page. Please try again."
      render :new
    end
  end

  def edit
  end
end
