class CatDateChange < ActiveRecord::Migration[7.0]
  def change
    change_column :cats, :birth_date, :date
  end
end
