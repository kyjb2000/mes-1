class RemoveUserToSurveys < ActiveRecord::Migration
  def change
    remove_column :surveys, :user_id_id, :integer
  end
end
