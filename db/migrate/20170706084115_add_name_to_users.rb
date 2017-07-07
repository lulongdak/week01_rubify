class AddNameToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.string :name
    end
  end

  def self.down
    remove_string :users, :name
  end
end
