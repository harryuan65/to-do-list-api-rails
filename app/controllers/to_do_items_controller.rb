#
# To Do Item CRUD
#
class ToDoItemsController < ApplicationController
  def index
    render json: ToDoItem.all
  end

  def create
    ToDoItem.create!(to_do_item_params)
    head :no_content
  rescue ArgumentError => exception
    render json: {message: exception.message}, status: :bad_request
  end

  # @raise [ActiveRecord::RecordNotFound]
  def update
    fields = to_do_item_params
    id = fields.delete(:id)
    to_do_item = ToDoItem.find(id)
    to_do_item.update!(fields)

    head :no_content
  end

  # @raise [ActiveRecord::RecordNotFound]
  def destroy
    ToDoItem.find(to_do_item_params[:id]).destroy
    head :no_content
  end

  private

  def to_do_item_params
    params.permit(:id, :title, :status)
  end
end
