class AddDnasTable < ActiveRecord::Migration[7.0]
  def change
    create_table :dnas do |t|
      t.integer :subject_id
      t.jsonb :dna_pattern
      t.string :comments
      t.decimal :count_mutant_dna, precision: 10, scale: 2
      t.decimal :count_human_dna, precision: 10, scale: 2
      t.decimal :ratio, precision: 10, scale: 2
    end

    add_foreign_key :dnas, :subjects
  end
end
