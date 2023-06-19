class AddConfirmToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :confirmed?, :boolean, default: false
  end
end
