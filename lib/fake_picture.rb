# frozen_string_literal: true

module FakePicture
  class Base
    PACK_PATH = '/pack'

    def self.random_file(path, file: false)
      path_to_file = Dir[path].select { |f| File.file?(f) }.sample

      file ? File.new(path_to_file) : path_to_file
    end

    def download(query)
      #TODO: make downloading pictures to gem
    end

    def self.define_methods(path_to_directory, *method_names)
      method_names.each do |name|
        define_singleton_method :"#{name}" do
          self.superclass.random_file("#{path_to_directory + PACK_PATH}/#{name}-*.webp")
        end

        define_singleton_method :"#{name}_file" do
          self.superclass.random_file("#{path_to_directory + PACK_PATH}/#{name}-*.webp", file: true)
        end

        define_singleton_method :random do
          self.superclass.random_file("#{path_to_directory + self::PACK_PATH}/*.webp")
        end

        define_singleton_method :random_file do
          self.superclass.random_file("#{path_to_directory + self::PACK_PATH}/*.webp", file: true)
        end
      end
    end
  end
end

# require fake_picture objects
Dir.glob(File.join(__dir__, 'fake_picture', '/**/*.rb')).sort.each { |file| require file }

# add photos like icons animals posts avatarsма
