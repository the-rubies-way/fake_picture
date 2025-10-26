# frozen_string_literal: true
require 'base64'
require 'net/http'
require 'uri'
require 'fileutils'

module FakePicture
  class Base
    def self.random_file(path)
      path_to_file = Dir[path].select { |f| File.file?(f) }.sample

      return false if path_to_file.nil?

      path_to_file
    end

    def self.download(width, height, service: :picsum, query: nil, grayscale: false, output_path: nil)
      url = build_url(width, height, service, query, grayscale)
      
      uri = URI.parse(url)
      response = fetch_image(uri)
      
      return false unless response.is_a?(Net::HTTPSuccess)
      
      if output_path
        FileUtils.mkdir_p(File.dirname(output_path))
        File.open(output_path, 'wb') { |file| file.write(response.body) }
        output_path
      else
        response.body
      end
    rescue StandardError => e
      warn "Failed to download image: #{e.message}"
      false
    end

    private_class_method def self.build_url(width, height, service, query, grayscale)
      case service
      when :picsum
        grayscale_param = grayscale ? '?grayscale' : ''
        "https://picsum.photos/#{width}/#{height}#{grayscale_param}"
      when :loremflickr
        grayscale_param = grayscale ? '/g' : ''
        query_param = query || 'all'
        "https://loremflickr.com#{grayscale_param}/#{width}/#{height}/#{query_param}"
      else
        raise ArgumentError, "Unsupported service: #{service}. Use :picsum or :loremflickr"
      end
    end

    private_class_method def self.fetch_image(uri, limit = 10)
      raise ArgumentError, 'Too many HTTP redirects' if limit == 0

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      http.open_timeout = 10
      http.read_timeout = 10
      
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)

      case response
      when Net::HTTPRedirection
        location = URI.parse(response['location'])
        location = URI.join(uri, location) if location.relative?
        fetch_image(location, limit - 1)
      else
        response
      end
    end

    def self.initialize_methods(*method_names, new_random_method_name: nil) # from line 17 to 24 make code better
      path_to_pack = "#{__dir__}/fake_picture/#{self.name.split('::').last.downcase}/pack"

      self.superclass.check_pack_directory_readiness(path_to_pack)

      [*method_names, :random].each do |name|
        selector = name == :random ? '/*' : "/#{name}-*"
        name = new_random_method_name if name == :random && !new_random_method_name.nil?

        define_singleton_method :"#{name}" do
          self.superclass.random_file(path_to_pack + selector)
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
