module AnswersHelper

  # 回答された答えを抽出
  def answer_problem
    if (@answer.judge_problem1 == @correct_problem1)||(@answer.judge_problem2 == @correct_problem2)||(@answer.judge_problem3 == @correct_problem3)||(@answer.judge_problem4 == @correct_problem4)||(@answer.judge_problem5 == @correct_problem5)
      p "正解！！" 
    else
      p "不正解！" 
    end
  end
end
