class ListsController < ApplicationController
  expose(:lists) { List.includes(:items) }
  expose(:list, attributes: :list_params)

  def index
  end

  def create
    list.save
    redirect_to lists_path
  end
  alias update create

  def list_params
    params.require(:list).permit(:name)
  end
end
