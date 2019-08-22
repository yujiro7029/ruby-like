class UsersController < ApplicationController

  before_action :authenticate_user!

  #マイページ
  def show
  end

  # 回答した問題
  def answer_question
    @correct_answer = AnswerResult.where(result:1,user_id:current_user.id).includes(:tweet)
    @incorrect_answer = AnswerResult.where(result:0,user_id:current_user.id).includes(:tweet)
  end

  # 投稿した問題
  def answer
    @selects = Tweet.where(user_id: current_user,type_problem: 2)
    @description = Tweet.where(user_id: current_user,type_problem: 1)
  end

  # いいねのページ
  def likes_list
    # いいねした問題
    @mylikes = Like.current(current_user)
    # いいねされた問題
    @likes = Tweet.where(user_id: current_user)
  end

end
