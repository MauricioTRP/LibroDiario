require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      name: "MyString",
      formal_name: "MyString",
      rut: "MyString",
      contact_info: "MyString",
      line_of_business: "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input[name=?]", "company[name]"

      assert_select "input[name=?]", "company[formal_name]"

      assert_select "input[name=?]", "company[rut]"

      assert_select "input[name=?]", "company[contact_info]"

      assert_select "input[name=?]", "company[line_of_business]"
    end
  end
end
