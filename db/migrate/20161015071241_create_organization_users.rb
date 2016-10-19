class CreateOrganizationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_users do |t|
      t.integer :organization_id
      t.integer :user_id
      t.integer :state
      t.timestamps
    end
    add_index :organization_users, :organization_id
    add_index :organization_users, :user_id
    add_index :organization_users, :state
  end
end
