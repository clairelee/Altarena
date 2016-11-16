require 'spec_helper'

describe "productions/index" do
  before(:each) do
    assign(:productions, [
      stub_model(Production,
        :name => "Name",
        :company => "Company"
      ),
      stub_model(Production,
        :name => "Name",
        :company => "Company"
      )
    ])
  end

  it "renders a list of productions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
  end
end
