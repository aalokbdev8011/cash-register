module Admin
  class ProductOffersController < AdminController
    before_action :set_product_offer, only: %i[show edit update destroy]

    def index
      @product_offers = ProductOffer.order(created_at: :asc).all
    end

    def new
      @product_offer = ProductOffer.new
    end

    def edit; end

    def create
      @product_offer = ProductOffer.new(product_offer_params)

      if @product_offer.save
        redirect_to admin_product_offers_path, notice: 'Product offer was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @product_offer.update(product_offer_params)
        redirect_to admin_product_offers_path, notice: 'Product offer was successfully updated.', status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product_offer.destroy
      redirect_to admin_product_offers_url, notice: 'Product offer was successfully destroyed.', status: :see_other
    end

    private

    def set_product_offer
      @product_offer = ProductOffer.find(params[:id])
    end

    def product_offer_params
      params.require(:product_offer).permit(:product_id, :for_quantity, :discount)
    end
  end
end
