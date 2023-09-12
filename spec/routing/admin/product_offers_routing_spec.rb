require "rails_helper"

RSpec.describe Admin::ProductOffersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/product_offers").to route_to("admin/product_offers#index")
    end

    it "routes to #new" do
      expect(get: "/admin/product_offers/new").to route_to("admin/product_offers#new")
    end

    it "routes to #show" do
      expect(get: "/admin/product_offers/1").to route_to("admin/product_offers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/product_offers/1/edit").to route_to("admin/product_offers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/product_offers").to route_to("admin/product_offers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/product_offers/1").to route_to("admin/product_offers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/product_offers/1").to route_to("admin/product_offers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/product_offers/1").to route_to("admin/product_offers#destroy", id: "1")
    end
  end
end
