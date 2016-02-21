class AddDurationToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :duration, :integer, default: 20
  end
end
