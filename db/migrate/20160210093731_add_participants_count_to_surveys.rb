class AddParticipantsCountToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :participants_count, :integer, default: 0
    unless reverting?
      Survey.reset_column_information
      Survey.refresh_participants_count
    end
  end
end
