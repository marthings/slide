class AddUserIdToPresentations < ActiveRecord::Migration[5.2]
  def change
    add_column :presentations, :user_id, :integer
  end
end
