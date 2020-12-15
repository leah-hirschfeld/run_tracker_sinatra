class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :length
      t.date :date
      t.string :location
      t.string :description
    end
  end
end
