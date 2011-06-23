class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.datetime :day
      t.references :meal

      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end
