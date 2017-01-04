class SuggestionsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :load_categories, only: [:new, :create]
  
  def index
    @suggestions = current_user.suggestions.order_date_desc
      .paginate page: params[:page], per_page: Settings.suggestion.per_page
  end
  
  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = current_user.suggestions.new suggestion_params
    if @suggestion.save
      flash[:success] = t "suggestions.create.create_success"
      redirect_to suggestions_url
    else
      flash[:danger] = t "suggestions.create.create_error"
      render :new
    end
  end

  def destroy
    if @suggestion.destroy
      flash[:success] = t "suggestions.destroy.destroy_success"
    else
      flash[:danger] =  t "suggestions.destroy.destroy_error"
    end
    redirect_to suggestions_url
  end

  private
  def suggestion_params
    params.require(:suggestion).permit :product, :image, :category_id, :description
  end

  def load_categories
    @categories = Category.all
  end
end
