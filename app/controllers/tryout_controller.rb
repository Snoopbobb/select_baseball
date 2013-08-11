class TryoutController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy


  def index
    @tryouts = Tryout.all
  end

  def create
    @tryout = current_user.tryouts.build(params[:tryout])
    if @tryout.save
      flash[:success] = "Tryout created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @tryout.destroy
    redirect_to root_url
  end

  def show
    @tryouts = Tryout.all
  end

  private

  def correct_user
    @micropost = current_user.microposts.find_by_id(params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
