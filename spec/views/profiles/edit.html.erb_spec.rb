require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :name => "MyText",
      :photo_url => "MyText",
      :resume_url => "MyText"
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do
      assert_select "textarea#profile_name[name=?]", "profile[name]"
      assert_select "textarea#profile_photo_url[name=?]", "profile[photo_url]"
      assert_select "textarea#profile_resume_url[name=?]", "profile[resume_url]"
    end
  end
end
