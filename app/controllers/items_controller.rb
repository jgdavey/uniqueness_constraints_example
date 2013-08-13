class ItemsController < ApplicationController
  expose(:list)
  expose(:items) { list.items }
  expose(:item, attributes: :item_params, model: ListItem, ancestor: :items)

  respond_to :json

  def create
    item.save
    respond_with item, location: lists_path
  end

  def sort
    items.update_positions(params[:list_item_ids])
    head :ok
  end

  private

  def item_params
    params.require(:list_item).permit(:name)
  end
end
