require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "saves itself" do
    recipe = Recipe.create(title: "One")

    expect(Recipe.first).to eq(recipe)
  end
end