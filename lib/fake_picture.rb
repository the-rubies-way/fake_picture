# frozen_string_literal: true

module FakePicture
  class Base
    PACK_PATH = '/pack'

    def self.random_file(path, file: false)
      path_to_file = Dir[path].select { |f| File.file?(f) }.sample

      return false if path_to_file.nil?

      file ? File.new(path_to_file) : path_to_file
    end

    # def download(query)
      #TODO: make downloading pictures to gem
    # end

    def self.define_methods(path_to_directory, *method_names)
      method_names.each do |name|
        define_singleton_method :"#{name}" do
          self.superclass.check_pack_directory_readiness(path_to_directory + PACK_PATH)

          self.superclass.random_file("#{path_to_directory + PACK_PATH}/#{name}-*")
        end

        define_singleton_method :"#{name}_file" do
          self.superclass.check_pack_directory_readiness(path_to_directory + PACK_PATH)

          self.superclass.random_file("#{path_to_directory + PACK_PATH}/#{name}-*", file: true)
        end

        define_singleton_method :random do
          self.superclass.check_pack_directory_readiness(path_to_directory + PACK_PATH)

          self.superclass.random_file("#{path_to_directory + self::PACK_PATH}/*")
        end

        define_singleton_method :random_file do
          self.superclass.check_pack_directory_readiness(path_to_directory + PACK_PATH)

          self.superclass.random_file("#{path_to_directory + self::PACK_PATH}/*", file: true)
        end
      end
    end

    private

    def self.check_pack_directory_readiness(path)
      raise 'Pack folder doesn\'t exist or empty' unless File.directory?(path) and !Dir.empty?(path)
    end
  end
end

# require fake_picture objects
Dir.glob(File.join(__dir__, 'fake_picture', '/**/*.rb')).sort.each { |file| require file }

# add photos like logos, animals, "for posts"
