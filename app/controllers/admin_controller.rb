class AdminController < ApplicationController
  before_action :authenticat_user!
end
