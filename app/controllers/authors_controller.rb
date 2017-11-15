class AuthorsController < ApplicationController
  before_action :authenticate_admin!

  # Edit action retrives the author and renders the edit page
  def edit
    @author = find_author
  end

  # Update action updates the author with the new information
  def update
    @author = find_author
    if @author.update_attributes(author_params)
      flash[:notice] = "Successfully updated author!"
      redirect_to root_path
    else
      flash[:alert] = "Error updating author!"
      render :edit
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :hometown, :hobbies, :introduction)
  end

  def find_author
    @author = Author.find(1)
  end
end