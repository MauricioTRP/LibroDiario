require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    assign(:company, Company.create!(
      name: "Name",
      formal_name: "Formal Name",
      rut: "Rut",
      contact_info: "Contact Info",
      line_of_business: "Line Of Business"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Formal Name/)
    expect(rendered).to match(/Rut/)
    expect(rendered).to match(/Contact Info/)
    expect(rendered).to match(/Line Of Business/)
  end
end
