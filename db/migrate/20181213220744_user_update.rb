class UserUpdate < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :master_key, :string)
    add_column(:users, :confirmed, :boolean)
  end
end
