class AddKeyToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :key, :string
  end
end
