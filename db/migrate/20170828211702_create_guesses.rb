class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.integer :guess_counter
      t.boolean :correct_guess, default: false
      t.references :round
      t.references :card

      t.timestamps
    end
  end
end
