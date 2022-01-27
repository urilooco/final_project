class CreateSaveImages < ActiveRecord::Migration[7.0]
  def change
    create_table :save_images do |t|
      t.references :user, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end

    add_index :save_images, [:user_id, :image_id], unique: true
  end
end
