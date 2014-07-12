class EditLegislatorsAndContributions < ActiveRecord::Migration
  def change
    add_reference :contributions, :legislator, index: true

    remove_column :contributions, :chamber, :string
    remove_column :contributions, :cid, :string
    remove_column :contributions, :crp_id, :string
    remove_column :contributions, :congress_office, :string
    remove_column :contributions, :source, :string
    remove_column :contributions, :origin, :string
    remove_column :contributions, :state, :string
    remove_column :contributions, :total, :string
    remove_column :contributions, :pacs, :string
    remove_column :contributions, :indivs, :string

    add_column :contributions, :kind, :string
    add_column :contributions, :source, :string
    add_column :contributions, :pac_total, :integer
    add_column :contributions, :pac_ratio, :integer
    add_column :contributions, :total, :integer
    add_column :contributions, :indivs, :integer

  end
end
