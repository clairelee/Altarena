require 'spec_helper'

describe "productions/edit" do
  before(:each) do
    @production = assign(:production, stub_model(Production,
      :name => "MyString",
      :company => "MyString"
    ))
  end

  it "renders the edit production form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", production_path(@production), "post" do
      assert_select "input#production_name[name=?]", "production[name]"
      assert_select "input#production_company[name=?]", "production[company]"
    end
  end
end
