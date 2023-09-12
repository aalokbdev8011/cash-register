require 'rails_helper'

RSpec.describe "admin/product_offers/show", type: :view do
  before(:each) do
    assign(:admin_product_offer, Admin::ProductOffer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
