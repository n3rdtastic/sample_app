class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
    # add an index on user emails and force them to be unique
    add_index :users, :email, :unique => true
  end

  def self.down
    remove_index :users, :email
  end
end
