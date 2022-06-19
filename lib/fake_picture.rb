# frozen_string_literal: true
require 'base64'

module FakePicture
  class Base
    def self.random_file(path)
      path_to_file = Dir[path].select { |f| File.file?(f) }.sample

      return false if path_to_file.nil?

      path_to_file
    end

    # def download(query)
      #TODO: make downloading pictures to gem by a service: https://source.unsplash.com/random/<width>x<height>
    # end

    def self.initialize_fake_picture_methods(*method_names, new_random_method_name: nil) # from line 17 to 24 make code better
      path_to_pack = "#{__dir__}/fake_picture/#{self.name.split('::').last.downcase}/pack"

      self.superclass.check_pack_directory_readiness(path_to_pack)

      [*method_names, :random].each do |name|
        selector = name == :random ? '/*' : "/#{name}-*"
        name = new_random_method_name if name == :random && !new_random_method_name.nil?

        define_singleton_method :"#{name}" do
          self.superclass.random_file("#{path_to_pack +  selector}")
        end
      end

      define_singleton_method :file do |method_name|
        File.new(self.send(method_name))
      end

      define_singleton_method :base64 do |method_name|
        Base64.encode64(File.read(self.send(method_name)))
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
