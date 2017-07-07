class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :state
      t.references :user
      t.timestamps
    end
  end
end
