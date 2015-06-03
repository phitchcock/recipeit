require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "saves itself" do
    comment = Comment.create(body: "This is a comment")

    expect(Comment.first).to eq(comment)
  end
end