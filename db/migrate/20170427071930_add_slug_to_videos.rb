class AddSlugToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :slug, :string
  end
end
