class AddSectorSumToLegislators < ActiveRecord::Migration
  def change
    add_column :legislators, :sector_sum, :integer
    remove_column :contributions, :legislator_id, :string
  end
end
