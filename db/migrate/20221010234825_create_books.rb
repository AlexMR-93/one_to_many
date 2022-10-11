class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table(:books) do |t|
      t.string(:title)
      t.boolean(:best_seller)
      t.integer(:pages)
      t.timestamps
    end
  end
end
