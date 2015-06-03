require 'rails_helper'

RSpec.describe PostCategory, type: :model do 
  it "saves itself" do
    post_category = PostCategory.create(recipe_id: 1, category_id: 2)

    expect(PostCategory.first).to eq(post_category)
  end
end