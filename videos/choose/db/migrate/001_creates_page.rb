class CreatesPage < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :parent_id
      t.text :content
      t.boolean :starting_point, default: false
      t.boolean :conclusion, default: false
    end
  end
end