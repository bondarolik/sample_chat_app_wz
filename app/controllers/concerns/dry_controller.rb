module DryController
  extend ActiveSupport::Concern

  included do
    before_action :set_model_class
    before_action :set_resource, only: %i[show edit update destroy]
  end

  def index
    @resources = resource_class.all
  end

  def show; end

  def new
    @resource = resource_class.new
  end

  def create
    @resource = resource_class.new(resource_params)
    
    if @resource.save
      redirect_to "/" + controller_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @resource.update(resource_params)
      redirect_to "/" + controller_path, notice: "Update succesful!"
    else
      render :edit
    end
  end
  
  def destroy
    if @resource.destroy
      redirect_to "/" + controller_path
    end    
  end

  private 
  
  def resource_class
    # /articles
    #    articles    "Article"  send(Article)
    # Article.scope()
    controller_path.classify.constantize
  end

  def set_resource
    @resource = resource_class.find(params[:id])
  end

  def set_model_class
    @model_class = resource_class
  end
end