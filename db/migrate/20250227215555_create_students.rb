class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trainer
      t.decimal :height
      t.decimal :weight
      t.date :birth
      t.string :goal

      t.timestamps
    end
  end
end
