class AddSubjectTable < ActiveRecord::Migration[7.0]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :surname
      t.string :last_name
      t.string :code_name
      t.integer :gender
      t.integer :age
      t.boolean :mutant
      t.string :address
      t.timestamps
    end
  end
end
