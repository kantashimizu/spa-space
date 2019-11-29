class TweetsController < ApplicationController
  
  def index
    
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to root_path
       
  end

  def show
    @tweets = Tweet.all.order(:created_at)
    @tweets = Tweet.search(params[:keyword])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to root_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
    redirect_to root_path
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title,:text,:image,:address,:area_id,:rate).merge(user_id: current_user.id)
  end
end
