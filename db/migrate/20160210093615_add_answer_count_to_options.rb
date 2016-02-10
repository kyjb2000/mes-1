class AddAnswerCountToOptions < ActiveRecord::Migration
  def change
    add_column :options, :answers_count, :integer, default: 0

    unless reverting?
      Option.reset_column_information
      Option.refresh_answers_count
    end
  end
end
