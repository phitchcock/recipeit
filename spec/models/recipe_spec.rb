require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "saves itself" do
    recipe = Recipe.create(title: "One", url: "www.google.com", description: "Initial description")

    expect(Recipe.first).to eq(recipe)
  end
end