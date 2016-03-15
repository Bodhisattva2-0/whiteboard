class CreateInterestings < ActiveRecord::Migration
  def change
    create_table :interestings do |t|
      t.string :title
      t.text :description
      t.string :user_name
      t.timestamps null: false
    end
  end
end
