class AnswerResultsController < ApplicationController
  
  def create
    @answer = AnswerResult.create(answer_params)
    if @answer.save
      flash[:notice] = '回答結果を送信しました'
      redirect_to root_path
    else
      flash[:notice] = '回答結果を送信できませんでした'
      redirect_to judge_tweet_answers_path
    end
  end
  
  private

  def answer_params
    params.require(:answer_result).permit(
      :result,
      :tweet_id,
      :user_id,
      :answer_id
    ).merge(tweet_id: params[:tweet_id],user_id: current_user.id)
  end


end
