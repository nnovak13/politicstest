require 'rails_helper'

describe "A Legislator" do
  it "is named Nancy Pelosi" do
    legislator = Legislator.new
    legislator.name.should == 'Nancy Pelosi'
  end
end
