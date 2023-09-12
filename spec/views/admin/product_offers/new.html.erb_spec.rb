require 'rails_helper'

RSpec.describe "admin/product_offers/new", type: :view do
  before(:each) do
    assign(:admin_product_offer, Admin::ProductOffer.new())
  end

  it "renders new admin_product_offer form" do
    render

    assert_select "form[action=?][method=?]", admin_product_offers_path, "post" do
    end
  end
end
