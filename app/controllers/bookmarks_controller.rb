class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id])
    if @bookmark
      @bookmark.destroy
      redirect_to list_path(@bookmark.list), notice: "Bookmark successfully deleted."
    else
      redirect_to lists_path, alert: "Bookmark not found."
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
