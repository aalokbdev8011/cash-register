require 'rails_helper'

RSpec.describe "admin/product_offers/index", type: :view do
  before(:each) do
    assign(:admin_product_offers, [
      Admin::ProductOffer.create!(),
      Admin::ProductOffer.create!()
    ])
  end

  it "renders a list of admin/product_offers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
