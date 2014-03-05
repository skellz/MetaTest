class TwitterAccountsController < ApplicationController
  before_action :set_twitter_account, only: [:show, :edit, :update, :destroy]

  def index
    @twitter_accounts = TwitterAccount.all 
  end

  def show
    @tweets = @twitter_account.tweets.limit(10)
  end

  def new
    @twitter_account = TwitterAccount.new
  end

  def create
    @twitter_account = TwitterAccount.new(twitter_account_params)

    respond_to do |format|
      if @twitter_account.save
        format.html { redirect_to @twitter_account, notice: 'Twitter account was successfully created' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @twitter_account.save
        format.html { redirect_to @twitter_account, notice: 'Twitter account was successfully created' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    @twitter_account.destroy
    respond_to do |format|
      format.html { redirect_to twitter_accounts_url }
    end
  end

  private 

  def set_twitter_account
    @twitter_account = TwitterAccount.find(params[:id])
  end

  def twitter_account_params
    params.require(:twitter_account).permit(:handle)
  end
end