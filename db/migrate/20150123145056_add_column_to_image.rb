class AddColumnToImage < ActiveRecord::Migration
  def change
    add_column :images, :entity_type, :string
    add_column :images, :entity_id, :integer
  end
end
