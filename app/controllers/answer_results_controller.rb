class AnswerResultsController < ApplicationController
  
  def create

    @answer = AnswerResult.create(answer_params)
    if @answer.save
      flash[:notice] = '投稿できました'
      redirect_to root_path
    else
      flash[:notice] = 'メッセージを入力してください。'
      redirect_to judge_tweet_answers_path
    end
  end

  private

  def answer_params
    params.require(:answer_result).permit(
      :result,
      :tweet_id,
      :user_id,
    ).merge(tweet_id: params[:tweet_id],user_id: 1)
  end


end
