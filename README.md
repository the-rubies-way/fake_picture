[![Actions Status](https://github.com/loqimean/fake_picture/actions/workflows/CI.yml/badge.svg)](https://github.com/loqimean/fake_picture/actions)

# FakePicture

Welcome to my new gem! This is a gem for simple seeding, testing and etc by uploading fake pictures. Now you don't need create too many flders with pictures, because you can use this gem which can give you path to random picture of selectedd category or file, if you need it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fake_picture'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install fake_picture

## Usage

###### FakePicture::Avatar:

```ruby
FakePicture::Avatar.man     #=>  /Users/username/workdirectory/fake_picture/lib/fake_picture/avatar/pack/man-4.jpg

FakePicture::Avatar.woman   #=>  /Users/username/workdirectory/fake_picture/lib/fake_picture/avatar/pack/woman-4.jpg
```

You can also call method `person` if you want to get random `avatar`:

```ruby
FakePicture::Avatar.person     #=> "/Users/xi-master/Workplace/fake_picture/lib/fake_picture/avatar/pack/woman-5.svg"
```

###### FakePicture::Blog:

```ruby
FakePicture::Blog.preview    #=>  /Users/username/workdirectory/fake_picture/lib/fake_picture/blog/pack/preview-4.jpg
```

###### FakePicture::People:

```ruby
FakePicture::People.man     #=>  /Users/username/workdirectory/fake_picture/lib/fake_picture/people/pack/man-4.jpg

FakePicture::People.woman   #=>  /Users/username/workdirectory/fake_picture/lib/fake_picture/people/pack/woman-4.jpg
```

#### As file:

You can also call a method `file` with method name of this class if you wanna get picture as file for some actions, like this:

```ruby
FakePicture::People.file(:man)   #=> #<File:/Users/xi-master/Workplace/fake_picture/lib/fake_picture/avatar/pack/man-6.svg>
```

#### In factories:

```ruby
FactoryBot.define do
  factory :gallery do
    file { FakePicture::Blog.file(:preview) }
  end
end
```

#### In specs:

```ruby
it 'some create user test' do
    post :create, params: {
        user: {
            name: 'John',
            avatar: FakePicture::Avatar.file(:man)
        }
    }
end
```

#### In seeds:

```ruby
User.create(name: 'John', avatar: FakePicture::Avatar.file(:man))
```

## Development

Run `rake spec` to run the tests. You can also run `rake console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/loqimean/fake_picture.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
