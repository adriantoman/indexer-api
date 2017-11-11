class CreatePageElements < ActiveRecord::Migration[5.1]
  def change
    create_table :page_elements do |t|
      t.references :page, foreign_key: true
      t.string :content
      t.integer :element_type

      t.timestamps
    end
  end
end
