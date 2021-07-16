class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :title
      t.string :place
      t.string :description
      t.timestamps
    end
  end
end
