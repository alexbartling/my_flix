class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :value
      t.string :name

      t.timestamps
    end
  end
end
