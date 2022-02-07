class AddThingsToVisitors < ActiveRecord::Migration[7.0]
  def change
    add_column :visitors, :email, :string
    add_column :visitors, :phone, :string
    add_column :visitors, :identity_card_type, :string
    add_column :visitors, :identity_card_number, :integer
    add_column :visitors, :expires, :date
    add_column :visitors, :visitor_type, :string
    add_column :visitors, :visitor_id_expiration, :date
    add_column :visitors, :escort_flag, :boolean

  end
end

