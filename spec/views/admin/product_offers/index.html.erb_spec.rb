require 'rails_helper'

RSpec.describe 'admin/product_offers/index', type: :view do
  before(:each) do
    assign(:product_offers, [
      create(:product_offer, discount: 10),
      create(:product_offer, discount: 10),
    ])
  end

  it 'renders a list of admin/product_offers' do
    render
    cell_selector1 = 'div>a'
    cell_selector2 = 'tbody>tr>td'

    assert_select cell_selector1, text: Regexp.new('New product offer'.to_s), count: 1
    assert_select cell_selector2, text: Regexp.new('10'.to_s), count: 2
  end
end
