# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)

require 'bundler'
Bundler::GemHelper.install_tasks

desc 'Start a console session with FakePicture loaded'
task :console do
  require 'irb'
  require 'irb/completion'
  require 'debug'
  require 'fake_picture' # You know what to do.

  ARGV.clear
  IRB.start
end
