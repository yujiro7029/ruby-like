class AnswersController < ApplicationController
  before_action :find_tweet,only:[:judge,:index,:new,:destroy]
  before_action :find_answer,only:[:judge,:index,:destroy]
  before_action :set_answer,only:[:description_answer,:select_answer,:index,:new,:check]
  before_action :set_answer_result,only:[:judge]
  before_action :judge_problem,only:[:judge]
  before_action :judge_select_problem,only:[:judge]
  before_action :authenticate_user!

  def index   
    @answer = Answer.where(tweet_id: params[:tweet_id]).last
  end
  
  
  

  def new
    if @tweet.type_problem == 2
      render "answers/select_answer"
    else
      render "answers/description_answer"
    end
  end


  # 回答された問題が記述問題か選択問題かを判断
  def judge
    if @tweet.type_problem == 2
      render "answers/result_select"
    else
      render "answers/result_description"
    end
  end

  def create
    @answer = Answer.create(answer_params)
    if @answer.save
      flash[:notice] = '回答お疲れ様でした！'
      redirect_to action: :index
    else
      flash[:notice] = '回答結果が反映されていません'
      redirect_to action: :new
    end
  end

  def destroy
    @answer.destroy if @answer
    flash[:notice] = '回答結果の削除ができました'
    redirect_to controller: 'tweets', action: 'show'
  end

private

  def answer_params
   params.require(:answer).permit(
     :content,
     :tweet_id,
     :judge_problem1,
     :judge_problem2,
     :judge_problem3,
     :judge_problem4,
     :judge_problem5
    ).merge(tweet_id: params[:tweet_id],user_id: current_user.id)
  end

  def find_tweet
    @tweet = Tweet.find(params[:tweet_id])   
  end

  def find_answer
    @answer = Answer.where(tweet_id: params[:tweet_id],user_id:current_user.id).last
  end
 
  def set_answer
    @answer = Answer.new 
  end

  def set_answer_result
    @answer_result = AnswerResult.new 
  end


  # 問題の答えを抽出
  def judge_problem
    if (@tweet.judge_problem1 == 2)&&( @tweet.judge_problem2 == 1)&&( @tweet.judge_problem3 == 1)&&( @tweet.judge_problem4 == 1)&&( @tweet.judge_problem5 == 1)
      @correct = @tweet.select_problem1
      @correct_list = "正解は回答その１でした！"
      @correct_problem1 = 1
    elsif  (@tweet.judge_problem1 == 1)&&( @tweet.judge_problem2 == 2)&&( @tweet.judge_problem3 == 1)&&( @tweet.judge_problem4 == 1)&&( @tweet.judge_problem5 == 1)
      @correct = @tweet.select_problem2
      @correct_list = "正解は回答その2でした！"
      @correct_problem2 = 1
    elsif  (@tweet.judge_problem1 == 1)&&( @tweet.judge_problem2 == 1)&&( @tweet.judge_problem3 == 2)&&( @tweet.judge_problem4 == 1)&&( @tweet.judge_problem5 == 1)
      @correct = @tweet.select_problem2
      @correct_list = "正解は回答その3でした！"
      @correct_problem3 = 1
    elsif  (@tweet.judge_problem1 == 1)&&( @tweet.judge_problem2 == 1)&&( @tweet.judge_problem3 == 1)&&( @tweet.judge_problem4 == 2)&&( @tweet.judge_problem5 == 1)
      @correct = @tweet.select_problem2
      @correct_list = "正解は回答その4でした！"
      @correct_problem4 = 1
    else
      @correct = @tweet.select_problem2
      @correct_list = "正解は回答その5でした！"
      @correct_problem5 = 1
    end
  end

  # 選択問題の答えを抽出

  def judge_select_problem
    if (@answer.judge_problem1 == @correct_problem1)||(@answer.judge_problem2 == @correct_problem2)||(@answer.judge_problem3 == @correct_problem3)||(@answer.judge_problem4 == @correct_problem4)||(@answer.judge_problem5 == @correct_problem5)
      @result_number = 1
    else
      @result_number = 0
    end
  
  end

end



