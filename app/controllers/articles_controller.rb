class ArticlesController < ApplicationController
  include DryController

  private
    # Only allow a list of trusted parameters through.
    def resource_params
      params.require(:article).permit(:title, :body)
    end
end
