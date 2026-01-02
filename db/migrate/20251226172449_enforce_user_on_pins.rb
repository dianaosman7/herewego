class EnforceUserOnPins < ActiveRecord::Migration[8.1]
  def change
    add_index :pins, :user_id unless index_exists?(:pins, :user_id)

    # Add FK (only if not already there)
    add_foreign_key :pins, :users unless foreign_key_exists?(:pins, :users)

    # Make it strict
    change_column_null :pins, :user_id, false
  end
end