class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table(:authors) do |t|
      t.string(:name)
      t.boolean(:has_won_awards)
      t.integer(:books_written)
      t.timestamps
    end
  end
end
