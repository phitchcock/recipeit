class AddSlugsToModels < ActiveRecord::Migration
  def change
    add_column :recipes, :slug, :string, unique: true
    add_column :categories, :slug, :string, unique: true
    add_column :users, :slug, :string, unique: true
  end
end
