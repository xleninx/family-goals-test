class User < ApplicationRecord

  validates_presence_of :name, :position, :area, :world

  has_and_belongs_to_many :family_goals

  before_save :set_family_goals

  def set_family_goals
    self.family_goals = FamilyGoal.where(position: position, area: area, world: world)
  end
end