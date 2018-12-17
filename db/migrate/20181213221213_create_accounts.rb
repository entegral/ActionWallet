class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.column :user_id, :integer
      t.column :name, :string
      t.column :coin, :integer
      t.column :account_index, :integer
      t.column :private_key, :string
      t.column :public_address, :string

      t.timestamps
    end
  end
end
