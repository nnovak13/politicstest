class RemoveUnnededColumns < ActiveRecord::Migration
  def change
      remove_column :contributions ,:firstlast, :string
      remove_column :contributions ,:industry, :string
      remove_column  :contributions ,:industry_name, :string
  end
end
