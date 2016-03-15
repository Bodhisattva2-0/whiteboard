class InterestingsController < ApplicationController
  def index
    @interestings = Interesting.all.order(created_at: "DESC")
    render :index
  end

  def new
    @interesting = Interesting.new
    render :new
  end

  def create
    Interesting.create(params.require(:interesting).permit([:title, :description, :user_name]))
    redirect_to interestings_url
  end
end
