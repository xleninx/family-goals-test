class FamilyGoal < ApplicationRecord
  validates :name, uniqueness: { scope: [:postion, :area, :world] }
end
