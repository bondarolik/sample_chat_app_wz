class CategoriesController < ApplicationController
  include DryController
  
  private
    # Only allow a list of trusted parameters through.
    def resource_params
      params.require(:category).permit(:title)
    end
end
