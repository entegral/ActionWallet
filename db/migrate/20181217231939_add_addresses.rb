class AddAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.column :chain_index, :integer
      t.column :address_index, :integer
      t.column :label, :string

      t.timestamps
    end
  end
end
