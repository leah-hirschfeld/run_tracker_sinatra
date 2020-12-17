class CreateUsers < ActiveRecord::Migration
  def change
    create_table :useres do |t|
      t.string :username
      t.string :password_digest
    end
  end
end
