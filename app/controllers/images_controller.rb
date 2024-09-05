# require "open-uri"
require "down"
require "fileutilis"

class ImagesController < ApplicationController
  before_action :set_image, only: %i[show destroy download]
  before_action :set_collection, only: %i[show new create]

  # def index
  #   @images = Image.all
  # end

  def show
    @image.collection = @collection
    # @url = Cloudinary::Utils.private_download_url @image.photos[0].cloudinary_id, self.format, attachment: true
    @image.views = + 1
    # send_data @image.photo.file.read, filename: @image.photo.name
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

  # def edit
  # end

  # def update
  #   if @image.update(image_params)
  #     redirect_to root_path, notice: "Task updated"
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @image.destroy
    redirect_to root_path, status: :see_other, notice: "images deleted"
  end

  def download
    # dirname = "C:/Users/samue"
    # respond_to do |format|
    #   format.png { send_data Image.to_png }
    # Cloudinary::Utils.private_download_url @image.photos[0].id, "jpg", attachment: true
    # @image.photos[0].download
    # URI.open(@image.photos[0].url) do |image|
    #   File.open(File.join(Dir.pwd, dirname, "test.jp"), "w+") do |file|
    #     file.write(image.read)
    #   end
    # end
    tempfile = Down.download(@image.photos[0].url)
    FileUtilis.mv(tempfile.path, "./#")
  end

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
