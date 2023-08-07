require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  let(:company) {
    Company.create!(
      name: "MyString",
      formal_name: "MyString",
      rut: "MyString",
      contact_info: "MyString",
      line_of_business: "MyString"
    )
  }

  before(:each) do
    assign(:company, company)
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(company), "post" do

      assert_select "input[name=?]", "company[name]"

      assert_select "input[name=?]", "company[formal_name]"

      assert_select "input[name=?]", "company[rut]"

      assert_select "input[name=?]", "company[contact_info]"

      assert_select "input[name=?]", "company[line_of_business]"
    end
  end
end
