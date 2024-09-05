module ExportPng
  extend ActiveSupport::Concern

  module ClassMethods
    def to_png
      require 'png'
      options = { col_sep: ';', encoding: 'utf-8' }
      headers = %i[id photos]

      PNG.generate(headers: true, **options) do |png|
        png << headers

        all.each do |image|
          png << [image.id, image.photos]
        end
      end
    end
  end
end
