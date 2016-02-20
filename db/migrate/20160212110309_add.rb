class Add < ActiveRecord::Migration
  def change
    add_column :survey_responses, :start_time, 'time with time zone'
  end
end
