require "down"
require "fileutils"

class ImagesController < ApplicationController
  before_action :set_image, only: %i[show destroy download]
  before_action :set_collection, only: %i[show new create]

  def show
    Image.increment_counter(:views, @image, by: 1)
    @image.collection = @collection
  end

  def new
    @image = Image.new
  end

  def create
    @image1 = Image.build(image_params)
    num = @image1.photos.count
    num.times do |i|
      params = ActionController::Parameters.new(collection_id: image_params[:collection_id],
                                                photos: [image_params[:photos][i + 1]])
      params.permit!
      @image = Image.build(params)
      if @image.save == false
        render :new, status: :unprocessable_entity
      end
    end
    redirect_to collection_path(@collection)
  end

  def destroy
    @image.destroy
    redirect_to root_path, status: :see_other, notice: "images deleted"
  end

  # def download
  #   send_file("https://res.cloudinary.com/dxk1tmnej/image/upload/v1/development/d3xs1btqeeq0k7l1q8htachk5gjf.jpg?_a=BACE6GBn", type: "image/jpeg")
  # end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def set_collection
    @collection = Collection.find(params[:collection_id])
  end

  def image_params
    params.require(:image).permit(:collection_id, photos: [])
  end
end
