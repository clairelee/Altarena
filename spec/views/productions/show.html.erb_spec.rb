require 'spec_helper'

describe "productions/show" do
  before(:each) do
    @production = assign(:production, stub_model(Production,
      :name => "Name",
      :company => "Company"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Company/)
  end
end
