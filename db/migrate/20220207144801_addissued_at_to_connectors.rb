class AddissuedAtToConnectors < ActiveRecord::Migration[7.0]
  def change
    add_column(:connectors, :issued_at, :datetime)
    add_column(:connectors, :returned_at, :datetime)
  end
end
