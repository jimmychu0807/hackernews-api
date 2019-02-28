class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.references :user
      t.text :content
      t.integer :comments_count, null: false, default: 0

      t.timestamps
    end

    # Add comments counter_cache to Link
    add_column :links, :comments_count, :integer, default: 0

    # convert links table description field to text
    change_column :links, :description, :text
  end
end
