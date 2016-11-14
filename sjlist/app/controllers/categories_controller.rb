class CategoriesController < ApplicationController
  include ApplicationHelper
  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find_by(id: params[:id])
    @posts = @category.posts.order(updated_at: :desc)
  end
end
