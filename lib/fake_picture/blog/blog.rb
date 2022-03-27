module FakePicture
  class Blog < Base
    define_methods(__dir__, :day_street, :night_street)
  end
end
