class CreateSampleTables < ActiveRecord::Migration
  def change
    create_table :sample_tables do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
