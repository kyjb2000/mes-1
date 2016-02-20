class Add < ActiveRecord::Migration
  def change
    add_column :survey_responses, :start_time, :timestampz, default: 0
  end
end
