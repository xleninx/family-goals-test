require 'rails_helper'

RSpec.describe FamilyGoal, type: :model do

  let(:family_goal_valid) { build(:family_goal) }
  let(:family_goal_invalid) { build(:family_goal, family_goal_valid.attributes.slice("name", "position", "area", "world")) }

  it "Family Goal should be valid" do
    expect(family_goal_valid).to be_valid
  end

  it "Family Goal should be invalid for duplication" do
    family_goal_valid.save
    expect(family_goal_invalid).not_to be_valid
  end
end