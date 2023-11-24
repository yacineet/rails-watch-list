class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark)
  end
end
