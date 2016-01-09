class AlterBirthDate < ActiveRecord::Migration
  def change
   change_column :users, :birth_date, :datetime
 end
end
