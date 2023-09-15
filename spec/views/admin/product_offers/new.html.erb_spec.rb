require 'rails_helper'

RSpec.describe 'admin/product_offers/new', type: :view do
  before(:each) do
    assign(:product_offer, build(:product_offer, product:))
  end

  let(:product) { create(:product) }
  it 'renders new admin_product_offer form' do
    render

    assert_select 'form[action=?][method=?]', admin_product_offers_path, 'post' do
      assert_select 'input[name=?]', 'product_offer[for_quantity]'
      assert_select 'input[name=?]', 'product_offer[discount]'
    end
  end
end
