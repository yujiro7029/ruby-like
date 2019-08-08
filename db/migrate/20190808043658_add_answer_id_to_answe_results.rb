class AddAnswerIdToAnsweResults < ActiveRecord::Migration[5.2]
  def change
    add_column :answer_results, :answer_id,:integer
  end
end
