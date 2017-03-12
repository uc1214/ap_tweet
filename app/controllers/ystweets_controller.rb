class YstweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]

  #一覧画面のアクション
  def index
    @tweet = Ystweet.all
    @tweet_content = Ystweet.new
  end
  #ツィート時のアクション
  def new
    if params[:back] #確認画面から戻るボタン押下時
      @tweet = Ystweet.new(tweets_params)
    else
      @tweet = Ystweet.new
    end
  end
  #ツィート確認時のアクション
  def confirm
    @tweet = Ystweet.new(tweets_params)
    #バリデーションチェックに引っかかった場合ツィート画面へ飛ばす
    render :new if @tweet.invalid?
  end
  #ツィート生成時のアクション
  def create
    @tweet = Ystweet.new(tweets_params)
    if @tweet.save
      redirect_to ystweets_path, notice:"ツィートしました！"
    else
      render :new
    end
  end

  def edit
  end
  #ツィート更新時のアクション
  def update
    if @tweet.update(tweets_params)
      redirect_to ystweets_path, notice:"ツィートを編集しました！"
    else
      render 'edit'
    end
  end
  def destroy
    @tweet = Ystweet.find(params[:id])
    @tweet.destroy
    redirect_to ystweets_path, notice:"ツィートを削除しました！"
  end

  private
    def tweets_params
      params.require(:ystweet).permit(:content)
    end
    def set_tweet
      @tweet = Ystweet.find(params[:id])
    end
end
