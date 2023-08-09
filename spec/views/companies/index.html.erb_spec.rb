require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        name: "Name",
        formal_name: "Formal Name",
        rut: "Rut",
        contact_info: "Contact Info",
        line_of_business: "Line Of Business"
      ),
      Company.create!(
        name: "Name",
        formal_name: "Formal Name",
        rut: "Rut",
        contact_info: "Contact Info",
        line_of_business: "Line Of Business"
      )
    ])
  end

  it "renders a list of companies" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Formal Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Rut".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Contact Info".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Line Of Business".to_s), count: 2
  end
end
