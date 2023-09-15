require 'rails_helper'

RSpec.describe ProductOffer, type: :model do
  describe 'associations' do
    it { should belong_to(:product) }
  end
end
