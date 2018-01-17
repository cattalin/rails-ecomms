class CategoriesController < ApplicationController
  before_action :set_opinion, only: [:show]
  
  
  def index
    @categories = Category.all
  end
  
  def show
  end
  
  
  private
  
    def set_opinion
      @category = Category.find(params[:id])
    end
end
