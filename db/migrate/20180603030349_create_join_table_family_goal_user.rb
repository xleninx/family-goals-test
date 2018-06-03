class CreateJoinTableFamilyGoalUser < ActiveRecord::Migration[5.2]
  def change
    create_join_table :family_goals, :users do |t|
      t.index [:family_goal_id, :user_id]
      t.index [:user_id, :family_goal_id]
    end
  end
end
