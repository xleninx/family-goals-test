class FamilyGoal < ApplicationRecord
  validates_presence_of :name, :position, :area, :world

  has_and_belongs_to_many :users

  validates :name, uniqueness: { scope: [:position, :area, :world] }
end
