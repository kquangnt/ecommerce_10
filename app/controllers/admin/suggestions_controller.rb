class Admin::SuggestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @processing_suggestions = Suggestion.processing.order_date_desc
      .paginate page: params[:page], per_page: Settings.suggestion.per_page
    @accepted_suggestions = Suggestion.accepted.order_date_desc
      .paginate page: params[:page], per_page: Settings.suggestion.per_page
    @rejected_suggestions = Suggestion.rejected.order_date_desc
      .paginate page: params[:page], per_page: Settings.suggestion.per_page
  end

  def update
    @suggestion.update_attributes status: params[:value]
    if @suggestion.save
      flash[:success] = t(".update_success", product: @suggestion.product, 
        status: @suggestion.status)
    else
      flash[:danger] = t(".update_fail", product: @suggestion.product, 
        status: @suggestion.status)
    end
    redirect_to admin_suggestions_path
  end

  def destroy
    if @suggestion.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_error"
    end
    redirect_to admin_suggestions_path
  end
end
