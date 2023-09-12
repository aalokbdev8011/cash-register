require 'rails_helper'

RSpec.describe "admin/product_offers/edit", type: :view do
  let(:admin_product_offer) {
    Admin::ProductOffer.create!()
  }

  before(:each) do
    assign(:admin_product_offer, admin_product_offer)
  end

  it "renders the edit admin_product_offer form" do
    render

    assert_select "form[action=?][method=?]", admin_product_offer_path(admin_product_offer), "post" do
    end
  end
end
