class AddMediaToVideo < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :media, :string
  end
end
