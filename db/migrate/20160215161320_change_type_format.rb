class ChangeTypeFormat < ActiveRecord::Migration
  def change
    change_column :surveys, :description, :text
  end
end
