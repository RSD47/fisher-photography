class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[show edit update]

  def index
    @collections = Collection.all
  end

  def show
    @image = Image.new
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.new(collection_params)

    if @collection.save
      # @collection.photos.each do
      #   Image.create
      # end
      redirect_to collections_path, notice: "Collection created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @collection.update(collection_params)
      redirect_to collection_path(@collection), notice: "Collection updated"
    else
      render :edit
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_path, status: :see_other, notice: "Collection deleted"
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:season, :match, :photo)
  end
end
