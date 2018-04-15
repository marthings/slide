class AddBodyToParts < ActiveRecord::Migration[5.2]
  def change
    add_column :parts, :body, :text
  end
end
