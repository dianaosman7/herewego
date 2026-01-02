class AddTitleToPins < ActiveRecord::Migration[8.1]
  def change
    add_column :pins, :title, :string
  end
end
