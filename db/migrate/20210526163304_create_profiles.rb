class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :email
      t.string :bio
      t.string :avatar_url
      t.integer :author_id

      t.timestamps
    end
  end
end
