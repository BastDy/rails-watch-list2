class ListsController < ApplicationController
  before_action :list, only: [:show]


  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_lists)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list
    @list = List.find(params[:id])
  end

  def params_lists
    params.require(:list).permit(:name)
  end
end
