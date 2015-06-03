require 'rails_helper'

RSpec.describe Category, type: :model do
  it "saves itself" do
    category = Category.create(name: "Category One")

    expect(Category.first).to eq(category)
  end
end