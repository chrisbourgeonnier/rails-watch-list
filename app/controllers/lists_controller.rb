class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = 'List successfully recorded.'
      redirect_to list_path(@list)
    else
      flash.now[:alert] = 'Unable to record your entry.'
      render :new, status: :unprocessable_entity # 422
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
