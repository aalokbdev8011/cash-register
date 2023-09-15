require 'rails_helper'

RSpec.describe 'admin/product_offers/edit', type: :view do
  let(:product_offer) do
    create(:product_offer)
  end

  before(:each) do
    assign(:product_offer, product_offer)
  end

  it 'renders the edit admin_product_offer form' do
    render

    assert_select 'form[action=?][method=?]', admin_product_offer_path(product_offer), 'post' do
      assert_select 'input[name=?]', 'product_offer[for_quantity]'
      assert_select 'input[name=?]', 'product_offer[discount]'
    end
  end
end
