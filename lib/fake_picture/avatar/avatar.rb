module FakePicture
  class Avatar < Base
    initialize_fake_picture_methods(:man, :woman, new_random_method_name: :person)
  end
end
