class ChangeColumnFromSurveys < ActiveRecord::Migration
  def change
    change_column :surveys, :duration, :integer, default: 5
  end
end
