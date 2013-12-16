class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
    	t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :logo_files
      t.string :phone

      t.timestamps
    end
    add_index("logos", "user_id")
  end
end
