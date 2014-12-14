class CreateShoppeAttachments < ActiveRecord::Migration
  def change
    create_table :shoppe_attachments do |t|
      t.integer :parent_id, index: true
      t.string :parent_type, null: false
      t.string :token, null: false
      t.string :file, null: false
      t.string :file_name, null: false
      t.integer :file_size
      t.string :file_type
      t.string :role

      t.index :token, unique: true

      t.timestamps
    end
  end
end
