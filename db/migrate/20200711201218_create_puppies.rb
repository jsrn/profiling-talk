class CreatePuppies < ActiveRecord::Migration[6.0]
  def change
    create_table :puppies do |t|
      t.string :name
      t.integer :age
      t.boolean :age_confirmed, default: false
      t.boolean :microchipped, default: false
    end
  end
end
