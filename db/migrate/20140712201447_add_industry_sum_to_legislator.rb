class AddIndustrySumToLegislator < ActiveRecord::Migration
  def change
    add_column :legislators, :industry_sum, :integer
  end
end
