require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:user_valid) { build(:user) }

  it "should be valid" do
    expect(user_valid).to be_valid
  end

  describe "user without family goals" do
    before(:each) do
      create(:family_goal)
    end

    it "should not matches with family goals" do
      user_valid.save
      expect(user_valid.family_goals.count).to eq(0)
    end
  end

  describe "user witch one family goal" do
    before(:each) do
      # creating family goals with the same attributes as user
      create(:family_goal, user_valid.attributes.slice("position", "area", "world"))
    end

    it "should be one matches with family goals" do
      user_valid.save
      expect(user_valid.family_goals.count).to eq(1)
    end
  end

  describe "user regenerate family goals on change a attribute" do
    let(:user) { create(:user, name: "Juan Pablo",
                        position: "EJECUTIVO PERSONAS JUNIOR",
                        area: "ZONA CENTRO 1",
                        world: "comida") }

    before(:each) do
      # Generate dummy combinations
      CombinationGenerator.new.save_family_goals
    end

    it "user should be not have family goals" do
      expect(user.family_goals.count).to eq(0)
    end

    it 'user should be have family goals after update' do
      user.update(world: "Banefe")
      expect(user.family_goals.count).to eq(3)
    end
  end
end
