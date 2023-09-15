require 'rails_helper'

RSpec.describe 'admin/products/index', type: :view do
  before(:each) do
    assign(:products, [
      create(
        :product,
        product_code: 'Product Code',
        name: 'Name',
        price: '9.99',
      ),
      create(
        :product,
        product_code: 'Product Code',
        name: 'Name',
        price: '9.99',
      ),
    ])
  end

  it 'renders a list of products' do
    render
    cell_selector1 = 'div>a'
    cell_selector2 = 'tbody>tr>td'

    assert_select cell_selector1, text: Regexp.new('New product'.to_s), count: 1
    assert_select cell_selector2, text: Regexp.new('Product Code'.to_s), count: 2
  end
end
