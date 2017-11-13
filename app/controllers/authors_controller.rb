class AuthorsController < ApplicationController
  before_action :authenticate_admin!

  # Index action to render all authors
  def index
    @authors = Author.all
  end

  # New action for creating author
  def new
    @author = Author.new
  end

  # Create action saves the author into database
  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Successfully created author!"
      redirect_to post_path(@author)
    else
      flash[:alert] = "Error creating new author!"
      render :new
    end
  end

  # Edit action retrives the author and renders the edit page
  def edit
  end

  # Update action updates the author with the new information
  def update
    if @author.update_attributes(author_params)
      flash[:notice] = "Successfully updated author!"
      redirect_to post_path(@authors)
    else
      flash[:alert] = "Error updating author!"
      render :edit
    end
  end

  # The show action renders the individual author after retrieving the the id
  def show
    @author = find_post
  end

  # The destroy action removes the author permanently from the database
  def destroy
    if @author.destroy
      flash[:notice] = "Successfully deleted author!"
      redirect_to authors_path
    else
      flash[:alert] = "Error updating author!"
    end
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end

  def find_post
    @author = Author.find(params[:id])
  end
end