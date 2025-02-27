class AllowlistedJwts < ActiveRecord::Migration[7.1]
  def change
    create_table :allowlisted_jwts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :jti, null: false
      t.string :aud
      t.datetime :exp, null: false
      t.timestamps
    end

    add_index :allowlisted_jwts, :jti, unique: true
  end
end
