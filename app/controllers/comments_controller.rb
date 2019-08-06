class CommentsController < ApplicationController

  before_action :set_tweet_id,only:[:index, :new]

  def index
    @comments = Comment.all
  end
  
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      flash[:notice] = 'コメントできました'
      redirect_to  tweet_path(@comment.tweet_id)
    else
      flash[:notice] = 'コメント正しく入力してください。'
      redirect_to  new_tweet_comment_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text,:tweet_id).merge(tweet_id:params[:tweet_id],user_id: current_user.id)
  end

  def set_tweet_id
    @tweet = Tweet.find(params[:tweet_id])  
  end

end
