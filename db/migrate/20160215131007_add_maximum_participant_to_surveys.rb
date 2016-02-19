class AddMaximumParticipantToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :maximum_participant, :integer, default: 20
  end
end
